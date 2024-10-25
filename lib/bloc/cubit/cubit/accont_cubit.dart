// ignore_for_file: avoid_types_as_parameter_names, unnecessary_null_comparison

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:accc/Account/screen/prefix.dart';
import '../../../Account/modul/door.dart';
import '../../../Account/modul/window.dart';
import '../../../Account/modul/window_small.dart';
part 'accont_state.dart';

class AccontCubit extends Cubit<AccontState> {
  AccontCubit() : super(AccontInitial());
 static AccontCubit get(context)=>BlocProvider.of(context);
 List<WindowBig> windows=[];
  List<WindowSmall> windowsSmall=[];
  List<Door> door=[];
  List<double>viewWidth=[];
  List<double>viewHeight=[];
   double totalMark=0;
   double totalClient=0;
    // Map<String,double?> prefixN={};
    List<double?> operation=[];
double accountAreaGlasses(){
    List<double> windowAreaGlasses=[];
    double areas=0;
    windows.forEach((element) { 
      windowAreaGlasses.add(
      element.AccountGlass()
      );
    });
    windowsSmall.forEach((element) { 
      windowAreaGlasses.add(
      element.AccountGlass()
      );
    });
    door.forEach((element) { 
      windowAreaGlasses.add(
      element.AccountGlass()
      );
    });
    
    windowAreaGlasses.forEach((element) {
      areas=areas+element;
    });

    return( areas);
  }

   double accountArea(){
    List<double> windowArea=[];
    double areas=0;
    windows.forEach((element) { 
      windowArea.add(
      (((element.height+7) *(element.width+7))+
     ((((element.height+7) *(element.width+7)) / 3))
      )
      );
    });
    areas=(door.length*2) +(windowsSmall.length *0.5);
    windowArea.forEach((element) {
      areas=areas+element*0.0001;
    });

    return( areas);
  }
  double? accountMouny(double price,double area){
  totalClient=(price*area);
    return totalClient.roundToDouble();
  }
   double accountWeightTotal(){
     List<double> totals=[];
    double totalesWeight=0;
    windows.forEach((element) { 
      totals.add(element.accountWidth());
    });
    windowsSmall.forEach((element) { 
      totals.add(element.accountWidth());
    });
     door.forEach((element) { 
      totals.add(element.accountWidth());
    });
    totals.forEach((element) {
      totalesWeight=totalesWeight+element;
    });
    return totalesWeight.ceilToDouble()*0.001;
  }
 double accountprefixWindow(double price1, double price2, double price3,
  double price4, double price5, double price6, double price7){
     double total=0;
    windows.forEach((element) { 
      total=total+
      element.AccountFrashe()*price4*0.01+
      element.AccountJoin()*price5*0.01+
      element.AccountGlass()*price6*0.01+
      element.AccountMngl()*price7*0.01;
    
    });
      total=total+
      windows.length*4*price1+
      windows.length*2*price2+
      windows.length*40*price3;
    return total;
  }
   double accountprefixDoor( double price1, double price2, double price3, double price4
   , double price5, double price6, double price7, double price8){
    double total=0;
    door.forEach((element) { 
      total=total+
      element.AccountFrashe()*price5*0.01+
      element.AccountJoin()*price6*0.01+
      element.AccountGlass()*price7*0.01+
      element.AccountFeaber()*price8*0.01;
    });
      total=total+
      door.length*price1+
      door.length*price2+
      door.length*3*price3+
      door.length*50*price4;
    return total;
  }

double accountprefixWindowSmall( double price1, double price2, double price3, double price4
   , double price5, double price6, double price7){
    double total=0;
    windowsSmall.forEach((element) { 
      total=total+
      element.AccountFrashe()*price5*0.01+
      element.AccountJoin()*price6*0.01+
      element.AccountGlass()*price7*0.01+
      element.Accountmngl()*price4*0.01
      ;

    });
      total=total+
      windowsSmall.length*price1+
      windowsSmall.length*2*price2+
      windowsSmall.length*28*price3;
    return total; 
  }
  
  double accountMarketAluminem(double widht,double price){
    return widht*price;
  }
  void accountTotalMarket( double aluminem,double prefixField){

     totalMark=aluminem +prefixField+accountprefix();
  }
  double account(){
    return totalClient-totalMark;
  }
  
double accountprefix(){
return
  accountprefixWindow(
    prefixvalue['دولاب عادي']!,
    prefixvalue['دولاب منخل']!,
    prefixvalue['براغي']!,
    prefixvalue['متر فراشي']!,
    prefixvalue['متر جوان ش']!,
    prefixvalue['متر بلور']!,
    prefixvalue['متر منخل']!,
  )+accountprefixDoor(
    prefixvalue['مسكة']!,
    prefixvalue['قفل' ]!,
    prefixvalue['مفصلة ك']!,
    prefixvalue['براغي']!,
    prefixvalue['متر فراشي']!,
    prefixvalue['متر جوان ب']!,
    prefixvalue['متر بلور']!,
    prefixvalue['متر فيبر']!,
       
  )+accountprefixWindowSmall(
    prefixvalue[ 'مفصلة ص']!,
    prefixvalue['ضفدعة' ]!,
    prefixvalue['براغي']!,
    prefixvalue['متر فراشي']!,
    prefixvalue['متر جوان ب']!,
    prefixvalue['متر بلور']!,
    prefixvalue['متر منخل']!,
  
  );
  
}
}

