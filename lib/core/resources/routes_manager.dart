// ignore_for_file: dead_code, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vetma_final_project/data/models/doctor_model.dart';
import 'package:vetma_final_project/data/models/reservation_details_entites.dart';

import 'package:vetma_final_project/presentaion/screens/auth/forget_passwod_page.dart';
import 'package:vetma_final_project/presentaion/screens/auth/login_page.dart';
import 'package:vetma_final_project/presentaion/screens/doctor/select_location.dart';
import 'package:vetma_final_project/presentaion/screens/doctor/select_time.dart';
import 'package:vetma_final_project/presentaion/screens/main/main_screen.dart';
import 'package:vetma_final_project/presentaion/screens/pay_ment/cash.dart';
import 'package:vetma_final_project/presentaion/screens/pay_ment/master_card.dart';
import 'package:vetma_final_project/presentaion/screens/pay_ment/payment_method.dart';
import 'package:vetma_final_project/presentaion/screens/pay_ment/thank_you.dart';
import 'package:vetma_final_project/presentaion/screens/phone/otp_page.dart';
import 'package:vetma_final_project/presentaion/screens/phone/phone_auth_page.dart';
import 'package:vetma_final_project/presentaion/screens/auth/register_page.dart';
import 'package:vetma_final_project/presentaion/screens/start/get_start_pages.dart';
import 'package:vetma_final_project/presentaion/screens/start/splach_page.dart';
import 'package:vetma_final_project/presentaion/screens/tips/tips_screen.dart';


import '../../presentaion/cubit/user_cubit/user_cubit.dart';
import '../../presentaion/cubit/user_cubit/user_state.dart';
import '../../presentaion/screens/Vectanations/vectanations.dart';
import '../../presentaion/screens/doctor/reservation_details.dart';
import '../../presentaion/screens/doctor/select_doctor.dart';
import '../../presentaion/screens/pharmacy/dry_food_Screen.dart';
import '../../presentaion/screens/pharmacy/pharmacy_screen.dart';
import '../../presentaion/screens/tips/send_question.dart';
import '../../presentaion/screens/tips/thank_tips.dart';

class Routes {
  static const splashRoute = '/';
  static const getStartRoute = '/getStart';
  static const loginRoute = '/Login';
  static const phoneRoute = '/phone';
  static const otpRoute = '/otp';
  static const registerRoute = '/register';
  static const mainRoute = '/main';

  static const forgetPasswordRoute = '/forgetPassword';
  static const slectDoctorRoute = '/slectDoctorRoute';
  static const slectLocationRoute = '/slectLocation';
  static const selectTimeRoute = '/selectTime';
  static const reservationDetailsRoute = '/reservationDetails';
  static const paymentmethodRoute = '/paymentmethod';
  static const cashHomeRoute = '/cashHome';
  static const thankYouRoute = '/thankYou';
  static const mastercardRoute = '/mastercard';
  static const vectanationsRoute = '/vectanationsRoute';
  static const tipRoutes = '/tipRoutes';
  static const sendAQuestionRouts = '/sendAQuestionRouts';
  static const tankYouTips = '/tankYouTips';
  static const pharmacyRoutes = '/pharmacyRoutes';
  static const mediceRoutes = '/mediceRoutes';
  static const dryFoodRoutes = '/dryFoodRoutes';
}

class RouteGenerateor {
  static Route<dynamic> getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashRoute:
        return PageTransition(
          //  childCurrent: Text(''),
          alignment: Alignment.topCenter,
          type: PageTransitionType.bottomToTop,
          child: const SplachScreen(),
        );
      case Routes.getStartRoute:
        return PageTransition(
          //   childCurrent: LoginScrren(),
          type: PageTransitionType.fade,
          alignment: Alignment.bottomCenter,
          child: const GetStart(),
        );
      case Routes.loginRoute:
        return PageTransition(
          //  childCurrent: MainScreen(),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.bottomToTop,
          child: const LoginScrren(),
        );
      case Routes.registerRoute:
        return PageTransition(
          //childCurrent: MainScreen(),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.bottomToTop,
          child: const RegisterScreen(),
        );
      case Routes.phoneRoute:
        return PageTransition(
          //childCurrent: OtpScreen(),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.bottomToTop,
          child: PhoneScreen(),
        );
        break;
      case Routes.otpRoute:
        return PageTransition(
          // childCurrent: MainScreen(),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: OtpScreen(),
        );
        break;

