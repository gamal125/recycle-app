
// ignore_for_file: file_names

abstract class AppStates {}

class AppInitialState extends AppStates {}
class LogoutLoadingState extends AppStates {}
class RegisterSuccessState extends AppStates {}
class UpdatePatientLoadingState extends AppStates {}
class UpdatePatientSuccessState extends AppStates {}
class CreateUserSuccessState extends AppStates {
  final String uid;
  CreateUserSuccessState(this.uid);
}
class RegisterErrorState extends AppStates {
  final String error;
  RegisterErrorState(this.error);
}
class CreateUserErrorState extends AppStates {
  final String error;
  CreateUserErrorState(this.error);
}
class CreateUserInitialState extends AppStates {}
class LogoutSuccessState extends AppStates {}
class ChangeIndexState extends AppStates {}
class LoginSuccessState extends AppStates {
  final String uId;
  final String type;
  LoginSuccessState(this.uId,this.type);

}
class GetUserSuccessState extends AppStates {
  final String uId;
  final String type;
  GetUserSuccessState(this.uId,this.type);

}
class ChangePasswordState extends AppStates {}
class LoginLoadingState extends AppStates {}
class LoginErrorState extends AppStates {
  final String error;

  LoginErrorState(this.error);
}