


// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recycle/shared/local/cache_helper.dart';

import 'AppState.dart';
import 'Componant.dart';
import 'UserModel.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  //////////logout///////////////////////
  void signOut(BuildContext context)  {
    emit(LogoutLoadingState());


    FirebaseAuth.instance.signOut().then((value) async {

      CacheHelper.removeData(key: 'uId');

     // navigateAndFinish(context, LoginScreen());
      emit(LogoutSuccessState());
    });
  }
  //////////// userRegister  ////////////


  void userRegister({
    required String email,
    required String password,
    required String phone,


    required String firstName,
    required String lastName,

    required String address,

    required double basePrice,
  }) {
    emit(CreateUserInitialState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      createUser(

          email: email,
          phone: phone,
          uId: value.user!.uid,
          firstName: firstName,
          lastName: lastName,
          address: address,
          basePrice: basePrice
      );
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  ////////////////createUser///////////////
  void createUser({
    required String email,
    required String phone,
    required String uId,

    required String firstName,
    required String lastName,

    required String address,

    required double basePrice,
  }) {
    UserModel model=UserModel(
        email: email,
        phone: phone,
        uId: uId,

        firstName: firstName,
        lastName: lastName,

        address: address,

        basePrice: basePrice
    );

    FirebaseFirestore.instance.collection("users").doc(uId).set(model.toMap()).then((value) {

   emit(CreateUserSuccessState(uId));
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }
  int index = 0;
  void changeIndex(int index){
   this.index= index;
   emit(ChangeIndexState());
  }
  //////////// getUser Model ////////////
  UserModel? user;

  ///////////////////////////////////////////////////////////
  Future<UserModel?> getUser(String uid,context) async {
    uid!=''? await FirebaseFirestore.instance.collection('users').doc(uid.toString())
        .get()
        .then((value) {
      user = UserModel.fromJson(value.data()!);

      emit(GetUserSuccessState(value.id,''));
      return user;

    }):user= UserModel(email: '', uId: '', firstName: '', lastName: '', phone: '',  address: '', basePrice: 0.0);
    return user;
  }
  //////////// userLogin  ////////////
  Future<void> userLogin({required String email, required String password}) async {

    emit(LoginLoadingState());

    await  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password) .then((value) {

      CacheHelper.saveData(key: 'uId', value: value.user!.uid);

      emit(LoginSuccessState(value.user!.uid,'patient'));

    }).catchError((error) {
      showToast(text: error.toString(), state: ToastStates.error);
      emit(LoginErrorState(error.toString()));
    });
  }
////////////  ChangePassword ////////////
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;


  void changePassword() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordState());
  }
  ////////////update////////////
  void updateUser({
    required String email,
    required String phone,
    required String uId,
    required String firstName,
    required String lastName,
    required String address,
    required double basePrice,
  }) {

    emit(UpdatePatientLoadingState());

      UserModel model=UserModel(
          email: email,
          phone: phone,
          uId: uId,
          firstName: firstName,
          lastName: lastName,
          address: address,
          basePrice: basePrice
      );
      FirebaseFirestore.instance.collection("users").doc(uId)
          .update(model.toMap())
          .then((value) {
        emit(UpdatePatientSuccessState());
      }).catchError((error) {
        emit(CreateUserErrorState(error.toString()));
      });
    }



}
