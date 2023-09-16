import 'package:get_it/get_it.dart';
import 'package:vetma_final_project/data/datasourse/base_remoto_data_source.dart';
import 'package:vetma_final_project/data/repository/repository.dart';
import 'package:vetma_final_project/domain/usecase/fetch_noti_appointment_usecas.dart';
import 'package:vetma_final_project/domain/usecase/forget_password.dart';
import 'package:vetma_final_project/domain/usecase/get_create_current_user_usecase.dart';
import 'package:vetma_final_project/domain/usecase/get_current_uid_usecase.dart';
import 'package:vetma_final_project/domain/usecase/get_update_user_usecase.dart';
import 'package:vetma_final_project/domain/usecase/google_usecase.dart';
import 'package:vetma_final_project/domain/usecase/is_sign_in_usecase.dart';
import 'package:vetma_final_project/domain/usecase/sign_in_usecase.dart';
import 'package:vetma_final_project/domain/usecase/sign_out_usecase.dart';
import 'package:vetma_final_project/domain/usecase/sign_up_doctor.dart';
import 'package:vetma_final_project/presentaion/cubit/auth/auth_cubit.dart';
import 'package:vetma_final_project/presentaion/cubit/doctor_app_cubit/doctor_cubit.dart';

import 'data/datasourse/imp_vetma_remote_datasourse.dart';
import 'domain/repositery/vetma_repositery.dart';

import 'domain/usecase/fetch_appointment_of_show_im_doctor_usecase.dart';
import 'domain/usecase/get_create_information_doctor_usecase.dart';
import 'domain/usecase/get_doctor_info_usecase.dart';
import 'domain/usecase/get_doctors_usecase.dart';
import 'domain/usecase/get_iformation_of_user.dart';
import 'domain/usecase/get_user_inf_usecase.dart';
import 'domain/usecase/save_reservation_details_usecase.dart';
import 'domain/usecase/sign_in_as_doctor_usecase.dart';
import 'domain/usecase/sign_up_usecase.dart';
import 'domain/usecase/otp_usecase.dart';
import 'domain/usecase/verify_phone_number.dart';
import 'presentaion/cubit/credential/credential_cubit.dart';
import 'presentaion/cubit/user_cubit/user_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  init() async {
    /// Bloc
    sl.registerFactory(() => CredentialCubit(
          googleSignInUseCase: sl(),
          signinAsDoctorUseCase: sl(),
          signUpUseCase: sl(),
          verifyOtpUsecase: sl(),
          forgotPasswordUseCase: sl(),
          getCreateCurrentDocotrUseCase: sl(),
          signUpDocotrUseCase: sl(),
          signInUseCase: sl(),
          verifyPhoneNumberUsecase: sl(),
          getCreateCurrentUserUseCase: sl(),
          getCurrentUIDUseCase: sl(),
        ));
    sl.registerFactory(() => AuthCubit(
          isSignInUseCase: sl(),
          signOutUseCase: sl(),
          getCurrentUIDUseCase: sl(),
        ));

    sl.registerFactory(() => UserCubit(
        getUidUsecase: sl(),
        getDoctorUsecase: sl(),
        fetchNotficationAppointmentOfDoctorUsecase: sl(),
   
        saveReservationDetailsUSeCAse: sl(),
        getUpdateUserUseCase: sl(),
        uSecase: sl(),
        getUserInformationUsecase: sl(),
        getCreateCurrentUserUseCase: sl(), getDoctorInfUSecase: sl()));

    sl.registerFactory(
      () => DoctorCubit(sl(), sl(), sl()),
    );

    /// Use Cases
    sl.registerLazySingleton(() => SignUpAsDoctorUseCase(sl()));
    sl.registerLazySingleton(() => ForgetPassword(sl()));
    sl.registerLazySingleton(() => GoogleSignInUseCase(sl()));
    sl.registerLazySingleton(() => SigninAsDoctorUseCase(sl()));
    sl.registerLazySingleton(() => VerifyPhoneNumberUsecase(sl()));
    sl.registerLazySingleton(() => VerifyOtpUsecase(sl()));
    sl.registerLazySingleton(() => SignInUsecase(sl()));
    sl.registerLazySingleton(() => GetDoctorUsecase(sl()));
    sl.registerLazySingleton(() => GetCurrentUIDUseCase(sl()));
    sl.registerLazySingleton(() => GetCreateCurrentUserUseCase(sl()));
    sl.registerLazySingleton(() => FetchNotficationAppointmentOfDoctorUsecase(sl()));
    sl.registerLazySingleton(() => IsSignInUseCase(sl()));
    sl.registerLazySingleton(() => SignOutUseCase(sl()));
    sl.registerLazySingleton(() => SaveReservationDetailsUSeCAse(sl()));
    sl.registerLazySingleton(() => GetUserInformationUsecase(sl()));
    sl.registerLazySingleton(() => GetInformationTextUSecase(sl()));
    sl.registerLazySingleton(() => GetUpdateUserUseCase(sl()));
    sl.registerLazySingleton(() => SignUpDocotrUseCase(sl()));
    sl.registerLazySingleton(() => GetCreateCurrentDocotrUseCase(sl()));
    sl.registerLazySingleton(() => FetchAppointmentOfDoctorUsecase(sl()));
    sl.registerLazySingleton(() => GetDoctorInfUSecase(sl()));

    /// Repository
    sl.registerLazySingleton<VetmaRepositery>(() => VetmaRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSourse());
  }
}
