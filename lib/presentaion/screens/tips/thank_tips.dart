import 'package:flutter/material.dart';

import '../../../core/resources/assets_manger.dart';
import '../../../core/resources/routes_manager.dart';
import '../../widget/bottom_with_backgraund.dart';

class TankYouTips extends StatelessWidget {
  const TankYouTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.sendAQuestionRouts);
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const SizedBox(height: 10),
              const Text(
                'Thank You',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 30),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  AssetsManager.right,
                ))),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Your inquiry has been sent',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Image(image: AssetImage(AssetsManager.logo), height: 150),

              BottomWithBackgraund(
                text: 'Home',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.mainRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
