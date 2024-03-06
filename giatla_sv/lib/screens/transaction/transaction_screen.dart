import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giatla_sv/core/api/api_service.dart';
import 'package:giatla_sv/core/api/zns.dart';
import 'package:giatla_sv/screens/transaction/model/oder.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final api = APIService();
  late List<Order> listOrder;
  final znsApi = ZNSService();

  Future<void> getOrder() async {
    // try {
    //   var result = await api.fetchData();
    //   // print(result);
    //   setState(() {
    //     listOrder = result;
    //   });
    // } on Exception catch (e) {
    //   if (e.toString().contains("401 Author")) {
    //     // if (await api.refreshToken()) {
    //     //   getOrder();
    //     // }
    //     try {
    //       bool check = await api.refreshToken();
    //       if (check) {
    //         getOrder();
    //       }
    //     } on Exception catch (e) {
    //       if (e.toString().contains("402 Author")) {
    //         await api.login();
    //         getOrder();
    //       }
    //     }
    //   }
    // }
    EasyLoading.show(status: 'Loading...');
    var result = await api.fetchData();
    // print(result);
    setState(() {
      listOrder = result;
    });
    EasyLoading.dismiss();
  }

  Future<void> _refresh() async {
    getOrder();
  }

  Future<bool> sendZNS(name, phone_number, orderCode, date, price) async {
    return await znsApi.sendZNS(name, phone_number, orderCode, date, price);
  }

  Future<bool> updateStatus(orderId) async {
    return await api.updateStatus(orderId);
  }

  // Future<void> setFirst() async {
  //   await znsApi.setfirst();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listOrder = [];
    getOrder();
    // setFirst();
  }

  Future<void> setToken() async {
    await api.setToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: () => _refresh(),
          child: CustomScrollView(slivers: <Widget>[
              SliverAppBar(
          backgroundColor: Colors.black,
          pinned: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.refresh_outlined,
                size: 20.h,
                color: Colors.white,
              ),
              onPressed: () {
                getOrder();
              },
            ),
          ],
          title: Text(
            "Giao Dịch",
            style: TextStyle(fontSize: 15.h, color: Colors.white),
          ),
              ),
              // listOrder.isNotEmpty
              SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                elevation: 0.1,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Container(
                  height: 120.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(listOrder[index].optionOrderCode,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15.h,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(listOrder[index].fullName,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.h,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text("SĐT",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.h,
                                          )),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(": ${listOrder[index].phone}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.h,
                                            ))),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text("Tổng tiền",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.h,
                                          )),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child:
                                          Text(": ${listOrder[index].price} VNĐ",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11.h,
                                              )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text("Ngày",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.h,
                                          )),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(": ${listOrder[index].date}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.h,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30.h,
                                      // width: 80.w,
                                      constraints: const BoxConstraints(
                                          maxWidth: double.infinity),
                                      decoration: BoxDecoration(
                                          color: listOrder[index].oderStatus ==
                                                  "Đã giao"
                                              ? Colors.lightGreen.withOpacity(0.2)
                                              : listOrder[index].oderStatus ==
                                                      "Đang giặt"
                                                  ? const Color.fromARGB(
                                                          255, 130, 117, 2)
                                                      .withOpacity(0.2)
                                                  : const Color.fromARGB(
                                                          255, 3, 95, 170)
                                                      .withOpacity(0.2),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                        child: Text(listOrder[index].oderStatus,
                                            style: TextStyle(
                                                color: listOrder[index]
                                                            .oderStatus ==
                                                        "Đã giao"
                                                    ? Colors.lightGreen
                                                    : listOrder[index]
                                                                .oderStatus ==
                                                            "Đang giặt"
                                                        ? const Color.fromARGB(
                                                            255, 130, 117, 2)
                                                        : const Color.fromARGB(
                                                            255, 3, 95, 170),
                                                fontSize: 13.h,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    listOrder[index].oderStatus == "Đang giặt"
                                        ? Container(
                                            height: 30.h,
                                            width: 80.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10))),
                                            child: Center(
                                              child: IconButton(
                                                  onPressed: () async {
                                                    showDialog(
                                                      context: context,
                                                      builder:
                                                          (BuildContext context) {
                                                        return AlertDialog(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                          ),
                                                          title: const Text(
                                                              'THÔNG TIN CHI TIẾT',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          content: Container(
                                                              height: 120.h,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      const Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          "MÃ ĐƠN",
                                                                          style: TextStyle(
                                                                              fontWeight:
                                                                                  FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child: Text(
                                                                            ": ${listOrder[index].optionOrderCode.toString()}"),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10.h,
                                                                  ),
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      const Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          "TÊN",
                                                                          style: TextStyle(
                                                                              fontWeight:
                                                                                  FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child: Text(
                                                                            ": ${listOrder[index].fullName}"),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10.h,
                                                                  ),
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      const Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          "SĐT",
                                                                          style: TextStyle(
                                                                              fontWeight:
                                                                                  FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child: Text(
                                                                            ": ${listOrder[index].phone.toString()}"),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10.h,
                                                                  ),
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      const Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          "GIÁ TIỀN",
                                                                          style: TextStyle(
                                                                              fontWeight:
                                                                                  FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child: Text(
                                                                            ": ${listOrder[index].price.toString()}"),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10.h,
                                                                  ),
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      const Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          "NGÀY GỬI",
                                                                          style: TextStyle(
                                                                              fontWeight:
                                                                                  FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child: Text(
                                                                            ": ${listOrder[index].date.toString()}"),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              )),
                                                          actions: [
                                                            // TextButton(
                                                            //   onPressed: () {
                                                            //     Navigator.of(
                                                            //             context)
                                                            //         .pop(true);
                                                            //   },
                                                            //   child:
                                                            //       Text('Đồng ý'),
                                                            // ),
                                                            ButtonBar(
                                                              alignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .lightGreen,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5.0),
                                                                      ),
                                                                    ),
                                                                    onPressed: () =>
                                                                        Navigator.of(
                                                                                context)
                                                                            .pop(
                                                                                true),
                                                                    child:
                                                                        const Text(
                                                                      "ĐỒNG Ý",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )),
                                                                ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5.0),
                                                                      ),
                                                                    ),
                                                                    onPressed: () =>
                                                                        Navigator.of(
                                                                                context)
                                                                            .pop(
                                                                                false),
                                                                    child:
                                                                        const Text(
                                                                      "    HỦY    ",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )),
                                                              ],
                                                            ),
        
                                                            // TextButton(
                                                            //   onPressed: () {
                                                            //     Navigator.of(
                                                            //             context)
                                                            //         .pop(false);
                                                            //   },
                                                            //   child: Text('Hủy'),
                                                            // ),
                                                          ],
                                                        );
                                                      },
                                                    ).then((confirmed) async {
                                                      if (confirmed) {
                                                        if (listOrder[index]
                                                            .phone
                                                            .isNotEmpty) {
                                                          EasyLoading.show(
                                                              status:
                                                                  'Seding...');
                                                          int netAmountInt =
                                                              int.parse(
                                                                  listOrder[index]
                                                                      .price
                                                                      .replaceAll(
                                                                          ',',
                                                                          ''));
                                                          DateFormat inputFormat =
                                                              DateFormat(
                                                                  'dd-MM-yyyy HH:mm');
                                                          DateFormat
                                                              outputFormat =
                                                              DateFormat(
                                                                  'HH:mm dd/MM/yyyy');
                                                          DateTime dateTime =
                                                              inputFormat
                                                                  .parse(listOrder[
                                                                          index]
                                                                      .date)
                                                                  .toUtc()
                                                                  .add(Duration(
                                                                      hours: 7));
                                                          String formattedString =
                                                              outputFormat.format(
                                                                  dateTime);
                                                          try {
                                                            bool isSendZns =
                                                                await sendZNS(
                                                                    listOrder[
                                                                            index]
                                                                        .fullName,
                                                                    listOrder[
                                                                            index]
                                                                        .phone,
                                                                    listOrder[
                                                                            index]
                                                                        .optionOrderCode,
                                                                    formattedString,
                                                                    netAmountInt);
                                                            bool isUpdate =
                                                                await updateStatus(
                                                                    listOrder[
                                                                            index]
                                                                        .orderId);
                                                            if (isSendZns &&
                                                                isUpdate) {
                                                              setState(() {
                                                                getOrder();
                                                              });
                                                              EasyLoading.showSuccess(
                                                                  "Send Success");
                                                            } else {
                                                              setState(() {
                                                                getOrder();
                                                              });
                                                              EasyLoading.showError(
                                                                  "Send Faild !");
                                                            }
                                                          } catch (e) {
                                                            if (e.toString().contains(
                                                                '-118 So dth khong su dung zalo')) {
                                                              EasyLoading.showError(
                                                                  "Số điện thoại không có zalo");
                                                            } else if (e
                                                                .toString()
                                                                .contains(
                                                                    '401 not auth')) {
                                                              EasyLoading.showError(
                                                                  "Lỗi token zalo");
                                                            } else {
                                                              EasyLoading.showError(
                                                                  "Send Faild !");
                                                            }
                                                          }
                                                        } else {
                                                          EasyLoading.showError(
                                                              "Số điện thoại rỗng!");
                                                        }
                                                      } else {
                                                        print(
                                                            'Hành động đã bị hủy bỏ!');
                                                      }
                                                    });
                                                  },
                                                  icon: const Icon(
                                                    Icons.send,
                                                  )),
                                            ))
                                        : const SizedBox()
                                  ],
                                ),
                              ))
                        ]),
                  ),
                ),
              );
            },
            childCount: listOrder.length,
          ),
              )
              // : SliverList(delegate:
              //     SliverChildBuilderDelegate((BuildContext context, int index) {
              //     return Container(
              //       child: Center(
              //           child: Text(
              //         "Danh Sách Rỗng!!!",
              //         style: TextStyle(
              //             fontSize: 30.h,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.black),
              //       )),
              //     );
              //   },
              //     childCount:1,
              //   )),
            ]),
        ));
  }
}

// appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         title: Text(
//           "Giao Dịch",
//           style: TextStyle(fontSize: 15.h, color: Colors.white),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 16.w),
//             child: Icon(
//               Icons.share_outlined,
//               size: 20.h,
//               color: Colors.white,
//             ),
//           )
//         ],
//       ),
