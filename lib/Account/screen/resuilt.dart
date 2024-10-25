// ignore_for_file: must_be_immutable


// import 'dart:js';

import 'package:accc/bloc/cubit/cubit/accont_cubit.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Resuilt extends StatefulWidget {
   Resuilt({super.key});

  @override
  State<Resuilt> createState() => _ResuiltState();
}

class _ResuiltState extends State<Resuilt> {
     List<Widget>widget1=[];
    List<Widget>widget2=[];
    List<Widget>widget3=[]; 
  @override
  void initState() {
    super.initState();
   widget1=List.generate(
    AccontCubit.get(context).windows.length,
   (index) => 
      Container(
        height: 300.h,
        width: 90.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(103, 36, 124, 36),
        ),
        child: Text(
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w200,
            color: Colors.black
          ),
        '${AccontCubit.get(context).windows[index].width}    سفلي\n'
        '${AccontCubit.get(context).windows[index].width}    علوي\n'
        '${AccontCubit.get(context).windows[index].msce}   شنكل\n'
        '${AccontCubit.get(context).windows[index].msce}   مسكة\n'
        '${AccontCubit.get(context).windows[index].height}   جنب\n'
        '${AccontCubit.get(context).windows[index].kab}   كعب\n'       
'${AccontCubit.get(context).windows[index].mngl_height}   منخل طول\n'    '${AccontCubit.get(context).windows[index].mngl_width}   منخل عرض\n',

        )),
  );
   widget2=List.generate(
    AccontCubit.get(context).door.length,
   (index) => 
      Container(
        height: 260.h,
        width: 80.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(103, 36, 124, 36),
        ),
        child: Text(
          style: TextStyle(
       fontSize: 17.sp,
            fontWeight: FontWeight.w200,
            color: Colors.black
          ),
          '${AccontCubit.get(context).door[index].height}    كادر طول\n'
        '${AccontCubit.get(context).door[index].width}    كادر عرض\n'
        '${AccontCubit.get(context).door[index].heightInsude}   درفة طول\n'
        '${AccontCubit.get(context).door[index].widthtInsude}   درفة عرض\n'
        '${AccontCubit.get(context).door[index].kab}     كعب\n'
        )),
  );
   widget3=List.generate(
    AccontCubit.get(context).windowsSmall.length,
   (index) => 
      Container(
        height: 180.h,
        width: 40.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(103, 36, 124, 36),
        ),
        child: Text(
          style: TextStyle(
           fontSize: 17.sp,
            fontWeight: FontWeight.w200,
              color: Colors.black
          ),
          '${AccontCubit.get(context).windowsSmall[index].height}      كادر طول\n'
        '${AccontCubit.get(context).windowsSmall[index].width}     كادر عرض\n'
        '${AccontCubit.get(context).windowsSmall[index].heightInsude}   درفة طول\n'
        '${AccontCubit.get(context).windowsSmall[index].widthtInsude}   درفة عرض\n'
        )),
  ); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
         backgroundColor:Theme.of(context).primaryColor,
        title: Text('النتيجة',
        style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<AccontCubit, AccontState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // var cubit= AccontCubit.get(context);
          return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('شباك',
                            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold,
          color:Theme.of(context).primaryColor)
                    ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                                            ( crossAxisCount:2,
                                        mainAxisSpacing: 8.h,
                                        crossAxisSpacing: 8.h,
                                        childAspectRatio: 3.7/4.h,
                                            ),      
                                       itemBuilder: (context, index) => widget1[index],
                                       itemCount: widget1.length,
                                      ),
                       Text('باب',style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold,
          color:Theme.of(context).primaryColor)
                    ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                                            ( crossAxisCount:2,
                                        mainAxisSpacing: 8.h,
                                        crossAxisSpacing: 8.h,
                                        childAspectRatio: 6/4.h,
                                            ),      
                                       itemBuilder: (context, index) => widget2[index],
                                       itemCount: widget2.length,
                                      ),
                   Text('نافذة صغيرة',
                   style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold,
          color:Theme.of(context).primaryColor)
                   ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                                            ( crossAxisCount:2,
                                        mainAxisSpacing: 8.h,
                                        crossAxisSpacing: 8.h,
                                        childAspectRatio: 7/4.h.h,
                                            ),      
                                       itemBuilder: (context, index) => widget3[index],
                                       itemCount: widget3.length,
                                      ),
                          ],
                        ),
                      ),
                    );
 
}
     ) );
}}



