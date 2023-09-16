import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vetma_final_project/core/resources/assets_manger.dart';
import 'package:vetma_final_project/core/resources/icon_broken.dart';
import 'package:vetma_final_project/core/resources/routes_manager.dart';

import 'package:vetma_final_project/presentaion/cubit/user_cubit/user_state.dart';

import '../../../injection_container.dart';

import '../../../core/resources/colors.dart';

import '../../cubit/user_cubit/user_cubit.dart';
import '../../widget/text_form_fild.dart';

class SlectDoctor extends StatelessWidget {
  const SlectDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.selectDoctor),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocProvider(
        create: (context) => sl<UserCubit>()..fetchDoctors(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            
            leading: IconButton(
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.popAndPushNamed(context, Routes.slectLocationRoute);
              },
              icon: const Icon(
                Icons.chevron_left_sharp,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            scrolledUnderElevation: 5,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultFormFieldWidget2(
                    textInputType: TextInputType.text,
                    validate: (_) {
                      return null;
                    },
                    autofocus: false,
                    isPassword: false,
                    label: 'Search For Specific Doctor',
                    suffix: const Icon(IconBroken.Search),
                    prefix: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Cat Doctors At ',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 25),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Single tapped.
                            },
                        ),
                        TextSpan(
                            text: ' New Cairo',
                            style: TextStyle(
                                color: ColorManager.prymaryColor, fontSize: 25),
                            recognizer: DoubleTapGestureRecognizer()
                              ..onDoubleTap = () {
                                // Double tapped.
                              }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  BlocConsumer<UserCubit, UserStates>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if (state is DoctorFEtchLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is DoctorFEtchSuccess) {
                        return ListView.separated(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(8),
                          itemCount: state.doctors.length,
                          itemBuilder: (BuildContext context, int index) {
                            final doctor = state.doctors[index];
                            log("doctor from db id is : ${doctor.id} + name is : ${doctor.name}");
                            return Container(
                              width: double.infinity,
                              height: 270,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                // border: Border.all(),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      //! Informatiom Doctor
                                      Container(
                                        width: double.infinity,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: ColorManager.containerColor,
                                          //  border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              //! Photo of Doctor
                                              CircleAvatar(
                                                radius: 40,
                                                backgroundImage:
                                                    NetworkImage(doctor.phote!),
                                                // backgroundColor: Colors.amber,
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  //! Name of Doctor
                                                  Text(
                                                    doctor.name!,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  //! RatingBar Doctor
                                                  RatingBar.builder(
                                                    initialRating: 5,
                                                    minRating: 5,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemSize: 10,
                                                    itemPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 2.0),
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate: (rating) {
                                                      //   print(rating);
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: 60,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color: ColorManager
                                                          .prymaryColor,
                                                      // border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                    ),
                                                    child: const Center(
                                                        child: Text(
                                                      'EXPERT',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: Image.asset(
                                                IconManager.doctorIcon)),

                                        const SizedBox(width: 5),
                                        //! Definition of the Doctor
                                        Expanded(
                                          child: Text(
                                            doctor.bio!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: Image.asset(
                                                    IconManager.locationIcon)),
                                            // Icon(
                                            //   IconBroken.Location,
                                            //   color: ColorManager.prymaryColor,
                                            // ),
                                            const SizedBox(width: 5),
                                            //! Location of the Doctor
                                            Text(doctor.location!),
                                            const SizedBox(width: 50),
                                            Row(children: [
                                              SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: Image.asset(
                                                      IconManager.monynIcon)),
                                            
                                              //! Price of the Doctor
                                              Text(doctor.fee!),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                                child: Text(
                                                  ' EGP ',
                                                  style: TextStyle(
                                                    fontSize: 9,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              const Text(
                                                'Fees',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  //! Appointment
                                  const Spacer(),
                                  Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: ColorManager.prymaryColor,
                                      // border: Border.all(),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, Routes.selectTimeRoute,
                                            arguments: doctor);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: Image.asset(
                                                  IconManager.pluseIcon)),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            'Book Appointment',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        );
                      } else if (state is DoctorFEtchFailure) {
                        return Center(child: Text(state.error));
                      } else {
                        return const Center(child: Text('error'));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget doctor(
  context,
) {
  return Container(
    width: double.infinity,
    height: 300,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Colors.white,
      // border: Border.all(),
      borderRadius: BorderRadius.circular(40),
    ),
    child: Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            //! Informatiom Doctor
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: ColorManager.containerColor,
                //  border: Border.all(),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    //! Photo of Doctor
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=1380&t=st=1677430372~exp=1677430972~hmac=664e1418db35493c6b3d3a2b77961b5a2e5228af5c058329b423a979c50d898b',
                      ),
                      // backgroundColor: Colors.amber,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! Name of Doctor
                        const Text(
                          ' model.name,',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        //! RatingBar Doctor
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 10,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            //   print(rating);
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                            color: ColorManager.prymaryColor,
                            // border: Border.all(),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Center(
                              child: Text(
                            'EXPERT',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                IconBroken.Location,
                color: ColorManager.prymaryColor,
              ),
              const SizedBox(width: 5),
              //! Definition of the Doctor
              const Text('Anatomy and embryo Specialist '),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Icon(
                    IconBroken.Location,
                    color: ColorManager.prymaryColor,
                  ),
                  const SizedBox(width: 5),
                  //! Location of the Doctor
                  const Text('17 Arabella Plaza , New Cairo'),
                  const SizedBox(width: 20),
                  Row(children: [
                    Icon(
                      Icons.money_rounded,
                      color: ColorManager.prymaryColor,
                    ),
                    const SizedBox(width: 5),
                    //! Price of the Doctor
                    const Text(' 400 '),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        ' EGP ',
                        style: TextStyle(
                          fontSize: 9,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Fees',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
        //! Appointment
        const SizedBox(height: 30),
        Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            color: ColorManager.prymaryColor,
            // border: Border.all(),
            borderRadius: BorderRadius.circular(40),
          ),
          child: MaterialButton(
            onPressed: () {
              // Navigator.pushReplacementNamed(context, Routes.selectTime);
              Navigator.pushNamed(context, Routes.selectTimeRoute);

              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => SelectTime()));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconBroken.Plus,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Book Appointment',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

// class DoctorListScreen extends StatefulWidget {
//   @override
//   State<DoctorListScreen> createState() => _DoctorListScreenState();
// }

// class _DoctorListScreenState extends State<DoctorListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<DoctorCubit>()..fetchDoctors(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Doctor List'),
//         ),
//         body: BlocConsumer<DoctorCubit, DoctorState>(
//           builder: (context, state) {
//             if (state is DoctorSuccess) {
//               return ListView.builder(
//                 itemCount: state.doctors.length,
//                 itemBuilder: (context, index) {
//                   final doctor = state.doctors[index];
//                   print(doctor.name);
//                   return ListTile(
//                     title: Text(doctor.name),
//                     subtitle: Text(doctor.bio),
//                     trailing: Icon(Icons.arrow_forward_ios),
//                     onTap: () {
//                       // navigate to doctor detail screen
//                     },
//                   );
//                 },
//               );
//             }
//             return Center(child: Text('error'));
//           },
//           listener: (context, state) {
//             if (state is DoctorSuccess) {
//               DoctorCubit.get(context).fetchDoctors();
//             }
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             context.read<DoctorCubit>().fetchDoctors();
//           },
//           child: Icon(Icons.refresh),
//         ),
//       ),
//     );
//   }
// }
