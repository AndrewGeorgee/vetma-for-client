import 'package:flutter/material.dart';
import 'package:vetma_final_project/core/resources/routes_manager.dart';
import 'package:vetma_final_project/presentaion/screens/pharmacy/dry_food_Screen.dart';
import 'package:vetma_final_project/presentaion/screens/pharmacy/medice_svreen.dart';

import '../../../core/resources/assets_manger.dart';
import '../bottom_screen/home_screen.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsManager.pharmacyBackGround,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, Routes.mainRoute);
                  },
                  icon: const Icon(
                    Icons.chevron_left_sharp,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
                //!Pharmacy screen
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'Pharmacy',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.popAndPushNamed(context, Routes.dryFoodRoutes);
                    navigateTo(context, const DryFoodScreen());
                  },
                  child: Center(
                      child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.asset(AssetsManager.dryFOod))),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  'Dry Foods',
                  style: TextStyle(fontSize: 25),
                )),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    //Navigator.popAndPushNamed(context, Routes.mediceRoutes);
                    navigateTo(context, const MediceScreen());
                  },
                  child: Center(
                      child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.asset(AssetsManager.medicine))),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  'Medicine',
                  style: TextStyle(fontSize: 25),
                ))
              ],
            ),
          ),
        ));
  }
}
