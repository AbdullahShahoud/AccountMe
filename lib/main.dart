// ignore_for_file: must_be_immutable, unnecessary_null_comparison


import 'package:accc/Account/Helper/add_prefix.dart';
import 'package:accc/Account/screen/operation.dart';
import 'package:accc/bloc/cubit/cubit/accont_cubit.dart';
import 'package:accc/Account/screen/onBording.dart';
import 'package:accc/home/home.dart';
import 'package:accc/shared_prefrence/shared_preferences.dart';
import 'package:accc/Account/screen/prefix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedpreferences=await SharedPreferences.getInstance();
  bool? onbording
  =await CacheHelper.getBool('onBording',sharedpreferences);
if(onbording == null){
    onbording=false;
   for(int i=0;i<prefixName.length;i++){
     await CacheHelper.putInt(prefixName[i],0,sharedpreferences);
    }
     for(int i=0;i<operationName.length;i++){
     await CacheHelper.putInt(operationName[i],0,sharedpreferences);
    }
}
   for(int i=0;i<prefixName.length;i++){
  prefixvalue.addAll({
prefixName[i]:await CacheHelper.getDouble(prefixName[i],sharedpreferences)
  });
}
 for(int i=0;i<operationName.length;i++){
  operation.addAll({
operationName[i]:await CacheHelper.getDouble(operationName[i],sharedpreferences)
  });
}
 
  runApp(BlocProvider(
    create: (context) => AccontCubit(),
    child:  MyApp(onbording:
    onbording, )
  )
  );
}
 
class MyApp extends StatelessWidget {
  bool onbording;
   MyApp({super.key, 
required
this.onbording,
    });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: Size(272,550),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo', 
        
          theme: ThemeData(
            primaryColor:  Color(0xff1E5C39),
            disabledColor: Color.fromARGB(103, 36, 124, 36),
           
          ),
          home:
          onbording?Home(): OnBording(),
           
        ),
      ),
    );
  }
}


