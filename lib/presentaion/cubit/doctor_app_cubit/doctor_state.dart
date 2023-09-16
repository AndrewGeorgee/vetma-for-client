part of 'doctor_cubit.dart';

abstract class DoctorStates extends Equatable {
  const DoctorStates();

  @override
  List<Object> get props => [];
}

class UserInitial extends DoctorStates {}

//!fetchAppointment
class UserDoctorAppointmentLoading extends DoctorStates {}

class UserDoctorAppointmentSussedd extends DoctorStates {
  final List<ReservationDetailsModel> model;

  const UserDoctorAppointmentSussedd(this.model);

  @override
  List<Object> get props => [model];
}

class UserDoctorAppointmentError extends DoctorStates {}

//! getDoctorData
class UserDoctorDataLoading extends DoctorStates {}

class UserDoctorDataError extends DoctorStates {
  final String error;

  const UserDoctorDataError(this.error);
}

class UserDoctorDataSuueed extends DoctorStates {
  final Doctors doctors;

  const UserDoctorDataSuueed(this.doctors);
}
//! getDoctorDataStream
class GetDoctorStreamLoading extends DoctorStates {}
