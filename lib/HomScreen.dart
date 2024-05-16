// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height*0.2,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/back.jpg'),fit: BoxFit.fill)),
      ),


    SizedBox(

      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.23,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Recycle Rewards",
                          textAlign: TextAlign.right,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.015,),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(child: Text(' : نبذة عن الموقع ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.015,),)),
                      ),

                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("  هو مشروع مبتكر يستهدف حل مشكلة التلوث البيئي وتراكم النفايات من خلال تحفيز الأفراد على المشاركة في جهود إعادة التدوير. يعمل المشروع عبر منصة ويب تتيح للمستخدمين جمع النفايات القابلة للتدوير، مثل الزجاجات البلاستيكية وعلب الألمنيوم والورق، وتسليمها مقابل نقاط يمكن تبديلها بمكافآت قيمة. هذه المكافآت تشمل خصومات على المشتريات من الشركاء المشاركين والهدايا الخاصة.إلى جانب المكافآت المادية، يوفر Recycle Rewards مجتمعًا افتراضيًا يسمح للمستخدمين بالتفاعل وتبادل الأفكار والتجارب حول الاستدامة والحفاظ على البيئة. يمكن للمشتركين في هذا المجتمع مشاركة قصصهم وتجاربهم في إعادة التدوير، مما يساهم في زيادة الوعي البيئي ويشجع على مشاركة أوسع في حماية البيئة.بهذه الطريقة، يحول Recycle Rewards مشكلة التلوث وتراكم النفايات إلى فرصة للأفراد للمساهمة بشكل فعال في بناء عالم أكثر نظافة واستدامة.",
                      textAlign: TextAlign.right,style: TextStyle(color: Colors.green),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
      SizedBox(

      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.17,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(child: Text(': الرؤية ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.02,),)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),                    child: Text(
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
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(child: Text('مواقع البلديه لتدوير النفايات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.02,),)),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height*0.5,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/map.jpg'),fit: BoxFit.fill)),
        ),
      ),
    ],);
  }
}
