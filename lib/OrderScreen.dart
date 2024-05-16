// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycle/AppCubit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'Componant.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key,required this.id});
final String id;
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String selectedItem = ' الورق والكرتون';
  double _currentSliderValue = 30;
var bonus=0.0;
  List<String> dropdownItems = [
    " الورق والكرتون",
    "البلاستيك",
    "الزجاج",
    "المعادن",
    "النفايات الإلكترونية",

  ];

  final formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bonus=AppCubit.get(context).user!=null?AppCubit.get(context).user!.basePrice:0.0;
    return   Scaffold(
body: ListView(children: [

Padding(
  padding:   const EdgeInsets.symmetric(horizontal:10,vertical:20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      defaultMaterialButton3(function: (){
        if(formKey.currentState!.validate()) {

          double points=0.0;
        switch(selectedItem){
          case   " الورق والكرتون":points=50;
          case   " البلاستيك":points=30;
          case   "الزجاج":points=20;
          case   "المعادن":points=150;
         default: points=100;
        }
        return  AwesomeDialog(
            body:     Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Text('هل تريد حقا تقديم طلب'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text((_currentSliderValue*points).toString(),style: TextStyle(color: Color(0xFF008000)),),
                      Text(': عدد النقاط هي ',style: TextStyle(color: Color(0xFF008000)),),
                    ],
                  ),
                  SizedBox(height: 20,),

                ],
              ),
            ),
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,

            btnCancelOnPress: () {},
            btnCancelText: 'لا',
            btnOkText: 'نعم',
            btnOkOnPress: () {
              FirebaseFirestore.instance.collection('users').doc(widget.id).update({'basePrice':bonus+(points*_currentSliderValue)});
              AppCubit.get(context).changeIndex(0);
            },
          ).show();

        }}, text: 'Order', context: context),
      Text(': نوع النفايات', style:   TextStyle(

          color: const Color(0xFF008000),
          fontSize:  MediaQuery.of(context).size.width*0.015
          ,fontWeight: FontWeight.w900
      ),),

    ],
  ),
),
  Padding(
    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
    child: DropdownButton<String>(
      isExpanded: true,
      value: selectedItem,
      onChanged: (String? newValue) {
        setState(() {
          selectedItem = newValue!;
        });
      },
      items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          alignment: AlignmentDirectional.centerEnd,
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  ),
  Padding(
    padding:   const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(': الحجم بالكيلو جرام', style:   TextStyle(

            color: const Color(0xFF008000),
            fontSize:  MediaQuery.of(context).size.width*0.015
            ,fontWeight: FontWeight.w900
        ),),
      ],
    ),
  ),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF008000),width:3),borderRadius: BorderRadius.circular(15)),
        width: MediaQuery.of(context).size.width*0.7,
        child: Slider(
          value: _currentSliderValue,
          activeColor:const Color(0xFF008000) ,

          thumbColor: const Color(0xFF008000),
          min: 5,
          max: 250,
          divisions: 245,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
      ),
      Text('${_currentSliderValue.toStringAsFixed(0)} Kg',  style:   TextStyle(

          color: const Color(0xFF008000),
          fontSize:  MediaQuery.of(context).size.width*0.015
          ,fontWeight: FontWeight.w900
      ) ,),
    ],
  ),

    GestureDetector(
    onTap: (){FocusManager.instance.primaryFocus?.unfocus();},
    child: Center(
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: SingleChildScrollView(
    child: Form(
    key: formKey,
    child: Column(
    children: [

    const SizedBox(
    height: 30,
    ),
      Padding(
    padding: const EdgeInsets.symmetric( vertical: 10),
    child:  Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Text(': رقم الهاتف',  style:   TextStyle(

    color: const Color(0xFF008000),
    fontSize:  MediaQuery.of(context).size.width*0.015
    ,fontWeight: FontWeight.w900
    ) ,),
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(right: 5,left: 5,bottom:10),
    child: Column(children: [

    defaultTextFormField(
    controller: phoneController,
    keyboardType: TextInputType.phone,
    validate: (String? value) {
    if (value!.isEmpty) {
    return 'Enter   phone';
    }
    return null;
    },
    label: ' phone',
    hint: ' phone',
    ),
    const SizedBox(
    height: 10,
    ),
],),
    )
    ]
    )
    )
    )
    )
    )
    ),
  Padding(
    padding:   const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(': اختر اقرب نقطة', style:   TextStyle(

            color: const Color(0xFF008000),
            fontSize:  MediaQuery.of(context).size.width*0.015
            ,fontWeight: FontWeight.w900
        ),),
      ],
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height*0.5,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/map.jpg'),fit: BoxFit.fill)),
    ),
  ),
    ]
    )
    );
  }
}
