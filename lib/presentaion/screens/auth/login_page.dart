import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:vetma_final_project/injection_container.dart';
import 'package:vetma_final_project/core/resources/icon_broken.dart';
import 'package:vetma_final_project/core/resources/routes_manager.dart';
import 'package:vetma_final_project/presentaion/cubit/credential/credential_state.dart';
import 'package:vetma_final_project/presentaion/screens/bottom_screen/home_screen.dart';
import 'package:vetma_final_project/presentaion/screens/main/main_screen.dart';
import 'package:vetma_final_project/presentaion/widget/bottom_with_backgraund.dart';
import 'package:vetma_final_project/presentaion/widget/login_with.dart';

import '../../../core/resources/assets_manger.dart';

import '../../cubit/credential/credential_cubit.dart';
import '../../widget/text_form_fild.dart';

class LoginScrren extends StatefulWidget {
  const LoginScrren({super.key});

  @override
  State<LoginScrren> createState() => _LoginScrrenState();
}

class _LoginScrrenState extends State<LoginScrren> {
  // final String namr;
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    //!  background Screen
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.backRoud),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocProvider(
          create: (context) => sl<CredentialCubit>(),
          child: BlocConsumer<CredentialCubit, CredentialState>(
            listener: (context, state) {
              if (state is CredentialSuccess) {
                //       Navigator.pushReplacementNamed(context, Routes.mainRoute);
                navigateTo(context, const MainScreen());
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
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
                            height: 760,
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
                                        padding:
                                            const EdgeInsets.only(right: 105),
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
                                        'Sign in',
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
                                    height: 10,
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
                                    height: 10,
                                    // width: 5,
                                  ),
                                  //!  Input Password
                                  DefaultFormFieldWidget(
                                    textInputType:
                                        TextInputType.visiblePassword,
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
                                            isShowPassword =
                                                isShowPassword == false
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
                                    height: 10,
                                    // width: 5,
                                  ),
                                  //!  Login Buttom
                                  BottomWithBackgraund2(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        CredentialCubit.get(context)
                                            .signInSubmit(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    },
                                    text: 'L O G I N',
                                  ),
                                  const SizedBox(height: 20),
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
                                  const SizedBox(height: 20),

                                  LoginWith(
                                      text: 'Login With phone',
                                      image: AssetImage(
                                        AssetsManager.telephone,
                                      ),
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                            context, Routes.phoneRoute);
                                      }),
                                  //!   login with Google
                                  LoginWith(
                                      text: 'Login with Google',
                                      image: AssetImage(
                                        AssetsManager.google,
                                      ),
                                      onTap: () {
                                        CredentialCubit.get(context)
                                            .googleAuthSubmit();
                                      }),
                                  const SizedBox(height: 40),
                                  //!   Create Account Bottom
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, Routes.registerRoute);
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
        ));
  }
}
