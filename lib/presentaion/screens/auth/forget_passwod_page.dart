import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vetma_final_project/presentaion/cubit/credential/credential_state.dart';
import 'package:vetma_final_project/presentaion/widget/bottom_with_backgraund.dart';
import 'package:vetma_final_project/presentaion/widget/text_form_fild.dart';

import '../../../injection_container.dart';
import '../../../core/resources/routes_manager.dart';
import '../../cubit/credential/credential_cubit.dart';
import '../../widget/tost.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CredentialCubit>(),
      child: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                icon: const Icon(
                  Icons.chevron_left_sharp,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Forget Password',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //! Email input
                  DefaultFormFieldWidget2(
                    textInputType: TextInputType.emailAddress,
                    validate: (_) {
                      return null;
                    },
                    autofocus: false,
                    controller: emailController,
                    isPassword: false,
                    label: 'Enter Email',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //!  Bottom Password
                  BottomWithBackgraund(
                    text: 'REST Password',
                    onPressed: () {
                      CredentialCubit.get(context)
                          .forgotPassword(email: emailController.text);
                      toast('Cheak Email');
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
