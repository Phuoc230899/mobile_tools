import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giatla_sv/screens/home/component/nav_bar.dart';
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SvgPicture.asset(
                'assets/images/washing-machine.svg',
                width: 50.w,
                height: 50.h,
              ),
              Center(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bar_chart_rounded,
                      color: Colors.white,
                      size: 40.h,
                    )),
              )
            ]),
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
                          EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
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
                        left: 12.w,
                        right: 12.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Thanh toán hóa đơn',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.h,
                                fontWeight: FontWeight.w500),
                          ),
                          TicketWidget(
                            width: 80.w,
                            height: 20.h,
                            color: const Color(0xFF24913E),
                            isCornerRounded: true,
                            child: Center(
                                child: Text(
                              "-50%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.h,
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
                        left: 12.w,
                        right: 12.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Càng dùng nhiều càng lợi nhiều',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.h,
                                fontWeight: FontWeight.w500),
                          ),
                          TicketWidget(
                            width: 80.w,
                            height: 20.h,
                            color: const Color(0xFF24913E),
                            isCornerRounded: true,
                            child: Center(
                                child: Text(
                              "-30%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.h,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBarWidget(),
    );
  }
}
