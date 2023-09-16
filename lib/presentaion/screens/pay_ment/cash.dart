import 'package:flutter/material.dart';
import 'package:vetma_final_project/core/resources/assets_manger.dart';
import 'package:vetma_final_project/core/resources/routes_manager.dart';

import '../../../core/resources/colors.dart';
import '../../widget/bottom_with_backgraund.dart';

class CashHome extends StatelessWidget {
  final String prise;
  const CashHome({
    super.key,
    required this.prise,
  });

  @override
  Widget build(BuildContext context) {
    String num1 = prise;
    String num2 = '20';
    int result = int.parse(num1) + int.parse(num2);

    String resultString = result.toString();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.selectTime),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, Routes.paymentmethodRoute);
            },
            icon: const Icon(
              Icons.chevron_left_sharp,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 400,
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
              //! Diyals of Cash
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Cash',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 5),
                          Container(
                            width: 30,
                            height: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  AssetsManager.cash,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Text(
                            'Subtotal',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Spacer(),
                          Text(
                            ' $prise EGP',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            'Tax',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          Text(
                            '20 EGP',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 300,
                      height: 2,
                      color: ColorManager.prymaryColor,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Spacer(),
                          Text(
                            '$resultString EGP  ',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),

                    //! Confirm Reservation
                    BottomWithBackgraund(
                      text: 'Confirm Reservation',
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.thankYouRoute);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
