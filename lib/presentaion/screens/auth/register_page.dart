// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vetma_final_project/injection_container.dart';
import 'package:vetma_final_project/presentaion/cubit/credential/credential_state.dart';
import 'package:vetma_final_project/presentaion/screens/auth/login_page.dart';
import 'package:vetma_final_project/presentaion/screens/bottom_screen/home_screen.dart';
import 'package:vetma_final_project/presentaion/screens/main/main_screen.dart';
import 'package:vetma_final_project/presentaion/widget/text_form_fild.dart';
import 'package:vetma_final_project/presentaion/widget/tost.dart';

import '../../../core/resources/assets_manger.dart';
import '../../../core/resources/icon_broken.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../data/models/new_model.dart';
import '../../cubit/credential/credential_cubit.dart';
import '../../widget/bottom_with_backgraund.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var firstNameController = TextEditingController();

  var lastnameController = TextEditingController();

  var emailController = TextEditingController();

  var numberOfPhoneController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();
  bool _isShowPassword = true;
  bool _isShowConfirmPassword = true;
  bool box = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CredentialCubit>(),
      child: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, state) {
          if (state is CredentialSuccess) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
            // BlocProvider.of<DoctorCubit>(context).getUSer();
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 800,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AssetsManager.register2,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        // margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Row(
                                //  crossAxisAlignment: CrossAxisAlignment.,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Text(
                                      'Create An Account',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  //!  Input First Name
                                  Expanded(
                                    child: DefaultFormFieldWidget(
                                      textInputType: TextInputType.name,
                                      controller: firstNameController,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'First Name is too short';
                                        }
                                        return null;
                                      },
                                      autofocus: false,
                                      isPassword: false,
                                      label: 'First Name',
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  //!  Input Last Name
                                  Expanded(
                                    child: DefaultFormFieldWidget(
                                      textInputType: TextInputType.name,
                                      type: TextInputType.emailAddress,
                                      controller: lastnameController,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Last Name is too short';
                                        }
                                        return null;
                                      },
                                      autofocus: false,
                                      isPassword: false,
                                      label: 'Last Name',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              //!  Input Email
                              DefaultFormFieldWidget(
                                textInputType: TextInputType.emailAddress,
                                controller: emailController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Email is too short';
                                  }
                                  return null;
                                },
                                autofocus: false,
                                isPassword: false,
                                label: 'Email',
                              ),
                              const SizedBox(height: 15),
                              DefaultFormFieldWidget(
                                textInputType: TextInputType.phone,
                                controller: numberOfPhoneController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Phone is too short';
                                  }
                                  return null;
                                },
                                autofocus: false,
                                isPassword: false,
                                label: 'Phone',
                              ),
                              //!  Input Password
                              const SizedBox(height: 15),
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
                                suffix: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isShowPassword = _isShowPassword == false
                                          ? true
                                          : false;
                                    });
                                  },
                                  child: Icon(
                                    _isShowPassword == false
                                        ? Icons.remove_red_eye
                                        : Icons.visibility_off_outlined,
                                  ),
                                ),
                                isPassword: _isShowPassword,
                                label: 'Password',
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              //!  Input Confirm Password
                              DefaultFormFieldWidget(
                                  textInputType: TextInputType.visiblePassword,
                                  controller: confirmPasswordController,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Confirm Password is too short';
                                    }

                                    if (value != passwordController.text) {
                                      return 'Confirm Password is too short';
                                    }
                                    return null;
                                  },
                                  autofocus: false,
                                  suffix: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isShowConfirmPassword =
                                              _isShowConfirmPassword == false
                                                  ? true
                                                  : false;
                                        });
                                      },
                                      icon: Icon(
                                        _isShowConfirmPassword == false
                                            ? Icons.remove_red_eye
                                            : Icons.visibility_off_outlined,
                                      )),
                                  isPassword: _isShowConfirmPassword,
                                  label: 'Confirm Password'),

                              //!   Box Cheak
                              ListTile(
                                leading: Checkbox(
                                  value: box,
                                  onChanged: (value) {
                                    setState(() {
                                      box = box == false ? true : false;
                                    });
                                  },
                                ),
                                title: Column(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "By checking this box, you are agreeing to",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      "our terms of service",
                                      style: TextStyle(
                                          fontSize: 15,
                                          decoration: TextDecoration.underline,
                                          color: HexColor('65399A')),
                                    ),
                                  ],
                                ),
                              ),
                              //!   Create Account Buttom
                              BottomWithBackgraund(
                                text: 'C R E A T E   A C C O U N T',
                                onPressed: () {
                                  if (passwordController.text.isEmpty) {
                                    toast('enter your username');
                                    return;
                                  }
                                  if (passwordController.text.isEmpty) {
                                    toast('enter your email');
                                    return;
                                  }
                                  if (passwordController.text.isEmpty) {
                                    toast('enter your password');
                                    return;
                                  }
                                  if (passwordController.text.isEmpty) {
                                    toast('enter your again password');
                                    return;
                                  }
                                  if (box == false) {
                                    toast('please accept for terms of service');
                                    return;
                                  }

                                  if (passwordController.text ==
                                      confirmPasswordController.text) {
                                  } else {
                                    toast("both password must be same");
                                    return;
                                  }

                                  CredentialCubit.get(context).signUpSubmit(
                                    user: UserModel(
                                      email: emailController.text,
                                      firstName: firstNameController.text,
                                      lastName: lastnameController.text,
                                      password: passwordController.text,
                                      isOnline: false,
                                      phoneNumber: numberOfPhoneController.text,
                                      status: "Hi! there i'm using this app",
                                    ),
                                  );
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => MainScreen()));
                                  // Navigator.pushNamed(
                                  //     context, Routes.mainRoute);
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Already Have account?",
                                style: TextStyle(
                                    fontSize: 15, color: HexColor('757575')),
                              ),
                              //!  Sign in Buttom
                              Container(
                                height: 50,
                                width: 300,
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: HexColor('CBCBCB'),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(35.0) //
                                      ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                  ),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        navigateTo(context, LoginScrren());
                                      },
                                      child: Text(
                                        'S I G N   I N',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: HexColor(
                                            '787878',
                                          ),
                                          fontSize: 20,
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
