// ignore_for_file: no_leading_underscores_for_local_identifiers, must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Account/Widget/component.dart';
import '../../Sqflite/Sqflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


  List<File> file=[]; 
  List add=['الصورة الاولى','الصورة الثانية','الصورة الثالثة','الصورة الرابعة']; 
   

  var controller=TextEditingController();
class AddWork extends StatefulWidget {
   String text;
   AddWork({super.key ,required this.text});

  @override
  State<AddWork> createState() => _MyWidgetState();
}
SqlDb bd=SqlDb();
final ImagePicker _picker = ImagePicker();
class _MyWidgetState extends State<AddWork> {

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
       file.add(File(pickedFile.path));
       setState(() {
         
       });
    }
  }

  Future<int> insert()async{
    return await bd.insertImage( int.parse( controller.text),file[0], file[1], file[2], file[3]);

  }
  Future<List<Map<String, dynamic>>> _getImages() async {
    return await bd.getImages2(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
     backgroundColor: Theme.of(context).primaryColor,

        title: Text('الاضافة',style: TextStyle(color: Colors.white),),
      ),
      body:
      SafeArea(
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [  
          FormFields(label: 'الاسم',width: MediaQuery.of(context).size.width / 3,
          icon: Icons.abc,controll: controller,),
          SizedBox(
          height:15.h
            ),
          Column(
          children:[  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
         button(text:'إضافة الصور الاولى',function:(){ _pickImage();},padding:15.w),
         button(text:'إضافة الثانية',function:(){ _pickImage();},padding:20.w),
              ],
            ),
            SizedBox(
          height:15.h
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 button(text:'إضافة الثالثة',function:(){ _pickImage();
                 setState(() {
                   
                 });
                 },padding:20.w),
         button(text:'إضافة الرابعة',function:(){ _pickImage();
         setState(() {
                   
                 });
         },padding:20.w),
               ],
            )
            ]
          ),
          
                   FutureBuilder<List<Map<String, dynamic>>>(
                     future: _getImages(),
                     builder: (context, snapshot) {
                       if (!snapshot.hasData) {
                         return CircularProgressIndicator();
                       }
                       final images = snapshot.data!;
                       final image = images[0];
                       return ListView(
                         children:[
                          Image.memory(image['image1']),
                                   Image.memory(image['image2']),
                                   Image.memory(image['image3']),
                                   Image.memory(image['image4']),
                         ]
                          
                   );
         } ),
         button(text:'حفظ',function:(){insert();},padding:60),
         
        ]),
      )
      );
  
  }
}

