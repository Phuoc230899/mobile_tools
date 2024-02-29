import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:photo_manager/photo_manager.dart';

class Save2Gallery {
  Future<bool> saveToGallery(String url) async {
    var response = await http.get(Uri.parse(url));
    String contentType = response.headers['content-type'] ?? '';
    if (contentType.contains('image')) {
      if (response.statusCode == 200) {
        final result = await ImageGallerySaver.saveImage(
            Uint8List.fromList(response.bodyBytes));
        return true;
      } else {
        print('Failed to download image');
        return false;
      }
    } else if (contentType.contains('video')) {
      if (response.statusCode == 200) {
        final appDocDirectory = await getExternalStorageDirectory();
        String fileName = path.basename(url);
        final dio = Dio();
        final finalVideoPath = join(
          appDocDirectory!.path,
          '${fileName}.mp4',
        );
        await dio.download(
          url,
          finalVideoPath,
          onReceiveProgress: (actualBytes, totalBytes) {
            final percentage = actualBytes / totalBytes * 100;
          },
        );
        ImageGallerySaver.saveFile(finalVideoPath);
        return true;
      } else {
        print('Failed to download image');
        return false;
      }
    }
    return false;
  }

  Future<void> deleteAllVideos() async {
    try {
      List<AssetEntity> enti = await PhotoManager.getAssetListRange(
          start: 0, end: 80, type: RequestType.video);
      List<String> ids = enti.map((asset) => asset.id).toList();
      PhotoManager.editor.deleteWithIds(ids);
      print('Đã xóa tất cả ảnh, video.');
    } catch (e) {
      print('Lỗi khi xóa video: $e');
    }
  }

  Future<void> deleteToGallery() async {
    try {
      final PermissionState ps = await PhotoManager.requestPermissionExtend();
      if (ps.isAuth) {
        final List<AssetPathEntity> photoManager =
            await PhotoManager.getAssetPathList(type: RequestType.image);

        for (var manager in photoManager) {
          List<AssetEntity> assets =
              await manager.getAssetListPaged(page: 0, size: 80);
          List<String> ids = assets.map((asset) => asset.id).toList();
          // for (var asset in assets) {
          //   var file = await asset.file;
          //   if (await file!.exists()) {
          //     await file.delete();
          //     print(file);
          //   }
          // }
          PhotoManager.editor.deleteWithIds(ids);
          // PhotoManager.editor.android.moveToTrash(assets);
        }
      }
    } catch (e) {
      print('Error delete image to gallery: $e');
    }
  }
}
