import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/doctor_model.dart';
import '../../../data/models/reservation_details_entites.dart';
import '../../../domain/usecase/fetch_appointment_of_show_im_doctor_usecase.dart';
import '../../../domain/usecase/get_current_uid_usecase.dart';
import '../../../domain/usecase/get_doctor_info_usecase.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorStates> {
  static DoctorCubit get(context) => BlocProvider.of(context);
  final FetchAppointmentOfDoctorUsecase fetchAppointmentOfDoctorUsecase;
  final GetDoctorInfUSecase getDoctorInfUSecase;
  final GetCurrentUIDUseCase getUidUsecase;
  DoctorCubit(this.fetchAppointmentOfDoctorUsecase, this.getUidUsecase,
      this.getDoctorInfUSecase)
      : super(UserInitial());

  void fetchAppointment(String idofDoctor) async {
    emit(UserDoctorAppointmentLoading());
    try {
      final app = await fetchAppointmentOfDoctorUsecase.call(idofDoctor);
      // log(${app.length} );
      // print(${app.length})
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
      emit(UserDoctorAppointmentSussedd(app));
    } on SocketException catch (_) {
      emit(UserDoctorAppointmentError());
    } catch (_) {
      emit(UserDoctorAppointmentError());
    }
  }

  Stream<Doctors> getDoctorDataStream(String doctor) {
    emit(GetDoctorStreamLoading());

    return getDoctorInfUSecase.call(doctor);
  }
}
