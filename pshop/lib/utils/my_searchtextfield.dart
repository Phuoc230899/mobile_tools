import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySearchTextField extends StatefulWidget {
  final searchController;
  const MySearchTextField({super.key, required this.searchController});

  @override
  State<MySearchTextField> createState() => _MySearchTextFieldState();
}

class _MySearchTextFieldState extends State<MySearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      child: TextFormField(
        controller: widget.searchController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: 'Search',
          fillColor: Theme.of(context).colorScheme.primary,
          filled: true,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.h),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.secondary,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.transparent)),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Colors.transparent, // Màu của viền khi focus
            ),
          ),
        ),
      ),
    );
  }
}
