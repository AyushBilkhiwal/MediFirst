import 'package:flutter/material.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:math';
List<Map> categorydoc = [
  {
    'img': 'assets/logo/doc1.jpg',
    'doctorName': 'Dr. Naveen Kumar',

  },
  {
    'img': 'assets/logo/doc2.jpg',
    'doctorName': 'Dr. AISHWARYA REWADKAR',

  },
  {
    'img': 'assets/logo/doc3.jpg',
    'doctorName': 'Dr. BHIMRAO PAWAR',

  },
  {
    'img': 'assets/logo/doc4.jpg',
    'doctorName': 'Dr. ABHIJEET MORE',

  },
  {
    'img': 'assets/logo/doc5.jpg',
    'doctorName': 'Dr.Narottam ',
  },
  {
    'img': 'assets/logo/doc6.jpg',
    'doctorName': 'Dr.Durgesh Prashad ',
  },
  {
    'img': 'assets/logo/doc7.jpg',
    'doctorName': 'Dr.Ram Singh Meena ',
  },
  {
    'img': 'assets/logo/doc8.jpg',
    'doctorName': 'Dr. Sourav  ',
  },
  {
    'img': 'assets/logo/doc9.jpg',
    'doctorName': 'Dr.Gopi Krishna ',
  }

];
class CategoryDeatilsView extends StatelessWidget {
  const CategoryDeatilsView({super.key});
  // final Random random=Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 170,
                crossAxisSpacing: 3,
                mainAxisSpacing: 11
            ),
            itemCount: categorydoc.length,
            itemBuilder: (BuildContext context,int index){
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(right: 8),
                // height: 100,
                // width: 150,
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      alignment: Alignment.center,
                      color: Colors.white54,
                      child: Image.asset(
                        categorydoc[index]['img'] ?? '',
                        width: 90,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      categorydoc[index]['doctorName'] ?? '',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                    // VxRating(
                    //   selectionColor: Colors.yellowAccent,
                    //   onRatingUpdate: (value) {},
                    //   maxRating: 5,
                    //   count: 5,
                    //   value: random.nextDouble() * 5, // Pass a double value
                    //   stepInt: true,
                    // )
                    //Text('Category',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),)

                  ],
                ),
              );
            }),
      ),
    );
  }
}