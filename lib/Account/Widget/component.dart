
// ignore_for_file: must_be_immutable


import 'package:accc/bloc/cubit/cubit/accont_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared_prefrence/shared_preferences.dart';


class Group extends StatefulWidget {
  late TextEditingController controller;
  late List<String> name;
  Map<String,double?>  value;
 late double paddingWith;
 late double paddingHeight;
   Group({
    required this.name,
    required this.value,
    required this.controller,
    required this.paddingHeight,
    required this.paddingWith,
  });

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) => Container(
        margin:EdgeInsets.only(bottom: 7) ,
        width: MediaQuery.of(context).size.width.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).disabledColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           IconButton(
          icon: Icon(Icons.change_circle_outlined,
          size: 30,
            color: Theme.of(context).primaryColor,
          ), 
          onPressed: (){
            showModalBottomSheet(
            builder:(context) =>Padding( 
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FormFields(                      
                      width:  MediaQuery.of(context).size.width / 2.w,
                      icon: Icons.change_circle,
                    controll: widget.controller,label: 'تعديل',
                    // foucs:true,
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                   button(padding: 60.w, text: 'حفظ', function:()async{
                            SharedPreferences shared=await SharedPreferences.getInstance();
                     await CacheHelper.putDouble(widget.name[index],
                     double.parse(widget.controller.text),shared).then((value) => 
                     setState(() {
                         Navigator.of(context).pop();
                     })
                     );
                        widget.value[widget.name[index]]= double.parse(widget.controller.text);
                           widget.controller.text='';
                   } 
                   
                   )
                  ],),
              ), context: context ,
          );
            
          },
        ),
        Text('${widget.name[index]}',
        style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w300,color: Colors.black)
        ),
         BoxText(paddingWidth:  widget.paddingWith,
         text:'${ widget.value[widget.name[index]]}',
         paddingHeight: widget.paddingHeight,),
    
       
    
      ],),)), 
       itemCount:  widget.value.length);
  }
}

class BoxText extends StatelessWidget {
   late double paddingWidth;
   late double paddingHeight;
   late String text;
   BoxText( {
    required this.paddingWidth,
    required this.paddingHeight,
    required this.text, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: paddingWidth.w,
      height:paddingHeight.h,
      child:Text(text,
      style:  TextStyle(fontSize: 17.sp, fontWeight:FontWeight.w400,
          color: Theme.of(context).primaryColor
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14)
      ),
    );
  }
}
class button extends StatelessWidget {
  late double padding;
  late String text;
  late VoidCallback function;
  button(
      {super.key,
      required this.padding,
      required this.text,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Center( 
      child: ElevatedButton(
          onPressed: function,
          style: 
          ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: padding.w, vertical: 15.h),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                backgroundColor: Theme.of(context).primaryColor
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          )),
    );
  }
}
class FormFields extends StatelessWidget {
  bool foucs=false;
   String label;
   double width;
   IconData icon;
   TextEditingController controll;
  FormFields(
      { required this.label,required this.width, required this.icon,
      required this.controll,foucs });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      child: BlocConsumer<AccontCubit, AccontState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return TextFormField(
            style: TextStyle(fontSize: 20.sp, fontWeight:FontWeight.w400,
          color:Theme.of(context).primaryColor,
        ),
            textAlign: TextAlign.center,
            controller: controll,
            autofocus: foucs,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            focusedBorder: 
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    ),
              disabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
               label:Text(label),
              hintText: label,
              hintStyle:TextStyle(fontSize: 20, fontWeight:FontWeight.w400,
          color:Theme.of(context).primaryColor,
        ),
              floatingLabelStyle:TextStyle(fontSize: 20, fontWeight:FontWeight.w200,
          color: Theme.of(context).primaryColor,
        ),
              labelStyle: TextStyle(fontSize: 20, fontWeight:FontWeight.w200,
          color: Theme.of(context).primaryColor,
        ),
       
              suffixIcon: Icon(
                icon,
                color:Theme.of(context).primaryColor,
                size: 32,
              )),
        );
        },
      ),
    );
  }
}
class Forms extends StatelessWidget {
  late String text;
  late String textButon;
  late String label1;
  late String label2;
  late double width;
  late IconData icon1;
  late IconData icon2;
  late VoidCallback function;
   TextEditingController controll;
   TextEditingController controll2;
                    // width: MediaQuery.of(context).size.width / 2,

  Forms({
    required this.text,
    required this.textButon,
    required this.label1,
    required this.label2,
    required this.width,
    required this.icon1,
    required this.icon2,
    required this.function,
    required this.controll,
    required this.controll2
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            text,
            style:TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500,
          color:Theme.of(context).primaryColor),
            textAlign:TextAlign.right
          ),
        ),
            Form(child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FormFields(
              width:  MediaQuery.of(context).size.width / 3.w,
              controll:controll ,
              label: label1,
              icon: icon1,
            ),
            FormFields(
              width:  MediaQuery.of(context).size.width / 3.w,

              controll: controll2,
                label: label2,
                icon:icon2),
          ],
        ),
            ),
        SizedBox(
          height: 20.h,
        ),
        button(
          padding: (MediaQuery.of(context).size.width - 120) / 2.w,
          text: textButon,
          function:function
        ),
      ],
    );
  }
 
}