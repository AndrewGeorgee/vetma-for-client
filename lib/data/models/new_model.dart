import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final bool isOnline;
  final String uid;
  final String status;
  final String profileUrl;
  final String password;
  final String dob;
  final String gender;

  const UserModel({
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.phoneNumber = "Inter your Number",
    this.isOnline = false,
    this.uid = "",
    this.status = "Hello there i'm using this app",
    this.profileUrl =
        "https://img.freepik.com/free-vector/hand-drawn-collage-design_23-2149543516.jpg?w=1380&t=st=1686559872~exp=1686560472~hmac=99dc9fa8db0d61d7cb832f35e76bfe3caf0590bbf2d292cf89fef64a283b0a35",
    this.password = "",
    this.dob = "",
    this.gender = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      isOnline: json['isOnline'],
      uid: json['uid'],
      status: json['status'],
      profileUrl: json['profileUrl'],
      dob: json['dob'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNumber": phoneNumber,
      "isOnline": isOnline,
      "uid": uid,
      "status": status,
      "profileUrl": profileUrl,
      "dob": dob,
      "gender": gender,
    };
  }

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        phoneNumber,
        isOnline,
        uid,
        status,
        profileUrl,
        password,
        dob,
        gender,
      ];
}
