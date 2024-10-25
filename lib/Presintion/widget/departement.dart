// ignore_for_file: prefer_const_constructors, must_be_immutable


import 'package:flutter/material.dart';

class Departements extends StatelessWidget {
   Departements({required this.id,required this.text,required this.imag});
 late int id;
 late String text;
late String imag;
  @override
  Widget build(BuildContext context) {
    return  Stack(
              children: [
                 ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image( image:AssetImage(imag),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  ),
                  ),
                   Container(
                    alignment: Alignment.center,
               decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.2)),
              child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
                ),
                ),
              ],
             );
  }
}