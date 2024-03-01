import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giatla_sv/utils/custom_paint.dart';
import 'package:ticket_widget/ticket_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/images/washing-machine.svg',
              width: 50.w,
              height: 50.h,
            ),
            SizedBox(
              height: 5.h,
            ),
            const Text(
              "  Xin Chào,",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Giặt Là SV!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.h,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 120.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color(0xff27272a),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                      child: Row(children: [
                        Icon(
                          Icons.star,
                          size: 20.h,
                          color: const Color(0xFF24913E),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Text(
                          "Ưu đãi",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.h,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Thanh toán hóa đơn',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.h,
                                fontWeight: FontWeight.w500),
                          ),
                          TicketWidget(
                            width: 80.w,
                            height: 20.h,
                            color: const Color(0xFF24913E),
                            isCornerRounded: true,
                            child: const Center(
                                child: Text(
                              "-50%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 1.h,
                    //   color: Colors.white,
                    // ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Càng dùng nhiều càng lợi nhiều',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.h,
                                fontWeight: FontWeight.w500),
                          ),
                          TicketWidget(
                            width: 80.w,
                            height: 20.h,
                            color: const Color(0xFF24913E),
                            isCornerRounded: true,
                            child: const Center(
                                child: Text(
                              "-30%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: ,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person,color: Colors.black,),
      //       label: 'Tài Khoản',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.share,color: Colors.black,),
      //       label: 'Giao Dịch',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.star,color: Colors.black,),
      //       label: 'Ưu Đãi',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.more_horiz,color: Colors.black,),
      //       label: 'Khác',
      //     ),
      //   ],
      //   // currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.white,
      //   // onTap: _onItemTapped,
      // ),
    );
  }
}
