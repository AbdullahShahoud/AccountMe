import 'package:accc/Account/screen/operation.dart';


class WindowBig{
  late double height;
  
  late double width;
  //
  late double msce;
  //
  late double shancl;
  //
  late double kab;
//
  late double mngl_width;
  // 
  late double mngl_height;
  
 WindowBig({
  required double height,
  required double width,
 }){
  this.height=height+(operation["عرض حاجب"]! *2);
  this.width=width+(operation["عرض حاجب"]! *2);
  this.kab=((width - operation['خصم كعب']!)/2);
  this.msce=height-operation['خصم مسكة ']!;
  this.shancl=height-operation['خصم مسكة ']!;
  this.mngl_height=height-operation['خصم مسكة ']!;
  this.mngl_width=((width/2) +operation['خصم منخل عرض']!) ;

 }
  double AccountMngl(){
 return mngl_width *mngl_height*0.01 ;
  }
   double AccountGlass(){
 return ((kab +1.5 ) *(msce - 10.3))*2*0.01 ;
  }
   double AccountJoin(){
 return ((kab*8) *(msce*8))*2*0.01;
  }
    double AccountFrashe(){
 return (width*8) +(height*8)*0.01 ;
  }
  double accountWidth(){
    double total;
    total= (width*720)*0.01+(((height*2)+width)*584)*0.01+
    (((kab*4)+(shancl*2))*530)*0.01+(msce*2*465)*0.01+
    (((mngl_height*2)+(mngl_width*2))*250)*0.01;
    return( total);
  }
  
}
