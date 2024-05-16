
// ignore_for_file: file_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'AppCubit.dart';
import 'AppState.dart';
import 'Componant.dart';
import 'UserModel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key,required this.model,required this.type});
  final UserModel? model;
  final String type;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var majorController=TextEditingController();
  var phoneController=TextEditingController();
  var fNameController=TextEditingController();
  var lNameController=TextEditingController();
  var priceController=TextEditingController();
  var addressController=TextEditingController();
  final imageController = TextEditingController();
  bool acceptCalls=false;
  bool acceptPrivateVisits=false;
  bool acceptVisitsInClinic=false;
  final  formKey = GlobalKey<FormState>();
  @override
  void initState(){

    super.initState();

    fNameController.text=widget.model!.firstName;
    lNameController.text=widget.model!.lastName;
    phoneController.text=widget.model!.phone;
    addressController.text=widget.model!.address;
    priceController.text=widget.model!.basePrice.toString();


  }
  @override
  Widget build(BuildContext context) {

          return  BlocConsumer<AppCubit,AppStates>(
                listener:  (context,state) {

                },
                builder: (context,state) {
                  return GestureDetector(
                    onTap: (){
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Form(
                      key:formKey,
                      child: ListView(children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                              width:MediaQuery.of(context).size.width*0.25,
                              height: MediaQuery.of(context).size.height*0.25,
                              decoration:  const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: NetworkImage(
                                  'https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg'))


                              )

                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: double.infinity,
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('First name',style: TextStyle(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.width*0.02,color: Colors.black ),),
                                    defaultTextFormField(
                                        prefix:Icons.person ,

                                        controller: fNameController,
                                        keyboardType: TextInputType.name,
                                        validate: (String? s){
                                          if(s!.isEmpty){
                                            return 'Enter First name';
                                          }
                                          return null;
                                        },
                                        label: 'First name')


                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.grey,
                                width: double.infinity,
                                height: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Last name',style: TextStyle(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.width*0.02,color: Colors.black ),),
                                    defaultTextFormField(
                                        prefix:Icons.person ,

                                        controller: lNameController,
                                        keyboardType: TextInputType.name,
                                        validate: (String? s){
                                          if(s!.isEmpty){
                                            return 'Enter Last name';
                                          }
                                          return null;
                                        },
                                        label: 'Last name')


                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.grey,
                                width: double.infinity,
                                height: 1,
                              ),

                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Phone Number',style: TextStyle(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.width*0.02,color: Colors.black ),),
                                    defaultTextFormField(
                                        prefix:Icons.location_on_sharp ,

                                        controller: phoneController,
                                        keyboardType: TextInputType.name,
                                        validate: (String? s){
                                          if(s!.isEmpty){
                                            return 'Enter Phone';
                                          }
                                          return null;
                                        },
                                        label: 'Phone')

                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),


                        Container(
                          color: Colors.grey,
                          width: double.infinity,
                          height: 1,
                        ),


                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.width*0.02,color: Colors.black ),),
                              defaultTextFormField(
                                  prefix:Icons.location_on_sharp ,

                                  controller: addressController,
                                  keyboardType: TextInputType.name,
                                  validate: (String? s){
                                    if(s!.isEmpty){
                                      return 'Enter Address';
                                    }
                                    return null;
                                  },
                                  label: 'Address')

                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: double.infinity,
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ConditionalBuilder(
                            condition: state is ! UpdatePatientLoadingState,
                            builder: (context) => Center(
                              child: defaultMaterialButton3(

                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    AppCubit.get(context).updateUser(
                                        email: widget.model!.email,
                                        phone: phoneController.text,
                                        uId: widget.model!.uId,
                                        firstName: fNameController.text,
                                        lastName: lNameController.text,
                                        address: addressController.text,
                                        basePrice: double.parse(priceController.text));
                                  }
                                },
                                text: 'Save',
                                radius: 20, context: context,
                              ),
                            ),
                            fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                          ),
                        ),


                      ],),
                    ),
                  );
                }
            );

        }

}
