// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/cubit/cubit/accont_cubit.dart';
import '../Widget/component.dart';
import 'resuilt.dart';
import 'package:accc/Account/screen/prefix.dart';
   NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
class Bussines extends StatefulWidget {

  Bussines({
 super.key
  });

  @override
  State<Bussines> createState() => _BussinesState();
}

class _BussinesState extends State<Bussines> {
   TextEditingController? controller1;

 TextEditingController? controller2;
@override
  void initState() {
    super.initState();
    // Initialization code here
    controller1 = TextEditingController(text: '');
    controller2 = TextEditingController(text: '');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text(
          'التكلفة',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Theme.of(context).disabledColor,
            borderRadius: BorderRadius.circular(60)),
        child: BlocConsumer<AccontCubit, AccontState>(
          
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit=AccontCubit.get(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                FormFields(
                  width: MediaQuery.of(context).size.width / 2.w,
        controll: controller1!,
        label: 'السعر للكيلو',
        icon: Icons.attach_money,
      ),
                SizedBox(height: 40.h),
        FormFields(
                width:MediaQuery.of(context).size.width / 2.w ,
        controll: controller2!,
        label: ' تكاليف تركيب',
        icon: Icons.attach_money,
      ),
                SizedBox(height: 30.h),
                Item(
                  title: 'الوزن الكلي',
                  text: '${cubit.accountWeightTotal().toStringAsFixed(2)}    كغ',
                ),
                SizedBox(height: 30.h),
                Item(
                  title: 'أمتار البلور',
                  text:'${cubit.accountAreaGlasses().toStringAsFixed(2)}   سم',
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                button(padding: MediaQuery.of(context).size.width /8.w,
                 text: 'حساب', function: () {
                  print(prefixvalue);
                  if(controller1?.text !=''&& controller2?.text !=''){
                    cubit.accountprefix();
                    cubit.accountTotalMarket(
                    cubit.accountMarketAluminem(
                      cubit.accountWeightTotal(),
                    double.parse(controller1!.text) ,
                   ) ,
                   double.parse(controller2!.text) 
                  );
                  showModalBottomSheet(
                    context: context,
                     builder: ((context) => 
                     Padding(
                        padding: const EdgeInsets.all(30.0),
                       child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Theme.of(context).disabledColor,
                                ),
                         child: BlocConsumer<AccontCubit, AccontState>(
                           listener: (context, state) {
                             // TODO: implement listener
                           },
                           builder: (context, state) {
                             return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                 Item(title: 'التكلفة', text: '${(numberFormat.format(cubit.totalMark))}'),
                                  SizedBox(height: 40.h,),
                                   Item(title: 'الربح', text: '${(numberFormat.format(cubit.account()))}'),
                                ],
                              );
                           },
                         ),
                       ),
                     )
                     ));
               
                }else{}
                }),
                button(padding: MediaQuery.of(context).size.width /8.w,
                 text: 'تغاصيل', function: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>Resuilt())));
                }
                ),

                  ],
                )
               
              ],
            );
          },
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  late String text;
  late String title;

  Item({
    required this.title,
    required this.text,
  
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      BoxText(paddingWidth: MediaQuery.of(context).size.width * 0.15.w,
       paddingHeight: 30.h, text: text),
      Text(
        title,
        style: TextStyle(
            fontSize: 18.sp, fontWeight: FontWeight.bold, color: 
            Theme.of(context).primaryColor
            ),
      )
    ]);
  }
}