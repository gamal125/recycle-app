// ignore_for_file: file_names

class UserModel{
  String email='';
  String uId='';
  String firstName='';
  String lastName='';
  String phone='';

  String address='';

  double basePrice=0;


  UserModel({
    required this.email,
    required this.uId,
    required this.firstName,
    required this.lastName,
    required this.phone,

    required this.address,

    required this.basePrice,



  });

  UserModel.fromJson(Map<String,dynamic>json){
    firstName=json['firstName'];
    lastName=json['lastName'];
    phone=json['phone'];
    email=json['email'];
    uId=json['uId'];

    address=json['address'];

    basePrice=json['basePrice'];

  }
  Map<String,dynamic> toMap(){
    return{
      'firstName':firstName,
      'lastName':lastName,
      'phone':phone,
      'email':email,
      'uId':uId,
      'address':address,
      'basePrice':basePrice,

    };
  }


}