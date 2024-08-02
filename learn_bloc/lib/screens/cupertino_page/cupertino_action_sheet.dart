import 'package:flutter/cupertino.dart';
import 'package:learn_bloc/screens/cupertino_page/activity_indicator.dart';
import 'package:learn_bloc/screens/cupertino_page/datetime_picker_page.dart';
import 'package:learn_bloc/screens/cupertino_page/download_btn.dart';

class ActionSheetPage extends StatelessWidget {
  const ActionSheetPage({super.key});

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Bạn muốn Đăng Xuất'),
        message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => const CupertinoIndicatorExample()),
              );
            },
            child: const Text('Cupertino Activity Page'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => const BtnDownloadExample()),
              );
            },
            child: const Text('Button Download Cupertino'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => const DatePickerExample()),
              );
            },
            child: const Text('Date Time Picker Page'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoActionSheet Sample'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () => _showActionSheet(context),
          child: const Text('CupertinoActionSheet'),
        ),
      ),
    );
  }
}
