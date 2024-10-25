// ignore_for_file: must_be_immutable, unused_local_variable

import '../../bloc/cubit/cubit/accont_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:intl/intl.dart";
import '../Widget/component.dart';
import '../modul/door.dart';
import '../modul/window.dart';
import '../modul/window_small.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
            var  controllerwindowWidth  ;
            var     controllerwindowHeigh    ;
            var     controllerDoorWidth    ;
            var     controllerDoorHeigh    ;
            var     controllersmall1    ;
            var     controllersmall2    ;
            var     controllerprice    ;
             var    controllercontroller2    ;
            var    controllercontroller1    ;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  @override
  void initState() {
    super.initState();
                 controllerwindowWidth=TextEditingController( ) ;
                 controllerwindowHeigh=TextEditingController( )    ;
                 controllerDoorWidth=TextEditingController( )    ;
                 controllerDoorHeigh =TextEditingController( )   ;
                 controllersmall1=TextEditingController( )    ;
                 controllersmall2=TextEditingController( )    ;
                 controllerprice=TextEditingController( )    ;
                  controllercontroller2 =TextEditingController( )   ;
                controllercontroller1=TextEditingController( )    ;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawers(),
      // appBar: AppBar(
      //   iconTheme: IconThemeData(
      //     color: Colors.white
      //   ),
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: Text('الرئسية',
      //   style: TextStyle(
      //         color: Colors.white,
      //         fontSize: 20
      //       ),
        
      //   ),
      //   actions: [
      //     IconButton(onPressed: (){
      //       controllercontroller1.text=' ';
      //    AccontCubit.get(context).door.clear();
      //    AccontCubit.get(context).windows.clear();
      //    AccontCubit.get(context).windowsSmall.clear();
      //    AccontCubit.get(context).viewHeight.clear();
      //    AccontCubit.get(context).viewHeight.clear();
      //     },
      //      icon: Icon(Icons.refresh,color: Colors.white,))
      //   ],
      // ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: BlocConsumer<AccontCubit, AccontState>(
          listener: (context, state) {},
          builder: (context, state) =>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Forms(
                width:MediaQuery.of(context).size.width / 3 .w,
                controll: controllerwindowWidth,
                controll2: controllerwindowHeigh,
                text: 'نافذة', 
                textButon: 'إضافة',
                label1: 'عرض',
                label2: 'طول',
                icon2:  Icons.border_left_sharp,
                icon1: Icons.border_top_outlined ,
                
                function: (){
                  AccontCubit.get(context).windows.add( WindowBig(height:
                   double.parse(controllerwindowHeigh.text ), 
                   width:double.parse(controllerwindowWidth.text ),));
                    AccontCubit.get(context).viewHeight.add(
                   double.parse(controllerwindowHeigh.text )); 
                   AccontCubit.get(context).viewWidth.add(
                   double.parse(controllerwindowWidth.text ));
                   controllerwindowHeigh.text='';
                   controllerwindowWidth.text='';
                },
              ),
              SizedBox(height: 20.h),
              Forms(
                width:MediaQuery.of(context).size.width / 3 .w,
                controll: controllerDoorWidth,
                controll2: controllerDoorHeigh,
                icon2:  Icons.arrow_downward_outlined,
                icon1:Icons.arrow_back_sharp,
                text: 'باب',
                textButon: 'إضافة',
                label1: 'عرض',
                function: (){
                  AccontCubit.get(context).door.add(
                     Door(height: double.parse(controllerDoorHeigh.text ),
                  width: double.parse(controllerDoorWidth.text ),));
                   AccontCubit.get(context).viewWidth.add(
                   double.parse(controllerDoorWidth.text )); 
                   AccontCubit.get(context).viewHeight.add(
                   double.parse(controllerDoorHeigh.text ));
                   controllerDoorWidth.text='';
                   controllerDoorHeigh.text='';
                },
                label2: 'طول',
              ),
              SizedBox(height: 20.h),
              Forms(
                width:MediaQuery.of(context).size.width / 3.w ,
                controll: controllersmall1,
                controll2: controllersmall2,
                text: 'نافذة صغيرة',
                textButon: 'إضافة',
                label1: 'عرض',
                label2: 'طول',
                icon2:  Icons.border_left_sharp,
                icon1: Icons.border_top_outlined ,
                function: (){
                  AccontCubit.get(context).windowsSmall.add(
                    WindowSmall(width: double.parse(controllersmall1.text )
                    ,height:  double.parse(controllersmall2.text ),));
                  AccontCubit.get(context).viewWidth.add(
                   double.parse(controllersmall1.text )); 
                   AccontCubit.get(context).viewHeight.add(
                   double.parse(controllersmall2.text ));
                    controllersmall1.text='';
                   controllersmall2.text='';
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                  child: FormFields(
                    width: MediaQuery.of(context).size.width / 2,
                    controll: controllercontroller1,
                icon: Icons.attach_money,
                label: "سعر",
              )),
              SizedBox(
                height: 30.h,
              ),
              button(
                padding: MediaQuery.of(context).size.width / 3.w,
                text: 'حساب',
                function: () {
                  if(controllercontroller1.text!=''){
                  showModalBottomSheet(
                      context: context,
                      builder: ((context) => Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Theme.of(context).disabledColor,
                              ),
                              child: BlocConsumer<AccontCubit, AccontState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                },
                                builder: (context, state) {
                                  var cubit = AccontCubit.get(context);
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 7.0),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Text(
                                            'عدد الامتار الكلي',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black),
                                          ),
                                          trailing: Text(
                                            '${cubit.accountArea().toStringAsFixed(2)}',
                                            style: Theme.of(context).textTheme.titleLarge,
                                          ),
                                          style: ListTileStyle.drawer,
                                        ),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        ListTile(
                                          leading: Text(
                                            'الكلفة الكلية',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black),
                                          ),
                                          trailing: Text(
           '${(numberFormat.format(cubit.accountMouny(  double.parse(controllercontroller1!.text ),cubit.accountArea())))}',
                                            style: Theme.of(context).textTheme.titleLarge,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25.h,
                                        ),
BlocConsumer<AccontCubit, AccontState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Container(
                           margin: EdgeInsets.only(bottom: 7.h),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width - 100.w,
                            height: 160.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child:ListView.builder(
                              itemBuilder:(context, index) =>
                                Padding(
                                  padding: const EdgeInsets.only(right: 60.0,left: 60,top: 15),
                                  child: Text( 
   '${AccontCubit.get(context).viewWidth[index]} x ${AccontCubit.get(context).viewHeight[index] }',
                                    style:TextStyle(
                                      fontSize:16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                    ) ,                      
                                          ),
                                ),
                          itemCount: AccontCubit.get(context).viewHeight.length,
                               ) 
                          );
                },
              ),
             
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )));
                  }else{
                  }
                },
              )
            ],
          ) ,
        ),
      )),
    );
  }
}



  