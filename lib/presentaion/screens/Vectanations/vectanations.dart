import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vetma_final_project/core/resources/routes_manager.dart';

import '../../../core/resources/assets_manger.dart';
import '../../../core/resources/colors.dart';

class VectanationsScreen extends StatelessWidget {
  final Uri _url = Uri.parse('https://goo.gl/maps/79xFyMHZn8qBtpos7');
  final Uri _url2 = Uri.parse('https://goo.gl/maps/YrpUrD1kgXkC4xDJ7');
  final Uri _url3 = Uri.parse('https://goo.gl/maps/y3Er9e1j4Lo8Q4Ln8');

  VectanationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsManager.vaccinationsBack,
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
                Navigator.popAndPushNamed(context, Routes.mainRoute);
              },
              icon: const Icon(
                Icons.chevron_left_sharp,
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                const Center(
                    child: Text(
                  'Vaccination places that available',
                  style: TextStyle(fontSize: 20),
                )),
                const Center(
                  child: Text(
                    'in your area',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    onTap: _launchUrl,
                    child: Row(
                      children: [
                        const Text(
                          '3 Al-Mokattam St, \nAl Abageyah,  ',
                          style: TextStyle(fontSize: 18),
                        ),
                        const Spacer(),
                        Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                            color: ColorManager.prymaryColor,
                            border: Border.all(
                              color: ColorManager.prymaryColor,
                              width: 5.0,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0) //
                                    ),
                          ),
                          child: InkWell(
                            onTap: () => _launchUrl,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset(
                                        IconManager.locationIcon,
                                        color: Colors.white,
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    'Show\nLocation',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: ColorManager.switchColor,
                ),
                InkWell(
                  onTap: _launchUr3,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const Text(
                          'Animalia Vet ',
                          style: TextStyle(fontSize: 18),
                        ),
                        const Spacer(),
                        Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                            color: ColorManager.prymaryColor,
                            border: Border.all(
                              color: ColorManager.prymaryColor,
                              width: 5.0,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0) //
                                    ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image.asset(
                                      IconManager.locationIcon,
                                      color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Show\nLocation',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: ColorManager.switchColor,
                ),
                InkWell(
                  onTap: () {
                    _launchUr2();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const Text(
                          'DOMESTIX ANIMAL ',
                          style: TextStyle(fontSize: 18),
                        ),
                        const Spacer(),
                        Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                            color: ColorManager.prymaryColor,
                            border: Border.all(
                              color: ColorManager.prymaryColor,
                              width: 5.0,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0) //
                                    ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image.asset(
                                      IconManager.locationIcon,
                                      color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Show\nLocation',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: ColorManager.switchColor,
                ),
              ],
            ),
          ),
        ));
  }

  Widget ListOf() {
    return Column(
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              const Text(
                '12 Arabella Plaza\n  New Cairo ',
                style: TextStyle(fontSize: 18),
              ),
              const Spacer(),
              Container(
                width: 130,
                height: 50,
                decoration: BoxDecoration(
                  color: ColorManager.prymaryColor,
                  border: Border.all(
                    color: ColorManager.prymaryColor,
                    width: 5.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0) //
                      ),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                        IconManager.locationIcon,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Show\nLocation',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 2,
          color: ColorManager.switchColor,
        ),
      ],
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> _launchUr2() async {
    if (!await launchUrl(_url2)) {
      throw Exception('Could not launch $_url2');
    }
  }

  Future<void> _launchUr3() async {
    if (!await launchUrl(_url3)) {
      throw Exception('Could not launch $_url3');
    }
  }
}
