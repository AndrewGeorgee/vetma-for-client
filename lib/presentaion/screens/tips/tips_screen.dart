import 'package:flutter/material.dart';
import 'package:vetma_final_project/core/resources/colors.dart';

import '../../../core/resources/assets_manger.dart';
import '../../../core/resources/routes_manager.dart';
import '../../widget/bottom_with_backgraund.dart';

class TipScreen extends StatefulWidget {
  const TipScreen({super.key});

  @override
  State<TipScreen> createState() => _TipScreenState();
}

class _TipScreenState extends State<TipScreen> {
  bool whaIs = true;
  bool bookAnAppointment = true;
  bool dryFood = true;
  bool animals = true;
  bool together = true;
  bool pregnancy = true;

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
              Navigator.pushNamed(context, Routes.mainRoute);
            },
            icon: const Icon(
              Icons.chevron_left_sharp,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tips',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'What is ',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'VEMTA ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.prymaryColor)),
                          const TextSpan(text: ' ?'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          whaIs = whaIs == false ? true : false;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                if (whaIs == false)
                  const Text(
                    'Vetma is a mobile application that makes it easy for you to reach for an experienced veterinarian doctor to make an appointment with a few clicks.Vetma also includes much advice on how to care for your pet better.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: ColorManager.line,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'How can I book an ',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'appointment',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.prymaryColor)),
                          const TextSpan(text: ' ?'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          bookAnAppointment =
                              bookAnAppointment == false ? true : false;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                if (bookAnAppointment == false)
                  const Text(
                    'By using VETMA application or by pet clinic telephone number.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: ColorManager.switchColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'ls the animals eat dry food  ',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'only ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.prymaryColor)),
                          const TextSpan(text: ' ?'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          dryFood = dryFood == false ? true : false;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                if (dryFood == false)
                  const Text(
                    'No \nThey can eat as humans food but except spicy food or sweets because it could make them ill ( cats & dogs only ) Nuts -rice- lentils.....( for birds only).',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: ColorManager.switchColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'what is the average age for',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 19),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' animals',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.prymaryColor)),
                          const TextSpan(text: ' ?'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          animals = animals == false ? true : false;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                if (animals == false)
                  const Text(
                    ' • Cats : (12-18 years .              • Dogs : (10-13)years .\n                       • Birds : ( up to 20) years.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: ColorManager.switchColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'how can dogs and cats live ',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 19),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'together',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.prymaryColor)),
                          const TextSpan(text: ' ?'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          together = together == false ? true : false;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                if (together == false)
                  const Text(
                    'Set aside separate places to eat, drink and toilet and give them both space. Set up a '
                    'meeting'
                    ' where you introduce one to the other briefly and then let them go their separate ways. If one animal is curious about the other, allow them to sniff and explore.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: ColorManager.switchColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'what about animals ',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'pregnancy',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.prymaryColor)),
                          const TextSpan(text: ' ?'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          pregnancy = pregnancy == false ? true : false;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                if (pregnancy == false)
                  const Text(
                    'For cats: 64 days \nFor dogs: 60-70 days.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: ColorManager.switchColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: BottomWithBackgraund(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Routes.sendAQuestionRouts);
                        },
                        text: 'Send a question')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
