// ignore_for_file: unnecessary_this

import 'package:accc/Account/screen/operation.dart';


class WindowSmall{
  late double height;
  
  late double width;
  //
  late double heightInsude;
  //
  late double widthtInsude;
  //
 
  
//
WindowSmall({required double width,required double height}){
  this.width=width+5;
  this.height=height+5;
  this.widthtInsude=width-operation[ 'خصم طاقة عرض']!;
  this.heightInsude=height-operation['خصم طاقة طول']!;

}
   double AccountGlass(){
 return (width -10.5) *(height -10.5)*0.01 ;
  }
   double AccountJoin(){
 return (heightInsude*4) +(widthtInsude*4)*0.01 ;
  }
    double AccountFrashe(){
 return (width*4) +(height*4)*0.01 ;
  }
     double Accountmngl(){
 return (width) *(height)*0.01 ;
  }
  
  double accountWidth(){
    double total;
    total= (((width*2)+(height*2))*330)*0.01+
   (((widthtInsude*2)+(heightInsude*2))*500)*0.01 ;
    return( total);
  }
}