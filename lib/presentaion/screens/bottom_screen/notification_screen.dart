import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vetma_final_project/presentaion/cubit/user_cubit/user_cubit.dart';
import 'package:vetma_final_project/presentaion/cubit/user_cubit/user_state.dart';

import '../../../injection_container.dart';
import '../../../core/resources/colors.dart';

class NotificationScreenBottomNav extends StatelessWidget {
  const NotificationScreenBottomNav({super.key});
  dispose() {
    UserCubit;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserCubit>()
        ..fetchNotifcationAppointment(FirebaseAuth.instance.currentUser!.uid),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IconButton(
                //     onPressed: () {},
                //     icon: const Icon(Icons.arrow_back_ios_rounded)),
                // const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    'Notifications',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                ),

                BlocConsumer<UserCubit, UserStates>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is FetchNotifvationLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FetchNotifvationSuucced) {
                      return Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              final doctor = state.model[index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: ColorManager.containerColor,
                                  border: Border.all(
                                    color: ColorManager.containerColor,
                                    width: 5.0,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(35.0) //
                                      ),
                                ),
                                child: Row(children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.square,
                                        size: 20,
                                      )),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'The',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 15),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: ' appointment ',
                                              style: TextStyle(
                                                  color: ColorManager
                                                      .prymaryColor)),
                                          TextSpan(
                                            text:
                                                ' is scheduled for ${doctor.date} at ${doctor.appointment} ${doctor.nameOfDocotr} with',
                                          ),
                                           TextSpan(
                                            style:TextStyle(
                                                  color: ColorManager
                                                      .prymaryColor) ,
                                              text:
                                                  ' ${doctor.nameOfDocotr}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: state.model.length),
                      );
                    } else if (state is FetchNotifvationError) {
                      return Center(child: Text(state.error));
                    } else {
                      return const Center(child: Text('error'));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget not() {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.containerColor,
        border: Border.all(
          color: ColorManager.containerColor,
          width: 5.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(35.0) //
            ),
      ),
      child: Row(children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.square,
              size: 20,
            )),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'The',
              style: const TextStyle(color: Colors.black, fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                    text: ' appointment ',
                    style: TextStyle(color: ColorManager.prymaryColor)),
                const TextSpan(text: ' is scheduled for Wednesday at 11'),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
