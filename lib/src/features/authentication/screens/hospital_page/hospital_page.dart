import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_first/src/constants/lists.dart';

import '../category_view/category_view.dart';

class HospitalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Category', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 170,
          ),
          itemCount: iconsList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blueAccent.withOpacity(0.9),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle image tap here, based on your desired functionality
                      Get.to(() => const CategoryDeatilsView());
                      //print('Tapped image for ${iconsTitleList[index]}');
                    },
                    child: Image.asset(
                      iconsList[index],
                      width: 60,
                      // color: Colors.white54,
                    ),
                  ),
                  const Divider(color: Colors.black26),
                  GestureDetector(
                    onTap: () {
                      Get.to(() =>  const CategoryDeatilsView());
                      // Handle text tap here, based on your desired functionality
                      // print('Tapped text for ${iconsTitleList[index]}');
                    },
                    child: Text(
                      iconsTitleList[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Text(
                    "13 specialist",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}