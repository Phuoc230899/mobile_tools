import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTransactionWidget extends StatefulWidget {
  const ListTransactionWidget({super.key});

  @override
  State<ListTransactionWidget> createState() => _ListTransactionWidgetState();
}

class _ListTransactionWidgetState extends State<ListTransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 50.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
            child: Column(children: [
              Row(children: [
                Text("HDW123456",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15.h,
                        fontWeight: FontWeight.bold))
              ],)
            ]),),
      ),
    ]);
  }
}
