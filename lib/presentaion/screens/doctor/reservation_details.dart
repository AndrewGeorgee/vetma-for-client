// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vetma_final_project/core/resources/colors.dart';
import 'package:vetma_final_project/core/resources/routes_manager.dart';
import 'package:vetma_final_project/presentaion/screens/bottom_screen/home_screen.dart';

import '../../../injection_container.dart';
import '../../../core/resources/assets_manger.dart';
import '../../../data/datasourse/imp_vetma_remote_datasourse.dart';
import '../../../data/models/doctor_model.dart';
import '../../../data/models/reservation_details_entites.dart';
import '../../cubit/user_cubit/user_cubit.dart';
import '../../cubit/user_cubit/user_state.dart';
import '../../widget/tost.dart';
import '../pay_ment/payment_method.dart';

class ReservationDetails extends StatelessWidget {
  final String appointment;
  final String day;
  final Doctors doctors;

  final String prise;

  ReservationDetails({
    super.key,
    required this.appointment,
    required this.doctors,
    required this.day,

    required this.prise,
  });
  final RemoteDataSourse _dataSource = RemoteDataSourse();
  final formKey = GlobalKey<FormState>();
  final ReservationDetailsModel _reservationDetail =
      ReservationDetailsModel(reservationUid: '');
  void saveReservation(context) async {
    // Form is valid, save the reservation
    try {
      await _dataSource.saveReservationDetailsDataSource(_reservationDetail);
      // Reservation saved successfully
      toast('Reservationsavedsuccessfully');
    } catch (e) {
      // An error occurred while saving the reservation
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.overveiw),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocProvider(
        create: (context) => sl<UserCubit>()..getUserData(),
        child: BlocConsumer<UserCubit, UserStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SaveDataSucceed) {
              final user = state.userModel;
              return Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  scrolledUnderElevation: 5,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.popAndPushNamed(
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
                    child: Center(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 35),
                          const Text(
                            'Reservation Details',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 60),
                          Container(
                            width: double.infinity,
                            height: 350,
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
                            //! information Of Doctor
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
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
                                            CircleAvatar(
                                              radius: 40,
                                              backgroundImage: NetworkImage(
                                                doctors.phote!,
                                              ),
                                              // backgroundColor: Colors.amber,
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  doctors.name!,
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                RatingBar.builder(
                                                  initialRating: 5,
                                                  minRating: 5,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 10,
                                                  itemPadding: const EdgeInsets
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
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                //! Ditals of appointment
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset(
                                              IconManager.dataIcon)),
                                      const SizedBox(width: 7),
                                      Column(children: [
                                        Text(
                                          day,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      
                                      ]),
                                    ]),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 30,
                                        height: 30,
                                        child:
                                            Image.asset(IconManager.timeIcon)),
                                    const SizedBox(width: 5),
                                    Column(
                                      children: [
                                        Text(
                                          appointment,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset(
                                              IconManager.monynIcon)),
                                      const SizedBox(width: 5),
                                      Text(
                                        doctors.fee!,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          ' EGP ',
                                          style: TextStyle(
                                            fontSize: 13,
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
                                const SizedBox(height: 20),
                                Container(
                                  width: 300,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: ColorManager.prymaryColor,
                                    // border: Border.all(),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      try {
                                        await _dataSource
                                            .saveReservationDetailsDataSource(
                                                ReservationDetailsModel(
                                          appointment: appointment,
                                          day: day,
                                          reservationUid: '',
                                          nameOfDocotr: doctors.name!,
                                          priese: doctors.fee!,
                                     
                                          doctorUid: doctors.id!,
                                          nameOfUserReversation: user.firstName,
                                          userId: user.uid,
                                          photoOfUser: user.profileUrl,
                                        ));

                                        toast('Reservation saved successfully');
                                        navigateTo(
                                            context,
                                            Paymentmethod(
                                              prise: prise,
                                            ));
                                      } catch (e) {
                                        toast2(
                                            'Please choose another date because this date is reserved by another user');
                                      }

                                      print(doctors.fee);
                                    },
                                    //! Check  out
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Check  out',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
