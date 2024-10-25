import 'package:accc/Account/screen/drawer.dart';
import 'package:flutter/material.dart';
import '../Account/screen/home_screen.dart';
import '../Presintion/Screen/main_screen.dart';
import '../bloc/cubit/cubit/accont_cubit.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();

}
class _HomeState extends State<Home> {
  int index=0;
List<Widget> screen=[
  HomeScreen(),
  MainScreen()
];
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      drawer: Drawers(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('الرئسية',
        style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
        
        ),
        actions: [
          IconButton(onPressed: (){
            controllercontroller1.text=' ';
         AccontCubit.get(context).door.clear();
         AccontCubit.get(context).windows.clear();
         AccontCubit.get(context).windowsSmall.clear();
         AccontCubit.get(context).viewHeight.clear();
         AccontCubit.get(context).viewHeight.clear();
          },
           icon: Icon(Icons.refresh,color: Colors.white,))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconSize: 35,         
        selectedItemColor:Colors.white,
        unselectedItemColor:Colors.black,
        selectedLabelStyle: TextStyle(color:Colors.white,fontSize: 20 ),
        unselectedLabelStyle: TextStyle(color:Colors.black,fontSize: 20 ),
          currentIndex: index,

        onTap: (ind){
          setState(() {
        index=ind;
          });
        },
        items: [
        BottomNavigationBarItem(
          label:'الحسابات' ,
          icon: Icon(Icons.calculate)
        ),
        BottomNavigationBarItem(
          label:'المعرض' ,
          icon: Icon(Icons.image),
          
        ),
      ],),
      body: DefaultTabController(
        length: 2,
        child: screen[index]),
    );
  }
}