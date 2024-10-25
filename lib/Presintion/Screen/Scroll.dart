// ignore_for_file: must_be_immutable

import 'package:accc/Presintion/Screen/add_work.dart';
import 'package:flutter/material.dart';
class Scroll extends StatelessWidget {
  String id;
   Scroll({super.key,required this.id});
  Future<List<Map<String, dynamic>>> _getImages() async {
    return await bd.getImages2(id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
                future: _getImages(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  final images = snapshot.data!;
                  return ListView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      final image = images[index];
                      return 
                         Column(
                           children: [
                             Image.memory(image['image1']),
                             Image.memory(image['image2']),
                             Image.memory(image['image3']),
                             Image.memory(image['image4']),
                           ],
                         );
                    },
                  );
                },
              ),
      
    );
  }
}

 