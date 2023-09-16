
// ignore: depend_on_referenced_packages
import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/resources/assets_manger.dart';
import '../../../core/resources/routes_manager.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  Timer? timer;
  startDelay() {
    timer = Timer(const Duration(seconds: 3), goNext);
  }

  goNext() {
 
    Navigator.pushReplacementNamed(context, Routes.getStartRoute);
  }

  @override
  void initState() {
    super.initState();
    startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 340,
          child: Image(
            image: AssetImage(
              AssetsManager.logo,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
