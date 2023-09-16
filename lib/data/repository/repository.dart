// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:vetma_final_project/core/error/exceptions.dart';
import 'package:vetma_final_project/data/models/doctor_model.dart';
import 'package:vetma_final_project/data/models/new_model.dart';
import 'package:vetma_final_project/data/models/reservation_details_entites.dart';

import '../../core/error/failure.dart';
import '../../domain/repositery/vetma_repositery.dart';
import '../datasourse/base_remoto_data_source.dart';

class VetmaRepository implements VetmaRepositery {
  final BaseRemoteDataSource baseRemoteDataSourse;

  VetmaRepository(this.baseRemoteDataSourse);

  @override
  Future<Either<Failure, void>> signUp(UserModel user) async {
    final r = await baseRemoteDataSourse.signUp(user);
    try {
      return Right(r);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<void> forgetPassword(String email) async {
    return await baseRemoteDataSourse.forgetPasssword(email);
  }

  @override
  Future<Either<Failure, void>> googleAuth() async {
    final r = await baseRemoteDataSourse.googleAuth();
    try {
      return Right(r);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> verifyPhoneNumber(String phoneNumber) async {
    final r = await baseRemoteDataSourse.signInWithPhoneNumber(phoneNumber);
    try {
      return Right(r);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp(String otp) async {
    final r = await baseRemoteDataSourse.submitOTP(otp);
    try {
      return Right(r);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> signIn(UserModel user) async {
    final r = await baseRemoteDataSourse.signIn(user);
    try {
      return Right(r);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<void> getCreateCurrentUser(UserModel user) async {
    final r = await baseRemoteDataSourse.getCreateCurrentUser(user);
  }

  @override
  Future<String> getCurrentUId() async {
    return await baseRemoteDataSourse.getCurrentUId();
  }

  @override
  Future<bool> isSignIn() async {
    return await baseRemoteDataSourse.isSignIn();
  }

  @override
  Future<void> signOut() async {
    final r = await baseRemoteDataSourse.signOut();
  }

  @override
  Future<List<Doctors>> getDoctors() async {
    return await baseRemoteDataSourse.fetchDoctors();
  }

  @override
  Future<void> saveReservationDetails(
      ReservationDetailsModel reservationDetails) async {
    return await baseRemoteDataSourse
        .saveReservationDetailsDataSource(reservationDetails);
  }

  @override
  Future<UserModel> getInformationUser(String id) {
    return baseRemoteDataSourse.getUserInfo(id);
  }

  @override
  Stream<UserModel> getUserInfStream(String userId) {
    return baseRemoteDataSourse.getUserInfo2(userId);
  }

  @override
  Future<Either<Failure, void>> getUpdateUser(UserModel user) async {
    final r = await baseRemoteDataSourse.getUpdateUser(user);
    try {
      return Right(r);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> getCreateCurrentDoctor(Doctors doctors) async {
    final r = await baseRemoteDataSourse.getCreateCurrentDoctor(doctors);
    try {
      return Right(r);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> signUpDoctor(Doctors doctors) async {
    final r = await baseRemoteDataSourse.signUpDoctor(doctors);
    try {
      return Right(r);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> signInAsDoctor(Doctors doctors) async {
    final r = await baseRemoteDataSourse.signinDoctor(doctors);
    try {
      return Right(r);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Stream<Doctors> getDoctorInfStream(String userId) {
    return baseRemoteDataSourse.getDoctorInfoStream(userId);
  }

  @override
  Future<List<ReservationDetailsModel>> fetchAppoinntmentToShow(
      String id) async {
    return await baseRemoteDataSourse.fetchReservationDetailsDoctor(id);
  }

  @override
  Future<List<ReservationDetailsModel>> fetchNotifAppoinntmentToShow(
      String id) async {
    return await baseRemoteDataSourse.fetchNotaficationDetailsDoctor(id);
  }

  @override
  Future<void> getInformationDoctorFromFireBase(String uid) {
    // TODO: implement getInformationDoctorFromFireBase
    throw UnimplementedError();
  }

  @override
  Future<void> getInformationUserFromFireBase(String uid) {
    // TODO: implement getInformationUserFromFireBase
    throw UnimplementedError();
  }
}
