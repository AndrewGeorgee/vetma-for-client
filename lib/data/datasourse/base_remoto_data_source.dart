import 'dart:io';
import '../models/new_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/reservation_details_entites.dart';
import '../models/doctor_model.dart';

abstract class BaseRemoteDataSource {
  Future<void> signUp(UserModel user);
  Future<void> signUpDoctor(Doctors doctors);
  Future<void> signinDoctor(Doctors doctors);
  Future<void> forgetPasssword(String email);
  Future<void> googleAuth();
  Future<void> signInWithPhoneNumber(String phoneNumber);
  Future<void> submitOTP(String otp);
  Future<bool> isSignIn();
  Future<void> signIn(UserModel user);
  Future<void> getCreateCurrentUser(UserModel user);
  Future<void> getCreateCurrentDoctor(Doctors doctors);
  Future<String> getCurrentUId();
  Future<void> signInWithPhone(PhoneAuthCredential credential);
  Future<List<Doctors>> fetchDoctors();
  Future<void> saveReservationDetailsDataSource(
      ReservationDetailsModel reservationDetails);
  Future<UserModel> getUserInfo(String userId);
  Stream<UserModel> getUserInfo2(String userId);
  Stream<Doctors> getDoctorInfoStream(String userId);
  Future<List<ReservationDetailsModel>> fetchReservationDetailsDoctor(
      String id);
  Future<List<ReservationDetailsModel>> fetchNotaficationDetailsDoctor(
      String id);
  Future<void> getUpdateUser(UserModel user);
  Future<void> signOut();

  Future<String> uploadFile({required File file});
  Future<void> getInformmationDoctorDatabaseUsecaseDataSource(String uid);
  Future<void> getInformmationUserDatabaseUsecaseDataSource(String uid);
}
