import 'package:flutter/material.dart';
import 'package:vetma_final_project/presentaion/widget/text_form_fild.dart';

import '../../../core/resources/assets_manger.dart';
import '../../../core/resources/routes_manager.dart';
import '../../widget/bottom_with_backgraund.dart';

class Mastercard extends StatelessWidget {
  final String prise;
  const Mastercard({super.key, required this.prise});

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

        //! Mastercard Detials
        body: Padding(
          padding: const EdgeInsets.all(25.0),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Mastercard',
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                              width: 60,
                              height: 50,
                              child: Image(
                                  image: AssetImage(AssetsManager.mastercard)))
                        ],
                      ),
                      const SizedBox(height: 15),
                      DefaultFormFieldWidget(
                          textInputType: TextInputType.name,
                          validate: (_) {
                            return null;
                          },
                          autofocus: false,
                          isPassword: false,
                          label: 'Name on card'),
                      const SizedBox(height: 15),
                      DefaultFormFieldWidget(
                          textInputType: TextInputType.number,
                          validate: (_) {
                            return null;
                          },
                          autofocus: false,
                          isPassword: false,
                          label: 'Card Number'),
                      const SizedBox(height: 15),
                      DefaultFormFieldWidget(
                          textInputType: TextInputType.number,
                          validate: (_) {
                            return null;
                          },
                          autofocus: false,
                          isPassword: false,
                          label: 'Expiry Date                  MM/YY'),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: DefaultFormFieldWidget(
                                textInputType: TextInputType.number,
                                validate: (_) {
                                  return null;
                                },
                                autofocus: false,
                                isPassword: false,
                                label: 'cvv'),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            flex: 2,
                            child: DefaultFormFieldWidget(
                                textInputType: TextInputType.number,
                                validate: (_) {
                                  return null;
                                },
                                autofocus: false,
                                isPassword: false,
                                label: 'Postal code'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(children: [
                          const Text(
                            'Subtotal',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Spacer(),
                          Text(
                            '$prise EGP',
                            style: const TextStyle(fontSize: 20),
                          )
                        ]),
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
                              '$resultString EGP',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      BottomWithBackgraund(
                        text: 'Confirm Reservation',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.thankYouRoute);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
