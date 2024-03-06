import 'package:intl/intl.dart';

class Order {
  final String orderCode;
  final String optionOrderCode;
  final String fullName;
  final String phone;
  final String price;
  final String date;
  final String oderStatus;
  final String orderId;

  Order(
      {required this.orderCode,
      required this.optionOrderCode,
      required this.fullName,
      required this.phone,
      required this.price,
      required this.date,
      required this.oderStatus,
      required this.orderId});

  factory Order.fromJson(Map<String, dynamic> json) {
    DateTime dateTime =
        DateTime.parse(json['time']).toUtc().add(Duration(hours: 7));
    String status = "";
    String formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
    String price = NumberFormat.decimalPattern().format(json['netAmount']);
    String optionOrderCode;
    String phone;
    final phonePattern =
        RegExp(r"(?:0|84)\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\D*\d\D*");
    if (json['statusOfOrder'] == 2) {
      status = "Đang giặt";
    } else if (json['statusOfOrder'] == 4) {
      status = "Chờ giao hàng";
    } else if (json['statusOfOrder'] == 5) {
      status = "Đã giao";
    }
    if (json['optionOrderCode'] == null) {
      optionOrderCode = json['orderCode'];
    } else {
      optionOrderCode = json['optionOrderCode'];
    }

    if (json['Contact']['phone'].toString().isNotEmpty) {
      phone = json['Contact']['phone'].toString();
    } else {
      try {
        final phones = phonePattern
            .allMatches(json['Contact']['fullName'].toString())
            .map((match) => match.group(0))
            .toList();
        phone = phones[0].toString();
      } catch (e) {
        phone = '';
      }
    }

    String name =
        json['Contact']['fullName'].toString().replaceAll(phonePattern, "");
    return Order(
        orderCode: json['orderCode'].toString(),
        optionOrderCode: optionOrderCode,
        fullName: name,
        phone: phone,
        price: price,
        date: formattedDate.toString(),
        oderStatus: status,
        orderId: json['orderId'].toString());
  }
}
