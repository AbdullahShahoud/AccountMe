
import 'package:accc/Account/Helper/add_prefix.dart';
import 'package:accc/Account/Widget/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 Map<String,double?> operation={};

class Operation extends StatefulWidget {
   Operation({super.key});
  @override
  State<Operation> createState() => _OperationState();
}
  
class _OperationState extends State<Operation> {
 var controller;
  


  @override
  void initState() {
    super.initState();
    controller=TextEditingController();
    // AccontCubit.get(context).operation.addAll(account);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
     backgroundColor: Theme.of(context).primaryColor,

        title: Text('الخصومات',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Group(
          controller: controller,
          name: operationName,
          value: operation,
          paddingWith:  MediaQuery.of(context).size.width *0.10.w,
         paddingHeight: 20.h
        ),
      ), 
    );
  }
}





