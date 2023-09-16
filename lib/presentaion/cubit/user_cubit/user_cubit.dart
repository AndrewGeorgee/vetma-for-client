import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vetma_final_project/data/models/new_model.dart';
import 'package:vetma_final_project/data/models/reservation_details_entites.dart';
import 'package:vetma_final_project/domain/usecase/get_doctor_info_usecase.dart';
import 'package:vetma_final_project/presentaion/cubit/user_cubit/user_state.dart';

import '../../../../domain/usecase/get_create_current_user_usecase.dart';
import '../../../../domain/usecase/get_current_uid_usecase.dart';
import '../../../../domain/usecase/get_doctors_usecase.dart';
import '../../../../domain/usecase/get_iformation_of_user.dart';
import '../../../../domain/usecase/get_update_user_usecase.dart';
import '../../../../domain/usecase/get_user_inf_usecase.dart';
import '../../../../domain/usecase/save_reservation_details_usecase.dart';
import '../../../domain/usecase/fetch_noti_appointment_usecas.dart';

class UserCubit extends Cubit<UserStates> {
  static UserCubit get(context) => BlocProvider.of(context);
  final GetUpdateUserUseCase getUpdateUserUseCase;
  final GetDoctorUsecase getDoctorUsecase;
  final SaveReservationDetailsUSeCAse saveReservationDetailsUSeCAse;
  final GetUserInformationUsecase getUserInformationUsecase;
  final GetCurrentUIDUseCase getUidUsecase;
  final FetchNotficationAppointmentOfDoctorUsecase
      fetchNotficationAppointmentOfDoctorUsecase;

  final GetDoctorInfUSecase getDoctorInfUSecase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  final GetInformationTextUSecase uSecase;

  UserCubit({
    required this.saveReservationDetailsUSeCAse,
    required this.getDoctorUsecase,
    required this.getUserInformationUsecase,
    required this.getUidUsecase,
    required this.getDoctorInfUSecase,
    required this.fetchNotficationAppointmentOfDoctorUsecase,
    required this.getCreateCurrentUserUseCase,
    required this.uSecase,
    required this.getUpdateUserUseCase,
  }) : super(DoctorInitial());

  Future<void> fetchDoctors() async {
    try {
      emit(DoctorFEtchLoading());
      final doctors = await getDoctorUsecase.call();
      emit(DoctorFEtchSuccess(doctors));
    } catch (e) {
      emit(DoctorFEtchFailure(error: e.toString()));
    }
  }

  Future<void> fetchNotifcationAppointment(String id) async {
    emit(FetchNotifvationLoading());
    try {
     final r=  await fetchNotficationAppointmentOfDoctorUsecase.call(id);
      emit(FetchNotifvationSuucced(r));
    } on SocketException catch (e) {
      emit(SaveAppointmentFailure(error: e.toString()));
    }
  }

  Future<void> saveAppintment({required ReservationDetailsModel user}) async {
    emit(SaveAppointmentLoading());
    try {
      await saveReservationDetailsUSeCAse.call(ReservationDetailsModel(
          appointment: user.appointment,
          day: user.day,
          nameOfDocotr: user.nameOfDocotr,
          priese: user.priese,
          reservationUid: user.reservationUid,
          doctorUid: user.doctorUid,
          nameOfUserReversation: user.nameOfUserReversation,
          photoOfUser: user.photoOfUser,
          userId: user.userId));
      emit(SaveAppointmentSuccess());
    } on SocketException catch (e) {
      emit(SaveAppointmentFailure(error: e.toString()));
    }
  }

  UserModel? userModel;
  Stream<UserModel> getUserDataStream(String userId) {
    emit(GetInformationUser2rLoading());

    return uSecase.call(userId);
  }

  Future<void> getUpdateUser({required UserModel user}) async {
    try {
      await getUpdateUserUseCase.call(user);
    } on SocketException catch (_) {
      emit(GetUserrSuccessd());
    } catch (_) {
      emit(GetUserrError());
    }
  }

  void getUserData() async {
    emit(SaveDataLoading());
    final uid = await getUidUsecase.call();
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      print(value.data());
      userModel = UserModel.fromJson(value.data()!);
      log(userModel!.firstName);
      log(userModel!.firstName);
      log(userModel!.gender);
      log(userModel!.uid);
      emit(SaveDataSucceed(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(SaveDataError(error.toString()));
    });
  }
}
