// ignore_for_file: must_be_immutable

import 'package:accc/Account/screen/bussines.dart';
import 'package:accc/Account/screen/matbah.dart';
import 'package:accc/Account/screen/operation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'prefix.dart';

class Drawers extends StatefulWidget {
  const Drawers({super.key});

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
 
                //  Image.asset('assets/images/drawer.png'),
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
       width:220.w,
       height:450.h,
      child: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Image.asset('assets/images/drawer.png'),
          Container(
           alignment: Alignment.center,
           width:220.w,
             height:322.h,
             decoration: BoxDecoration(
             color: Theme.of(context).disabledColor,
             borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
             topRight: Radius.circular(25))
             ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Item(text: 'الإكسسوارات',
                       icon: Icons.build,
                       function:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Prefix()));
                 } ),
                       Item(text: 'التكلفة',
                       icon: Icons.attach_money,
                       function:(){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Bussines()));
                       }
                       ),
                    
                       Item(text: 'الخصومات',
                       icon: Icons.calculate,
                       
                       function:(){
                         Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>
                          Operation(),
                          
                          ),
                          
                          );
                       }
                       ),
                       Item(text: 'مطابخ',
                       icon: Icons.carpenter,
                       
                       function:(){
                         Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>
                          Matbah(),
                          
                          ),
                          
                          );
                       }
                       ),
                     ],
                 ),
            ),
                      
          ),
        ],
      ),
                  ),
    );
  }
}

class Item extends StatelessWidget {
  late String text;
  late IconData icon;
  late VoidCallback function;
   Item({
    required this.text,
    required this.icon,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        style:ListTileStyle.list ,
        leading: Text(text,
      style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold,
          color:Theme.of(context).primaryColor,
        ),
      ),
      trailing: Icon(icon,
      size: 35,
      color: Theme.of(context).primaryColor,
      ),
      onTap:function,
        ),
    );
  }
}