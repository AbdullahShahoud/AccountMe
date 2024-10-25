// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
class Work extends StatelessWidget {
   int id=0;
  String text=''; 
   Work({required this.id,required this.text});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          color: Color.fromARGB(207, 90, 211, 60),
          child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              leading: null,
              style: ListTileStyle.list,
              title: Text(text,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white
                ),),
                trailing:  Text('$id',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white
                ),),
              ),
          )
        ),
      ),
    );
  }
}