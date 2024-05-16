// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:flutter/material.dart';

 import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(text,style: const TextStyle(color: Colors.cyan),),
    );
void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => widget,
  ),
);
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (_) => widget,
  ),
      (route) => false,
);
Widget defaultTextFormField({
  FocusNode? focusNode,
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String? Function(String?) validate,
  required String label,
  Color? fillColor,
  String? hint,

  onTap,
  onChanged,
  Function(String)? onFieldSubmitted,
  bool isPassword = false,
  bool isClickable = true,
  InputDecoration? decoration,
  IconData? suffix,
  IconData? prefix,
  Function? suffixPressed,
}) =>
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(

        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        maxLines: 1,
        minLines: 1,
        controller: controller,
        validator: validate,
        enabled: isClickable,
        onTap: onTap,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        obscureText: isPassword,
        keyboardType: keyboardType,
        autofocus: false,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintTextDirection: TextDirection.ltr,

          prefixIcon: Icon(
            prefix,
            color: Colors.grey,
          ),
          suffixIcon: suffix != null ? IconButton(
            onPressed: () {suffixPressed!();},
            icon: Icon(suffix, color: Colors.grey,),
          ):null,
          filled: true,
          isCollapsed: false,
          fillColor:fillColor?? Colors.white,
          hoverColor: Colors.red.withOpacity(0.2),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color:Colors.white,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          labelText: label,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          focusColor: const Color.fromRGBO(199, 0, 58,1),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
callNumber(String number) async{
   //set the number here
 // await FlutterPhoneDirectCaller.callNumber("+96$number");
}

void sendToWhatsApp({required String phone,})async{
  var mes='مرحبا!';
  var url='https://api.whatsapp.com/send?phone=966$phone&text=$mes';
  await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication);
}

Widget defaultMaterialButton({
  required Function function,
  required String text,
  required var context,
  Color color=Colors.cyan,


  double radius = 5.0,
  bool isUpperCase = true,
  Function? onTap,
}) =>
    Container(
      width: MediaQuery.of(context).size.width*0.25,
      height: MediaQuery.of(context).size.width*0.08,
      decoration: BoxDecoration(
        gradient:  LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color,Colors.cyan]),
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: color,
        //  color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          textAlign:TextAlign.start,


          style: const TextStyle(

            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
Widget defaultMaterialButton3({
  required Function function,
  required String text,
  required var context,



  double radius = 5.0,
  bool isUpperCase = true,
  Function? onTap,
}) =>
    Container(
      width: MediaQuery.of(context).size.width*0.15,
      height: MediaQuery.of(context).size.height*0.06,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: Color(0xFF008000),
        //  color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          textAlign:TextAlign.start,


          style:   TextStyle(

            color: Colors.white,
            fontSize:  MediaQuery.of(context).size.width*0.015
              ,fontWeight: FontWeight.w900
          ),
        ),
      ),
    );
Widget defaultReviewButton({
  required Function function,
  required String text,
  required var context,
  Color color=Colors.cyan,


  double radius = 5.0,
  bool isUpperCase = true,
  Function? onTap,
}) =>
    Container(
      width: MediaQuery.of(context).size.width*0.3,
      height: MediaQuery.of(context).size.width*0.10,
      decoration: BoxDecoration(
        gradient:  LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color,Colors.cyan]),
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: color,
        //  color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          textAlign:TextAlign.start,


          style: const TextStyle(

            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
      ),
    );
void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum  كذا اختيار من حاجة

enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;

    case ToastStates.error:
      color = Colors.red;
      break;

    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}