
// import '../../domain/entites/user_entites.dart';

// class UserModel extends UserEntity {
//   const UserModel({
//     String firstName = "username",
//     String lastName = "lastName ",
//     String email = "",
//     String phoneNumber = "",
//     bool isOnline = false,
//     String uid = "",
//     String status = "",
//     String profileUrl = "",
//     String dob = "",
//     String gender = "",
//     String deviceToken = '',
//   }) : super(
//           firstName: firstName,
//           email: email,
//           lastName: lastName,
//           phoneNumber: phoneNumber,
//           isOnline: isOnline,
//           uid: uid,
//           status: status,
//           profileUrl: profileUrl,
//           gender: gender,
//           dob: dob,
//         );

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       firstName: json['firstName'],
//       lastName: json['lastName'],
//       email: json['email'],
//       phoneNumber: json['phoneNumber'],
//       isOnline: json['isOnline'],
//       uid: json['uid'],
//       status: json['status'],
//       profileUrl: json['profileUrl'],
//       dob: json['dob'],
//       gender: json['gender'],
//     );
//   }

//   Map<String, dynamic> toDocument() {
//     return {
//       "firstName": firstName,
//       "lastName": lastName,
//       "email": email,
//       "phoneNumber": phoneNumber,
//       "isOnline": isOnline,
//       "uid": uid,
//       "status": status,
//       "profileUrl": profileUrl,
//       "dob": dob,
//       "gender": gender,
//     };
//   }
// }
