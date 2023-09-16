import 'package:flutter/material.dart';
import 'package:vetma_final_project/presentaion/screens/bottom_screen/home_screen.dart';
import 'package:vetma_final_project/presentaion/screens/pay_ment/master_card.dart';

import 'package:vetma_final_project/presentaion/widget/bottom_with_backgraund.dart';

import '../../../core/resources/assets_manger.dart';
import '../../../core/resources/routes_manager.dart';
import 'cash.dart';

class Paymentmethod extends StatefulWidget {
  final String prise;
  const Paymentmethod({
    super.key,
    required this.prise,
  });

  @override
  State<Paymentmethod> createState() => _PaymentmethodState();
}

class _PaymentmethodState extends State<Paymentmethod> {
  int radiobottom = 1;
  setSelectedRadio(int? value) {
    setState(() {
      radiobottom = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();

              Navigator.popAndPushNamed(
                  context, Routes.reservationDetailsRoute);
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                'Payment Methods',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //! Mastercard
                        ListTile(
                          title: const Text('Mastercard',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          trailing: Radio(
                              // autofocus: false,

                              value: 1,
                              groupValue: radiobottom,
                              onChanged: (value) {
                                setSelectedRadio(value);
                              }),
                          leading: Container(
                            width: 50,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  AssetsManager.mastercard,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //! Cash
                        const SizedBox(height: 20),
                        ListTile(
                          title: const Text('Cash',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          trailing: Radio(
                              // autofocus: false,

                              value: 2,
                              groupValue: radiobottom,
                              onChanged: (value) {
                                setSelectedRadio(value);
                              }),
                          leading: Container(
                            width: 50,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  AssetsManager.cash,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //! Navigation
                        const SizedBox(height: 20),
                        BottomWithBackgraund(
                          text: 'Continue',
                          onPressed: () {
                            if (radiobottom == 1) {
                              navigateTo(
                                  context,
                                  Mastercard(
                                    prise: widget.prise,
                                  ));
                            }
                            if (radiobottom == 2) {
                              // Navigator.pushReplacementNamed(
                              //     context, Routes.cashHomeRoute);
                              navigateTo(
                                  context,
                                  CashHome(
                                    prise: widget.prise,
                                  ));
                            }
                          },
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ));
  }

  Widget slectIteam({
    required final String text,
    required final AssetImage image,
  }) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 10,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: (image),
            ),
          ),
        ),
      ],
    );
  }
}
