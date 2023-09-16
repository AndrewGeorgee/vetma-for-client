import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vetma_final_project/injection_container.dart';

import '../../../core/resources/assets_manger.dart';
import '../../../core/resources/colors.dart';
import '../../../core/resources/routes_manager.dart';
import '../../cubit/user_cubit/user_cubit.dart';
import '../../cubit/user_cubit/user_state.dart';
import '../../widget/drop_buttom.dart';

class SlectLocation extends StatefulWidget {
  const SlectLocation({super.key});

  @override
  State<SlectLocation> createState() => _SlectLocationState();
}

class _SlectLocationState extends State<SlectLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.selectLocation),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocProvider(
        create: (context) => sl<UserCubit>(),
        child: BlocBuilder<UserCubit, UserStates>(
          builder: (context, state) {
            log('sddsdsdsds');
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    //    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, Routes.mainRoute);
                  },
                  icon: const Icon(
                    Icons.chevron_left_sharp,
                    color: Colors.black,
                  ),
                ),
              ),
              body: Center(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),

                    //! Input Location
                    const Text(
                      'Select Your Location',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: DrropDownBootoom()),

                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        color: ColorManager.prymaryColor,
                        border: Border.all(
                          color: ColorManager.prymaryColor,
                          width: 5.0,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(35.0),
                        ),
                      ),

                      //! bottom
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.slectDoctorRoute);
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
