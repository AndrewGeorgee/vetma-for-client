import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vetma_final_project/data/models/doctor_model.dart';
import 'package:vetma_final_project/domain/usecase/get_create_information_doctor_usecase.dart';
import 'package:vetma_final_project/domain/usecase/sign_up_doctor.dart';

import '../../../data/models/new_model.dart';
import '../../../domain/usecase/forget_password.dart';
import '../../../domain/usecase/get_create_current_user_usecase.dart';
import '../../../domain/usecase/get_current_uid_usecase.dart';
import '../../../domain/usecase/google_usecase.dart';
import '../../../domain/usecase/otp_usecase.dart';
import '../../../domain/usecase/sign_in_as_doctor_usecase.dart';
import '../../../domain/usecase/sign_in_usecase.dart';
import '../../../domain/usecase/sign_up_usecase.dart';
import '../../../domain/usecase/verify_phone_number.dart';
import 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignUpAsDoctorUseCase signUpUseCase;
  final VerifyPhoneNumberUsecase verifyPhoneNumberUsecase;
  final SignInUsecase signInUseCase;
  final GetCurrentUIDUseCase getCurrentUIDUseCase;
  final ForgetPassword forgotPasswordUseCase;
  final VerifyOtpUsecase verifyOtpUsecase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  final GoogleSignInUseCase googleSignInUseCase;
  final SigninAsDoctorUseCase signinAsDoctorUseCase;
  final SignUpDocotrUseCase signUpDocotrUseCase;
  final GetCreateCurrentDocotrUseCase getCreateCurrentDocotrUseCase;
  CredentialCubit(
      {required this.signUpUseCase,
      required this.signInUseCase,
      required this.getCreateCurrentUserUseCase,
      required this.forgotPasswordUseCase,
      required this.verifyPhoneNumberUsecase,
      required this.signUpDocotrUseCase,
      required this.verifyOtpUsecase,
      required this.signinAsDoctorUseCase,
      required this.getCreateCurrentDocotrUseCase,
      required this.getCurrentUIDUseCase,
      required this.googleSignInUseCase})
      : super(CredentialInitial());
  static CredentialCubit get(context) => BlocProvider.of(context);

  Future<void> forgotPassword({required String email}) async {
    try {
      await forgotPasswordUseCase.call(email);
    } on SocketException catch (m) {
      emit(CredentialFailure(m.message.toString()));
    }
  }

  Future<void> signInSubmit({
    required String email,
    required String password,
  }) async {
    emit(CredentialLoading());
    try {
      await signInUseCase.call(UserModel(email: email, password: password));

      emit(const CredentialSuccess());
    } on SocketException catch (m) {
      emit(CredentialFailure(m.message.toString()));
    }
  }

  Future<void> signInAsDoctorSubmit({
    required String email,
    required String password,
  }) async {
    emit(CredentialLoading());
    try {
      await signinAsDoctorUseCase
          .call(Doctors(email: email, password: password));
      await getCurrentUIDUseCase.call();
      emit(const CredentialSuccess());
    } on SocketException catch (m) {
      emit(CredentialFailure(m.message.toString()));
    }
  }

  Future<void> googleAuthSubmit() async {
    emit(CredentialLoading());
    try {
      await googleSignInUseCase.call();

      emit(const CredentialSuccess());
    } on SocketException catch (m) {
      emit(CredentialFailure(m.message.toString()));
    }
  }

  Future<void> signUpSubmit({required UserModel user}) async {
    emit(CredentialLoading());
    emit(CredentialLoading());
    try {
      await signUpUseCase
          .call(UserModel(email: user.email, password: user.password));
      await getCreateCurrentUserUseCase.call(user);
      await getCurrentUIDUseCase.call();

      emit(const CredentialSuccess());
      emit(const CredentialSuccess());
      emit(const CredentialSuccess());
      emit(const CredentialSuccess());
      emit(const CredentialSuccess());
      emit(const CredentialSuccess());
      emit(const CredentialSuccess());
      emit(const CredentialSuccess());

      emit(const CredentialSuccess());
    } on SocketException catch (m) {
      emit(CredentialFailure(m.message.toString()));
    }
  }

  Future<void> signUpDoctrSubmit({required Doctors doctors}) async {
    emit(CredentialLoading());
    try {
      await signUpDocotrUseCase
          .call(Doctors(email: doctors.email, password: doctors.password));

      await getCreateCurrentDocotrUseCase.call(doctors);
//  await getCurrentUIDUseCase.call();

      emit(const CredentialSuccess());
    } on SocketException catch (m) {
      emit(CredentialFailure(m.message.toString()));
    }
  }

  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    emit(CredentialLoading());
    try {
      await verifyPhoneNumberUsecase.call(phoneNumber);

      emit(const CredentialSuccess());
    } on SocketException catch (m) {
      emit(CredentialFailure(m.message.toString()));
    }
  }

  Future<void> verifyOtp({required String otp}) async {
    emit(CredentialLoading());
    try {
      await verifyOtpUsecase.call(otp);
      await getCurrentUIDUseCase.call();

      emit(const CredentialSuccess());
    } on SocketException catch (m) {
      emit(CredentialFailure(m.message.toString()));
    }
  }
}
