import 'package:vetma_final_project/data/models/new_model.dart';

import '../../data/models/doctor_model.dart';
import '../../data/models/reservation_details_entites.dart';

abstract class VetmaRepositery {
  Future<void> signUp(UserModel user);
  Future<void> signUpDoctor(Doctors doctors);
  Future<void> forgetPassword(String email);
  Future<void> googleAuth();
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<void> verifyOtp(String otp);
  Future<void> signIn(UserModel user);
  Future<void> signInAsDoctor(Doctors user);
  Future<String> getCurrentUId();
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<void> getInformationUserFromFireBase(String uid);
  Future<void> getInformationDoctorFromFireBase(String uid);
  Future<void> getCreateCurrentUser(UserModel user);
  Future<void> getCreateCurrentDoctor(Doctors doctors);
  Future<List<Doctors>> getDoctors();
  Future<UserModel> getInformationUser(String id);
  Future<void> saveReservationDetails(
      ReservationDetailsModel reservationDetails);
  Future<List<ReservationDetailsModel>> fetchAppoinntmentToShow(String id);
  Future<List<ReservationDetailsModel>> fetchNotifAppoinntmentToShow(String id);
  Stream<UserModel> getUserInfStream(String userId);
  Stream<Doctors> getDoctorInfStream(String userId);
  Future<void> getUpdateUser(UserModel user);
}
