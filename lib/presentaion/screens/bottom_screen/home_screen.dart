import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vetma_final_project/core/resources/assets_manger.dart';
import 'package:vetma_final_project/core/resources/colors.dart';
import 'package:vetma_final_project/core/resources/icon_broken.dart';
import 'package:vetma_final_project/core/resources/routes_manager.dart';
import 'package:vetma_final_project/presentaion/widget/alert_dialog.dart';

import '../../cubit/user_cubit/user_cubit.dart';
import '../pharmacy/pharmacy_screen.dart';

class HomeScreenBottomNav extends StatelessWidget {
  const HomeScreenBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.mainScreen),
          fit: BoxFit.cover,
        ),
      ),
      child: StreamBuilder(
        stream: UserCubit.get(context)
            .getUserDataStream(FirebaseAuth.instance.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data!;

            return Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          //! AppBar
                          MaterialButton(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              onPressed: () {
                                // Navigator.pushReplacementNamed(
                                //     context, Routes.loginRoute);
                              },
                              // ignore: sized_box_for_whitespace
                              child: Container(
                                width: 20,
                                height: 20,
                                child: Image.asset(
                                  'assets/animals/menu.png',
                                  color: Colors.white,
                                ),
                              )),
                          const Spacer(),
                          SizedBox(
                            width: 65,
                            height: 50,
                            child: IconButton(
                              padding: const EdgeInsets.only(
                                right: 15,
                                top: 15,
                              ),
                              onPressed: () {
                                showMyDialog(context);
                              },
                              icon: Image.asset(
                                AssetsManager.cat,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //! Body Screen
                      //if (state is UserSucceed)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Text(
                          'Hi\n${user.firstName}',
                          style: TextStyle(
                              fontSize: 30,
                              color: ColorManager.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      //! Search
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          autofocus: false,
                          //cursorWidth: 50,
                          //  color: ColorManager.switchColor,
                          decoration: InputDecoration(
                            focusColor: ColorManager.textColor,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            fillColor: Colors.white,
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey[300]),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(25)),

                            contentPadding: const EdgeInsets.only(left: 20.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              gapPadding: 0,
                            ),
                            suffixIcon: Icon(
                              IconBroken.Search,
                              color: ColorManager.switchColor,
                            ),
                            // labelStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),

                      //! Client Visit
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.slectLocationRoute);

                          // navigateTo(context, SlectDoctor());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Center(
                            child: SizedBox(
                              height: 180,
                              width: 500,
                              child: Image.asset(AssetsManager.clientvisit),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          iteams(
                            text: 'Vet Pharmacy',
                            photo: AssetsManager.vetPharmac,
                            ontab: () {
                              // Navigator.popAndPushNamed(
                              //     context, Routes.pharmacyRoutes);
                              navigateTo(context, const PharmacyScreen());
                            },
                          ),
                          const SizedBox(width: 10),
                          iteams(
                            text: 'Vaccinations',
                            photo: AssetsManager.vaccinations,
                            ontab: () {
                              Navigator.pushNamed(
                                  context, Routes.vectanationsRoute);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          iteams(
                              text: 'TIPS',
                              photo: AssetsManager.tipIcon,
                              ontab: () {
                                Navigator.pushNamed(context, Routes.tipRoutes);
                              }),
                        ],
                      ),
                    ],
                  ),
                ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget iteams({
    required String text,
    required String photo,
    required GestureTapCallback ontab,
  }) =>
      Expanded(
        child: Column(
          children: [
            InkWell(
              onTap: ontab,
              child: Container(
                width: 200,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(photo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
