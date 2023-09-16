// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vetma_final_project/data/models/doctor_model.dart';
import 'package:vetma_final_project/presentaion/widget/tost.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/resources/assets_manger.dart';
import 'package:intl/intl.dart';
import '../../../core/resources/colors.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../data/models/get_appointment.dart';
import '../../widget/bottom_with_backgraund.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  late final DateTime now;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    day = DateFormat('EEEE').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Text(day!);
  }
}

String? day;

class SelectTime extends StatefulWidget {
  final Doctors doctor;

  const SelectTime({super.key, required this.doctor});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  int selectedIndex = -1;
  int selectedIndexTime = -1;

  // void updateSelectedIndex(int index) {
  //   setState(() {
  //     selectedIndex = (selectedIndex == index ? -1 : index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    // ignore: unused_local_variable
    final dayOfWeek = now.weekday;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('appointmentInterByDoctor')
            .where('idOfDoctor', isEqualTo: widget.doctor.id)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data!.docs
                .map((doc) => AppointmentDoctor.fromSnapshot(doc))
                .toList();
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AssetsManager.selectTime,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(
                          context, Routes.slectDoctorRoute);
                    },
                    icon: const Icon(
                      Icons.chevron_left_sharp,
                      color: Colors.black,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 630,
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
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          //! Photo of Doctor
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundImage: NetworkImage(
                                                widget.doctor.phote!),
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
                                                widget.doctor.name!,
                                                style: const TextStyle(
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
                                                minRating: 3,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 10,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
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
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // const SizedBox(height: 15),
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
                                        widget.doctor.bio!,
                                        maxLines: 3,
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
                                      //! Location of the Doctor
                                      children: [
                                        SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: Image.asset(
                                                IconManager.locationIcon)),
                                        const SizedBox(width: 5),
                                        Text(widget.doctor.location!),
                                        const SizedBox(width: 30),
                                        Row(children: [
                                          SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: Image.asset(
                                                  IconManager.monynIcon)),
                                          const SizedBox(width: 5),
                                          //! Price of the Doctor
                                          Text(widget.doctor.fee!),
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
                              //! Choose An Appointment
                              const SizedBox(height: 5),
                              Container(
                                width: 250,
                                height: 2,
                                color: ColorManager.prymaryColor,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Choose An Appointment',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 25),
                              // ignore: sized_box_for_whitespace
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SizedBox(
                                  height: 300,
                                  child: GridView.builder(
                                    itemCount: user.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 5,
                                            mainAxisSpacing: 5,
                                            mainAxisExtent: 170 / 2),
                                    itemBuilder: (context, index) {
                                      final appointment = user[index];
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedIndexTime = index;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color:
                                                      selectedIndexTime == index
                                                          ? ColorManager
                                                              .prymaryColor
                                                          : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  border: Border.all(
                                                      color: ColorManager
                                                          .prymaryColor)),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      appointment
                                                          .timeOfAppointment,
                                                      style: GoogleFonts.ibmPlexSans(
                                                          color:
                                                              selectedIndexTime ==
                                                                      index
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                          fontSize: 15),
                                                    ),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      appointment
                                                          .dayOfAppointment,
                                                      style: GoogleFonts.inder(
                                                          color:
                                                              selectedIndexTime ==
                                                                      index
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                          fontSize: 15),
                                                    ),
                                                  ]),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),
                              //!   Review
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=1380&t=st=1677430372~exp=1677430972~hmac=664e1418db35493c6b3d3a2b77961b5a2e5228af5c058329b423a979c50d898b',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Column(
                                    children: [
                                      const Text(
                                        'Merna ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      RatingBar.builder(
                                        initialRating: 5,
                                        minRating: 5,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 7,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          //   print(rating);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),

                        //! Confirm Reservatio BOTTOM
                        BottomWithBackgraund(
                          text: 'Confirm Reservation',
                          onPressed: () {
                            if (selectedIndexTime != -1) {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return ReservationDetails(
                              //     appointment: app[selectedIndex],
                              //     doctorDetailsModel: widget.doctor,
                              //     date: date[selectedIndex],
                              //     day: day[selectedIndex],
                              //   );
                              // }));

                              Navigator.pushNamed(
                                context,
                                Routes.reservationDetailsRoute,
                                arguments: SelectTimeArguments(
                                  appointment:
                                      user[selectedIndexTime].timeOfAppointment,
                                  doctors: widget.doctor,
                                  day: user[selectedIndexTime].dayOfAppointment,
                                  prise: widget.doctor.fee!,
                                ),
                              );
                            } else {
                              return toast('Select Time');
                            }
                            /*
                        Navigator.pushNamed(
                          context,
                          Routes.reservationDetailsRoute,
                          arguments: app[selectedIndex],
                        );
                        */
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

class SelectTimeArguments {
  final String appointment;
  final Doctors doctors;
  final String day;
  final String prise;

  SelectTimeArguments({
    required this.appointment,
    required this.doctors,
    required this.day,
    required this.prise,
  });
}
