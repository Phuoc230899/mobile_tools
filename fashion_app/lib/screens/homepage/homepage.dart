import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_app/components/diamond_container.dart';
import 'package:fashion_app/screens/homepage/components/tab_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imageList = [
    {"id": 1, "image_path": "assets/images/panel_1.jpg"},
    {"id": 2, "image_path": "assets/images/panel_2.jpg"},
    {"id": 3, "image_path": "assets/images/panel_3.jpg"}
  ];
  List<String> tabs = ["All", "Apparel", "Dress", "Tshirt", "Bag"];
  List tabScreens = [
    const TabScreen(index: [1, 2, 3, 4]),
    const TabScreen(index: [2, 3, 4, 1]),
    const TabScreen(index: [3, 4, 1, 2]),
    const TabScreen(index: [4, 1, 2, 3]),
    const TabScreen(index: [1, 3, 4, 2])
  ];
  int current = 0;

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu,
            size: 30.h,
            color: Colors.black,
          ),
          title: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/svgfile/logo.svg')),
          actions: [
            Icon(
              CupertinoIcons.search,
              size: 30.h,
              color: Colors.black,
            ),
            SizedBox(
              width: 10.w,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(
                CupertinoIcons.bag,
                color: Colors.black,
                size: 30.h,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    print(currentIndex);
                  },
                  child: Container(
                    height: 500.h,
                    child: CarouselSlider(
                      items: imageList
                          .map((item) => Image.asset(
                                item['image_path'],
                                fit: BoxFit.fill,
                                width: double.maxFinite,
                                height: double.infinity,
                              ))
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                          height: 500.h,
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          }),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40.h,
                  left: 0,
                  right: 0,
                  // height: 40.h,
                  // width: 250.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 60.w, right: 60.w),
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: Colors.black.withAlpha(100),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(
                        child: Text(
                          'Explore Collection',
                          style: TextStyle(
                              fontFamily: 'Tenor Sans',
                              fontSize: 16.h,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10.h,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex == entry.key ? 17.w : 7.w,
                            height: 7.h,
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                color: currentIndex == entry.key
                                    ? Colors.white
                                    : Colors.transparent),
                          ),
                        );
                      }).toList(),
                    ))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 580.h,
              child: Column(children: [
                SvgPicture.asset("assets/svgfile/new_arrival.svg"),
                SizedBox(
                  height: 520.h,
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(top: 15.h),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 50.h,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: tabs.length,
                                itemBuilder: (context, index) {
                                  return Column(children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          tabs.length,
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 5.w, right: 5.w, top: 7.h),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              current = index;
                                            });
                                          },
                                          child: Text(
                                            tabs[index],
                                            style: TextStyle(
                                              fontSize: 14.h,
                                              fontFamily: "Tenor Sans",
                                              fontWeight: current == index
                                                  ? FontWeight.w400
                                                  : FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    index == current
                                        ? Container(
                                            // width: MediaQuery.of(context)
                                            //         .size
                                            //         .width /
                                            //     tabs.length,
                                            width: 8.h,
                                            height: 8.h,
                                            child: CustomPaint(
                                              painter: DiamondPainter(),
                                            ),
                                          )
                                        : SizedBox()
                                  ]);
                                }),
                          ),
                          SizedBox(
                            height: 450.h,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 50.h, left: 12.w, right: 12.w),
                                child: tabScreens[current],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      child: Text(
                        "Explore More ->",
                        style: TextStyle(
                            fontFamily: "Tenor Sans",
                            fontSize: 16.h,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ]),
                ),
              ]),
            ),
            SizedBox(
              child: SvgPicture.asset('assets/svgfile/branchs.svg'),
            ),
            SizedBox(
              height: 620.h,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: Center(
                    child: Text(
                      "COLLECTIONS",
                      style: TextStyle(
                          fontFamily: "Tenor Sans",
                          fontSize: 18.h,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Image.asset('assets/images/panel_4.png'),
                SizedBox(
                  height: 20.h,
                ),
                Stack(
                  children: [
                    Image.asset("assets/images/form3_2.png"),
                    Positioned(
                      right: 90.w,
                      top: 60.h,
                      child: Text(
                        "Autumn",
                        style: TextStyle(
                            fontFamily: "Bodoni Moda",
                            fontSize: 30.h,
                            color: const Color(0xff555555),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Positioned(
                      right: 80.w,
                      top: 95.h,
                      child: Text(
                        "C O L L E C T I O N",
                        style: TextStyle(
                          fontFamily: "Bodoni Moda",
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff555555),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/Video.png',
                  fit: BoxFit.cover,
                ))
          ],
        )));
  }
}
