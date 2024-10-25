// ignore_for_file: must_be_immutable

import 'package:accc/shared_prefrence/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../home/home.dart';

class OnBording extends StatefulWidget {
   OnBording({super.key});

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
    PageController controller=PageController(initialPage: 0);
    bool isLast=false;
    List Item=[
      IetmBoarding(image:'assets/images/undraw_mobile_content_xvgr.png' ,
      text: 'تطبيق موجه لمساعدة نجاري الالمنيوم على القيام بحساب التكاليف واطوال القطع للتفصيل إضافة الى معرض لتخزين صور أعمالهم من عمل المهندس عبدالله محمد شحود',
      textTitle: 'تطبيق حساباتي',),
      IetmBoarding(image:'assets/images/undraw_Calculator_re_alsc.png' ,
      text: ' يحوي على صفحة لتخزين أسعار الاكسسوارات بشكل دائم مع إتاحة إمكانية تعديلها و يقدم ميزة حساب تكاليف العمل للزبون بدقة عالية ووضوح الارقام والتفاصيل',
      textTitle: 'حساب الاسعار والتكليف',),
      IetmBoarding(image:'assets/images/undraw_search_app_oso2.png' ,
      text: 'توفير معرض لتخزين صور الاعمال بشكل مصنف ',
      textTitle: 'المعرض',)
    ];
    void submit()async{
  SharedPreferences sharedpreferences=await SharedPreferences.getInstance();
     await CacheHelper.putBool('onBording', true,sharedpreferences).then((valu) {
      if(valu!){
   Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Home())));
      }
      }
       );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
              child: Text('تجاوز',
              style: TextStyle(
                fontSize: 12.sp, fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
              ),
              style:ElevatedButton.styleFrom(
                backgroundColor:Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                side: BorderSide.none,
                padding: EdgeInsets.all(10)
              ), 
              onPressed: () {
                  submit();
                    
                } ,
            ),
        ),
          ],
        ),
      body:Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Expanded(
            flex: 6,
            child: Container(
                height:MediaQuery.of(context).size.height / 0.3,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemCount: Item.length,
                onPageChanged: (value) {
                  if(value==Item.length-1){
                    setState(() {
                      isLast=true;
                    });
                submit();
                  }else{
                    setState(() {
                      isLast=false;
                    });
                  }
                 },
                controller:controller ,
                itemBuilder:(context, index) => Item[index],),
            ),
          ),
          // SizedBox(height: 60.h,),
          SmoothPageIndicator(
                    controller:controller ,
                    count:Item.length ,
                    effect: ExpandingDotsEffect(
                     dotColor: Color.fromARGB(186, 158, 158, 158),
                     activeDotColor: Theme.of(context).primaryColor,
                     spacing: 3,
                     dotHeight: 7.h,
                      dotWidth: 7.w
                    ),
                  ),
          // SizedBox(
          //   height: 40.h,
          // ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 FloatingActionButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                      onPressed: (){
              if(isLast){
                submit();
              }else{
              controller.nextPage(duration: Duration(milliseconds : 750),
               curve: Curves.linear);
              }
                      }),
                ],
              ),
            ),
          ),
          
        ]
      )
    );
  }
}

class IetmBoarding extends StatelessWidget {
  late String textTitle;
  late String text;
  late String image;
   IetmBoarding({
    super.key,
    required this.textTitle,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          SizedBox(
                height: 20.h,
              ),
          Image(image: AssetImage(image),
          width: double.infinity,
          fit: BoxFit.fill,
          ),
          // SizedBox(
          //       height: 50.h,
          //     ),
              Column(
                children: [
              Text(
          textTitle,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
          textAlign: TextAlign.center,
                    ),
            SizedBox(
                height: 10.h,
              ),
           Text(
         text,
          style: TextStyle(fontSize: 16.sp, fontWeight:FontWeight.w500,
          color: Colors.black),
          textAlign: TextAlign.center,
          ), 
                ],
              ),
             
          
        ],
      ),
    );
  }
}