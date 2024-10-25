import 'package:accc/Account/screen/operation.dart';


class Door{
  late double height;
  
  late double width;
  //
  late double heightInsude;
  //
  late double widthtInsude;
  //
  late double kab;
    
 
  Door({required double height,required double width}){
    this.height=height+(operation["عرض حاجب"]!);
    this.width=width+(operation["عرض حاجب"]! *2);
    this.heightInsude=height-operation['خصم درفة باب طول']!;
    this.widthtInsude=width-operation['خصم درفة باب عرض']!;
    this.kab=width-operation['خصم كعب باب ']!;
  }
//
  double AccountGlass(){
 return ((width -14.6 ) *(heightInsude - 142))*0.01 ;
  }
   double AccountJoin(){
 return (heightInsude*4) +(kab*12)*0.01 ;
  }
    double AccountFrashe(){
 return (width*2) +(height*4)*0.01 ;
  }
  double AccountFeaber(){
 return ((width -14.6 ) *(65)*2)*0.01;
  }
   double accountWidth(){
    double total;
    total= ((width+(height*2))*416)*0.01+
   (((widthtInsude*2)+(heightInsude*2))*583)*0.01  
   +(kab*2*530)*0.01;
    return( total);
  }
}