// ignore_for_file: prefer_const_constructors, must_be_immutable


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Account/Widget/component.dart';
import '../../Sqflite/Sqflite.dart';
import '../widget/work.dart';
import 'Scroll.dart';
import 'add_work.dart';

class WorkDetails extends StatelessWidget {
   WorkDetails({super.key,required this.text});
 late String text; 
 SqlDb sql=SqlDb();
 Future<List<Map<String, dynamic>>> _getImages() async {
    return await sql.getImages2(text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
     backgroundColor: Theme.of(context).primaryColor,

        title: Text(text,style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding:EdgeInsets.only(top: 10.h,right: 20.w,left: 20.w),

        child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('الاعمال',
            style: TextStyle(color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,fontSize: 20.sp ),),
            SizedBox(height: 10.h,),
            FutureBuilder<List<Map<String, dynamic>>>(
                future: _getImages(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final images = snapshot.data!;
                  return ListView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      final image = images[index];
                      return GestureDetector(
                  child: Work(id:image['dno'] ,text:image['dname'] ,),
                  onTap: () {
         Navigator.push(context,MaterialPageRoute(builder: (context) => Scroll(id: image['dname'])));

                  },
                  );
                    },
                  );
                },
              ),
           button(text:'إضافة عمل جديد',function:(){
                           Navigator.push(context,MaterialPageRoute(
                            builder: (context) => AddWork(text: text,)));

           },padding:60),
          
          ],
        ),
      ),
    );
  }
}