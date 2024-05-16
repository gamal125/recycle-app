// ignore_for_file: file_names

import 'package:flutter/material.dart';

class VisionScreen extends StatelessWidget {
  const VisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height*0.2,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/back.jpg'),fit: BoxFit.fill)),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height*0.1,
      ),

      SizedBox(

        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.3,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Card(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(child: Text(' : الرؤية',style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.02,),)),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),  child: Text(
                      "تحويل كل منزل إلى نقطة فعالة لإعادة التدوير، مما يخلق مستقبلاً أكثر استدامة حيث يتحمل كل فرد مسؤولية بيئية، ويساهم في عالم خالٍ من النفايات. نسعى لجعل إعادة التدوير عملية سهلة، مجزية، وجزءاً لا يتجزأ من الحياة اليومية لكل شخص."
                      ,
                      textAlign: TextAlign.right,style: TextStyle(color: Colors.green),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),


    ],);
  }
}
