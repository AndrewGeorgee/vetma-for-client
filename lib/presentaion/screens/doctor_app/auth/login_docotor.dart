import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vetma_final_project/injection_container.dart';
import 'package:vetma_final_project/presentaion/cubit/credential/credential_cubit.dart';
import 'package:vetma_final_project/presentaion/cubit/credential/credential_state.dart';
import 'package:vetma_final_project/presentaion/screens/bottom_screen/home_screen.dart';
import 'package:vetma_final_project/presentaion/screens/doctor_app/auth/register_of_doctor.dart';

import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/icon_broken.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../widget/bottom_with_backgraund.dart';
import '../../../widget/text_form_fild.dart';
import '../main_doctor_screen.dart';

class LoginOfUser extends StatefulWidget {
  const LoginOfUser({super.key});

  @override
  State<LoginOfUser> createState() => _LoginOfUserState();
}

class _LoginOfUserState extends State<LoginOfUser> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CredentialCubit>(),
      child: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, state) {
          if (state is CredentialSuccess) {
            //       Navigator.pushReplacementNamed(context, Routes.mainRoute);
            navigateTo(context, const MainScreenDctor());
          }

          if (state is CredentialLoading) {
            //       Navigator.pushReplacementNamed(context, Routes.mainRoute);
            const Scaffold(
              
              backgroundColor: Colors.transparent,
              body: Center(child: CircularProgressIndicator()));
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 130),
                      child: Container(
                        //alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1.5,
                              blurRadius: 5,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        width: double.infinity,
                        height: 750,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                                // width: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 50),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, Routes.getStartRoute);
                                      },
                                      icon: const Icon(
                                        IconBroken.Arrow___Left_2,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Sign in As Doctor',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                                // width: 5,
                              ),
                              SizedBox(
                                width: 270,
                                height: 100,
                                child: Image.asset(
                                  AssetsManager.logo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                                // width: 5,
                              ),
                              //!  Input Email
                              DefaultFormFieldWidget(
                                textInputType: TextInputType.emailAddress,

                                controller: emailController,
                                autofocus: false,
                                isPassword: false,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please inter Email';
                                  }
                                  return null;
                                },
                                // suffix: const Icon(Icons.abc),
                                label: 'Email',
                                type: TextInputType.emailAddress,
                              ),
                              const SizedBox(
                                height: 50,
                                // width: 5,
                              ),
                              //!  Input Password
                              DefaultFormFieldWidget(
                                textInputType: TextInputType.visiblePassword,
                                controller: passwordController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'password is too short';
                                  }
                                  return null;
                                },
                                autofocus: false,
                                suffix: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isShowPassword = isShowPassword == false
                                            ? true
                                            : false;
                                      });
                                    },
                                    icon: Icon(
                                      isShowPassword == false
                                          ? Icons.remove_red_eye
                                          : Icons.visibility_off_outlined,
                                    )),
                                isPassword: isShowPassword,
                                label: 'Password',
                              ),
                              const SizedBox(
                                height: 40,
                                // width: 5,
                              ),
                              //!  Login Buttom
                              BottomWithBackgraund2(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    CredentialCubit.get(context)
                                        .signInAsDoctorSubmit(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'L O G I N',
                              ),
                              //!  Login Forget password
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.forgetPasswordRoute);
                                },
                                child: const Text(
                                  'Forget Password?',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              //!   login with Phone
                              const Spacer(),
                              //!   Create Account Bottom
                              GestureDetector(
                                onTap: () {
                                  navigateTo(
                                      context, const SignUpDoctorScreen());
                                },
                                child: Container(
                                  height: 50,
                                  width: 300,
                                  margin: const EdgeInsets.all(10.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: HexColor('CBCBCB'),
                                      //  width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(35.0) //
                                        ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'C R E A T E   A N    A  C C O U N T',
                                        style: TextStyle(
                                          color: HexColor('6D6D6D'),
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
