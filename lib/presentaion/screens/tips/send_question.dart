import 'package:flutter/material.dart';
import 'package:vetma_final_project/core/resources/colors.dart';

import '../../../core/resources/assets_manger.dart';
import '../../../core/resources/routes_manager.dart';
import '../../widget/bottom_with_backgraund.dart';

// ignore: must_be_immutable
class SendAQuestion extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  SendAQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsManager.tipScreen,
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
                Navigator.pushNamed(context, Routes.tipRoutes);
              },
              icon: const Icon(
                Icons.chevron_left_sharp,
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Send a question',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'How we can help you?',
                      style: TextStyle(
                          fontSize: 15, color: ColorManager.prymaryColor),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // ignore: sized_box_for_whitespace
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorManager.send,
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorManager.send),
                            borderRadius: BorderRadius.circular(
                              25.0,
                            ),
                          ),
                        ),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        maxLines: 15,
                        minLines: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: BottomWithBackgraund(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.tankYouTips);
                          textEditingController.clear();
                        },
                        text: 'Submit',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
