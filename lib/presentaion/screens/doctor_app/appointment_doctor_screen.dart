import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vetma_final_project/core/resources/colors.dart';
import 'package:vetma_final_project/presentaion/cubit/doctor_app_cubit/doctor_cubit.dart';

import '../../../core/resources/assets_manger.dart';
import '../../../data/models/reservation_details_entites.dart';

class DoctorAppointment extends StatefulWidget {
  const DoctorAppointment({super.key});

  @override
  State<DoctorAppointment> createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  // Future<void> _deleteAppointment(String appointmentId) async {
  //   await widget.appointmentRepository.deleteAppointment(appointmentId);
  //   setState(() {
  //     _appointments
  //         .removeWhere((appointment) => appointment.id == appointmentId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsManager.doctorScreenApp,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  StreamBuilder(
                      stream: DoctorCubit.get(context).getDoctorDataStream(
                          FirebaseAuth.instance.currentUser!.uid),
                      builder: (context, snapshot) {
                        final user = snapshot.data;
                        if (snapshot.hasData) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            child: Text(
                              'Hi,\n${user!.name}',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: ColorManager.prymaryColor),
                            ),
                          );
                        }
                        return const CircularProgressIndicator();
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'schedule',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('ReservationDetails').where( 'doctorUid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final appointments = snapshot.data!.docs
                              .map((doc) =>
                                  ReservationDetailsModel.fromSnapshot(doc))
                              .toList();
                              
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(8),
                                  itemBuilder: (context, index) {
                                    final app = appointments[index];
                                    return Container(
                                      height: 300,
                                      decoration: BoxDecoration(
                                        //  color: ColorManager.prymaryColor,
                                        border: Border.all(
                                          color: ColorManager.prymaryColor,
                                          width: 3.0,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(35.0) //
                                            ),
                                      ),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            app.nameOfUserReversation,
                                            style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          text: 'Date',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                    ' :${app.date} ',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: ColorManager
                                                                        .prymaryColor)),
                                                          ],
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   'Date : ${app.date}',
                                                      //   style: const TextStyle(
                                                      //       fontSize: 20,
                                                      //       fontWeight:
                                                      //           FontWeight
                                                      //               .w500),
                                                      // ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      RichText(
                                                        text: TextSpan(
                                                          text: 'day',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                    ' :${app.day} ',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: ColorManager
                                                                        .prymaryColor)),
                                                          ],
                                                        ),
                                                      ),

                                                      const SizedBox(
                                                        height: 10,
                                                      ),

                                                      RichText(
                                                        text: TextSpan(
                                                          text: 'Time',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                    ' :${app.appointment} ',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: ColorManager
                                                                        .prymaryColor)),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),

                                                      RichText(
                                                        text: TextSpan(
                                                          text: 'Fees',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                    ' :${app.priese} ',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: ColorManager
                                                                        .prymaryColor)),
                                                          ],
                                                        ),
                                                      ),
                                                    ]),
                                                const Spacer(),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    height: 110,
                                                    width: 110,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  55)),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  60)),
                                                      child: Image.network(
                                                          app.photoOfUser),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            margin: const EdgeInsets.all(15.0),
                                            padding: const EdgeInsets.all(2.0),
                                            decoration: BoxDecoration(
                                              //  color: ColorManager.prymaryColor,
                                              border: Border.all(
                                                color:
                                                    ColorManager.prymaryColor,
                                                width: 5.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(35.0) //
                                                      ),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection(
                                                        'ReservationDetails')
                                                    .doc(app.reservationUid)
                                                    .delete()
                                                    .catchError((error) =>
                                                        throw Exception(error));
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color:
                                                      ColorManager.prymaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                  itemCount: appointments.length),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ]),
          ),
        )));
  }
}

Widget widget() {
  return Container(
    width: 380,
    height: 300,
    decoration: BoxDecoration(
      //  color: ColorManager.prymaryColor,
      border: Border.all(
        color: ColorManager.prymaryColor,
        width: 3.0,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(35.0) //
          ),
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Andrew George',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date : 14/6/2023',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Time : 5:00 PM',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Payment : Cash',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Fees: 400 L.E',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ]),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(55)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                    child: Image.asset('assets/logo/profile_default.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  //  color: ColorManager.prymaryColor,
                  border: Border.all(
                    color: ColorManager.prymaryColor,
                    width: 5.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(35.0) //
                      ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorManager.prymaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  //  color: ColorManager.prymaryColor,
                  border: Border.all(
                    color: ColorManager.prymaryColor,
                    width: 5.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(35.0) //
                      ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorManager.prymaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