      case Routes.forgetPasswordRoute:
        return PageTransition(
          //   childCurrent: MainScreen(),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          type: PageTransitionType.fade,
          child: ForgetPasswordScreen(),
        );
        break;
      case Routes.mainRoute:
        return PageTransition(
            //childCurrent: MainScreen(),
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.topLeft,
            type: PageTransitionType.fade,
            child: const MainScreen());
        break;
      case Routes.slectDoctorRoute:
        return PageTransition(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topLeft,
          type: PageTransitionType.fade,
          child: const SlectDoctor(),
        );
        break;
      case Routes.slectLocationRoute:
        return PageTransition(
          // childCurrent: SlectLocation(),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: BlocBuilder<UserCubit, UserStates>(
            builder: (context, state) {
              return const SlectLocation();
            },
          ),
        );
        break;
      case Routes.selectTimeRoute:
        if (args is Doctors) {
          return PageTransition(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.bottomCenter,
            type: PageTransitionType.fade,
            child: SelectTime(
              doctor: args,
            ),
          );
        }
        return unDefindRoute();
        break;

        break;
      case Routes.paymentmethodRoute:
        final args = settings.arguments as ReservationDetailsModel;
        return PageTransition(
          //  childCurrent: MainScreen(),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: Paymentmethod(
            prise: args.priese,
          ),
        );
        break;
      case Routes.cashHomeRoute:
        final args = settings.arguments as ReservationDetailsModel;
        return PageTransition(
          //  childCurrent: MainScreen(),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: CashHome(
            prise: args.priese,
          ),
        );
        break;
      case Routes.thankYouRoute:
        return PageTransition(
          //  childCurrent: MainScreen(),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: const ThankYou(),
        );
        break;
      case Routes.reservationDetailsRoute:
        final args = settings.arguments as SelectTimeArguments;
        // final arg1 = settings.arguments as UserModel;
        return PageTransition(
          //  childCurrent: MainScreen(),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: ReservationDetails(
            appointment: args.appointment,
    
            doctors: args.doctors,
            day: args.day,
            prise: args.prise,
          ),
        );
        break;
      case Routes.mastercardRoute:
        final args = settings.arguments as SelectTimeArguments;
        return PageTransition(
          //  childCurrent: MainScreen(),
          duration: const Duration(milliseconds: 20),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: Mastercard(
            prise: args.prise,
          ),
        );
        break;
      case Routes.vectanationsRoute:
        return PageTransition(
          //  childCurrent: MainScreen(),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: VectanationsScreen(),
        );
        break;
      case Routes.tipRoutes:
        return PageTransition(
          //  childCurrent: MainScreen(),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: const TipScreen(),
        );
        break;
      case Routes.sendAQuestionRouts:
        return PageTransition(
          //  childCurrent: MainScreen(),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: SendAQuestion(),
        );
        break;
      case Routes.tankYouTips:
        return PageTransition(
          //  childCurrent: MainScreen(),
          duration: const Duration(milliseconds: 400),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: const TankYouTips(),
        );
        break;
      case Routes.pharmacyRoutes:
        return PageTransition(
          //childCurrent: OtpScreen(),
          duration: const Duration(milliseconds: 400),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: const PharmacyScreen(),
          childCurrent: const Scaffold(),
        );
        break;
      case Routes.mediceRoutes:
        return PageTransition(
          //childCurrent: OtpScreen(),
          duration: const Duration(milliseconds: 400),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: const Scaffold(),
        );
        break;
      case Routes.dryFoodRoutes:
        return PageTransition(
          //childCurrent: OtpScreen(),
          duration: const Duration(milliseconds: 400),
          alignment: Alignment.bottomCenter,
          type: PageTransitionType.fade,
          child: const DryFoodScreen(),
          childCurrent: const Scaffold(),
        );
        break;
      default:
        return unDefindRoute();
    }
    return unDefindRoute();
  }

  static Route<dynamic> unDefindRoute() {
    return PageTransition(
      //  childCurrent: MainScreen(),
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.center,
      type: PageTransitionType.fade,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'No Route Fond',
          ),
        ),
        body: const Center(
          child: Text(
            'No Route Fond',
          ),
        ),
      ),
    );
  }
}
