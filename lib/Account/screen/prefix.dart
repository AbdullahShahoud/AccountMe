// ignore_for_file: must_be_immutable

import 'package:accc/Account/Helper/add_prefix.dart';
import 'package:accc/Account/Widget/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Map<String,double?> prefixvalue={};

class Prefix extends StatefulWidget {
   Prefix({super.key});
  @override
  State<Prefix> createState() => _PrefixState();
}
  
class _PrefixState extends State<Prefix> {
 var controller;
  


  @override
  void initState() {
    super.initState();
    controller=TextEditingController();
    // for(int i=0;i<prefixvalue.length;i++){
    // AccontCubit.get(context).prefixN.addAll(prefixvalue);
    // }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
     backgroundColor: Theme.of(context).primaryColor, 

        title: Text('الإكسسوارات',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Group(
          controller: controller,
          name: prefixName,
          value: prefixvalue,
          paddingWith:  MediaQuery.of(context).size.width *0.17.w,
         paddingHeight: 20.h
        ),
      ),
    );
  }
}





