import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vetma_final_project/core/resources/routes_manager.dart';
import 'package:vetma_final_project/data/models/doctor_model.dart';
import 'package:vetma_final_project/presentaion/cubit/credential/credential_cubit.dart';
import 'package:vetma_final_project/presentaion/cubit/credential/credential_state.dart';
import 'package:vetma_final_project/presentaion/widget/text_form_fild.dart';

import '../../../../injection_container.dart';
import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/icon_broken.dart';
import '../../../../data/datasourse/imp_vetma_remote_datasourse.dart';

import '../../../widget/bottom_with_backgraund.dart';
import '../../../widget/tost.dart';

import '../main_doctor_screen.dart';

class SignUpDoctorScreen extends StatefulWidget {
  const SignUpDoctorScreen({super.key});

  @override
  State<SignUpDoctorScreen> createState() => _SignUpDoctorScreenState();
}

class _SignUpDoctorScreenState extends State<SignUpDoctorScreen> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var bioController = TextEditingController();
  var feeController = TextEditingController();
  var locationController = TextEditingController();

  var emailController = TextEditingController();

  var numberOfPhoneController = TextEditingController();

  final passwordController = TextEditingController();
  File? _image;
  final picker = ImagePicker();
  String profileUrl = '';
  var confirmPasswordController = TextEditingController();

  Future getImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          StorageProviderRemoteDataSource.uploadFile(file: _image!)
              .then((value) {
            log('profileUrl');
            print("profileUrl");
            setState(() {
              profileUrl = value;
            });
          });
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      toast("error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CredentialCubit>(),
      child: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, state) {
          if (state is CredentialSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MainScreenDctor()));
            // BlocProvider.of<DoctorCubit>(context).getUSer();
          }
        },
        builder: (context, state) {
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
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, Routes.getStartRoute);
                      },
                      icon: const Icon(
                        Icons.chevron_left_sharp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              'Registration of Doctor',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                //getImage();
                              },
                              child: Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Container(
                                      height: 110,
                                      width: 110,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(55)),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(60)),
                                        child: profileWidget(
                                            imageUrl: ' user.profileUrl',
                                            image: _image),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const CircleAvatar(
                                        radius: 20.0,
                                        child: Icon(
                                          IconBroken.Camera,
                                          size: 16.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        getImage();
                                      },
                                    ),
                                  ]),
                            ),
                            const SizedBox(height: 20),
                            DefaultFormFieldWidget(
                                textInputType: TextInputType.text,
                                validate: (_) {
                                  return null;
                                },
                                autofocus: false,
                                controller: nameController,
                                isPassword: false,
                                label: 'Name'),
                            const SizedBox(height: 10),
                            DefaultFormFieldWidget(
                                textInputType: TextInputType.text,
                                validate: (_) {
                                  return null;
                                },
                                controller: emailController,
                                autofocus: false,
                                isPassword: false,
                                label: 'email'),
                            const SizedBox(height: 10),
                            DefaultFormFieldWidget(
                                textInputType: TextInputType.text,
                                validate: (_) {
                                  return null;
                                },
                                controller: passwordController,
                                autofocus: false,
                                isPassword: false,
                                label: 'Password'),
                            const SizedBox(height: 10),
                            DefaultFormFieldWidget(
                                textInputType: TextInputType.text,
                                validate: (_) {
                                  return null;
                                },
                                controller: bioController,
                                autofocus: false,
                                isPassword: false,
                                label: 'bio'),
                            const SizedBox(height: 10),
                            DefaultFormFieldWidget(
                                textInputType: TextInputType.number,
                                validate: (_) {
                                  return null;
                                },
                                autofocus: false,
                                isPassword: false,
                                controller: feeController,
                                label: 'fee'),
                            const SizedBox(height: 10),
                            DefaultFormFieldWidget(
                                textInputType: TextInputType.text,
                                validate: (_) {
                                  return null;
                                },
                                controller: locationController,
                                autofocus: false,
                                isPassword: false,
                                label: 'location'),
                            BottomWithBackgraund(
                              text: 'C R E A T E   A C C O U N T',
                              onPressed: () {
                                if (passwordController.text.isEmpty) {
                                  toast('enter your username');
                                  return;
                                }
                                if (passwordController.text.isEmpty) {
                                  toast('enter your email');
                                  return;
                                }
                                if (passwordController.text.isEmpty) {
                                  toast('enter your password');
                                  return;
                                }
                                if (passwordController.text.isEmpty) {
                                  toast('enter your again password');
                                  return;
                                }
                  
                                CredentialCubit.get(context).signUpDoctrSubmit(
                                    doctors: Doctors(
                                  bio: bioController.text,
                                  email: emailController.text,
                                  fee:feeController  .text,
                                  location: locationController.text,
                                  name: nameController.text,
                                  //    id: FirebaseAuth.instance.currentUser!.uid,
                                  password: passwordController.text,
                                  phote: profileUrl,
                                ));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

  Widget profileWidget({String? imageUrl, File? image}) {
    print("image value $image");
    if (image == null) {
      if (imageUrl == null) {
        return Image.asset(
          'assets/logo/profile_default.png',
          fit: BoxFit.cover,
        );
      } else {
        return CachedNetworkImage(
          imageUrl: imageUrl,
          // fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              SizedBox(
                  height: 50,
                  width: 50,
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      child: const CircularProgressIndicator())),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      }
    } else {
      return Image.file(
        image,
        fit: BoxFit.cover,
      );
    }
  }
}
