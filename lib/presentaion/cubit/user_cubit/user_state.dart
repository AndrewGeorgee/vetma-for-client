import 'package:equatable/equatable.dart';
import 'package:vetma_final_project/data/models/doctor_model.dart';

import '../../../../data/models/new_model.dart';
import '../../../../data/models/reservation_details_entites.dart';

abstract class UserStates extends Equatable {
  const UserStates();

  @override
  List<Object?> get props => [];
}

class DoctorInitial extends UserStates {}

class DoctorFEtchLoading extends UserStates {}

class DoctorFEtchSuccess extends UserStates {
  final List<Doctors> doctors;

  const DoctorFEtchSuccess(this.doctors);

  @override
  List<Object> get props => [doctors];
}

class DoctorFEtchFailure extends UserStates {
  final String error;

  const DoctorFEtchFailure({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

class SaveAppointmentLoading extends UserStates {}

class FetchNotifvationLoading extends UserStates {}

class FetchNotifvationSuucced extends UserStates {
  final List<ReservationDetailsModel> model;

  const FetchNotifvationSuucced(this.model);
}

class FetchNotifvationError extends UserStates {
  final String error;

  const FetchNotifvationError(this.error);
}

class SaveAppointmentSuccess extends UserStates {
  @override
  List<Object> get props => [];
}

class SaveAppointmentFailure extends UserStates {
  final String error;

  const SaveAppointmentFailure({
    required this.error,
  });
}

class GetInformationUserLoading extends UserStates {}

class GetInformationUserSuccessed extends UserStates {
  final UserModel userModel;

  const GetInformationUserSuccessed({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

class GetInformationUserERROR extends UserStates {
  final String error;

  const GetInformationUserERROR({required this.error});
  @override
  List<Object> get props => [error];
}

class GetInformationUser2rLoading extends UserStates {}

class GetInformationUser2rSuucced extends UserStates {}

class GetDoctorStreamLoading extends UserStates {}

class GetInformationUser2rSuccessd extends UserStates {}

class GetInformationUser2rError extends UserStates {}

class GetUpdateUserLoading extends UserStates {}

class GetUserrSuccessd extends UserStates {}

class GetUserrError extends UserStates {}
//!getUserData
class SaveDataLoading extends UserStates {}

class SaveDataError extends UserStates {
  final String error;

  const SaveDataError(this.error);
}


class SaveDataSucceed extends UserStates {
  final UserModel userModel;

  const SaveDataSucceed(this.userModel);
}

class SaveDataOfDoctorSucceed extends UserStates {
  final Doctors doctors;

  const SaveDataOfDoctorSucceed(this.doctors);
}

class SaveDataOfDoctorLoadind extends UserStates {}

class SaveDataOfDoctorError extends UserStates {
  final String error;

  const SaveDataOfDoctorError(this.error);
}

class GetAppointmentLoading extends UserStates {}

class GetAppointmentSuccesssd extends UserStates {
  final List<ReservationDetailsModel> model;

  const GetAppointmentSuccesssd(this.model);
  @override
  List<Object> get props => [model];
}

class GetAppointmentError extends UserStates {}
