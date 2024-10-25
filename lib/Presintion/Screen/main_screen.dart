// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../data.dart';
import '../widget/departement.dart';
import 'work_details.dart';

class MainScreen extends StatefulWidget {
 MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Padding(
           padding: const EdgeInsets.only(right:10.0,left: 10.0,),
           child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 3/5,
                    children: Main1.map((e) => GestureDetector(
                     child: Departements(id: e.id,text: e.text,imag: e.imag ),
                     onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => 
              WorkDetails(text: e.text),));

               }
                    )
                    ).toList()
                    )
         ),
              
             
        
          
    );
  }

}