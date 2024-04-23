import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabScreen extends StatefulWidget {
  final List index;
  const TabScreen({super.key, required this.index});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/fashion_${widget.index[0]}.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "21WN reversible angora cardigan",
                        style: TextStyle(
                            fontFamily: "Tenor Sans",
                            fontSize: 12.h,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "\$120",
                        style: TextStyle(
                            fontSize: 14.h, color: const Color(0xffDD8560)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/fashion_${widget.index[1]}.png',
                          // width: double.maxFinite,
                          // height: double.maxFinite,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "21WN reversible angora cardigan",
                        style: TextStyle(
                            fontFamily: "Tenor Sans",
                            fontSize: 12.h,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "\$120",
                        style: TextStyle(
                            fontSize: 14.h, color: const Color(0xffDD8560)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5.w,
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/fashion_${widget.index[2]}.png',
                          // width: double.maxFinite,
                          // height: double.maxFinite,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "21WN reversible angora cardigan",
                        style: TextStyle(
                            fontFamily: "Tenor Sans",
                            fontSize: 12.h,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "\$120",
                        style: TextStyle(
                            fontSize: 14.h, color: const Color(0xffDD8560)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/fashion_${widget.index[3]}.png',
                          // width: double.maxFinite,
                          // height: double.maxFinite,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "21WN reversible angora cardigan",
                        style: TextStyle(
                            fontFamily: "Tenor Sans",
                            fontSize: 12.h,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "\$120",
                        style: TextStyle(
                            fontSize: 14.h, color: const Color(0xffDD8560)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
