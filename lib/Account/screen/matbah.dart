import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Matbah extends StatefulWidget {
  const Matbah({super.key});

  @override
  State<Matbah> createState() => _MatbahState();
}

class _MatbahState extends State<Matbah> {

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
     backgroundColor: Theme.of(context).primaryColor,

        title: Text('مطابخ',style: TextStyle(color: Colors.white),),
      ),
      body: Center(child: Text('في الاصدار القادم بأذن الله',
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight:FontWeight.w400,
        color: Theme.of(context).primaryColor, 
      ),
      ))
    );
  }
}