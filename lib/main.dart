import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vetma_final_project/injection_container.dart';
import 'package:vetma_final_project/presentaion/cubit/auth/auth_cubit.dart';
import 'package:vetma_final_project/presentaion/cubit/credential/credential_cubit.dart';
import 'package:vetma_final_project/presentaion/cubit/doctor_app_cubit/doctor_cubit.dart';
import 'package:vetma_final_project/presentaion/cubit/user_cubit/user_cubit.dart';
import 'package:vetma_final_project/presentaion/screens/main/main_screen.dart';
import 'package:vetma_final_project/presentaion/screens/start/splach_page.dart';

import 'bloc_observer.dart';
import 'core/resources/routes_manager.dart';
import 'presentaion/cubit/auth/auth_state.dart';

void main() async {
  await ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider<CredentialCubit>(
          create: (_) => sl<CredentialCubit>(),
        ),
        BlocProvider<UserCubit>(
            create: (_) => sl<UserCubit>()
              ..getUserData()
              ..getUserDataStream(FirebaseAuth.instance.currentUser!.uid)),
        BlocProvider<DoctorCubit>(
            create: (_) => sl<DoctorCubit>()
              ..fetchAppointment(FirebaseAuth.instance.currentUser!.uid)
              ..getDoctorDataStream(FirebaseAuth.instance.currentUser!.uid))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: LoginOfUser(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerateor.getRoute,
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return const MainScreen();
                } else {
                  return const SplachScreen();
                }
              },
            );
          }
        },
      ),
    );
  }
}
