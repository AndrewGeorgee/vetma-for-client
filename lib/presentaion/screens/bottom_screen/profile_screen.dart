import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vetma_final_project/core/resources/routes_manager.dart';

import '../../../core/resources/assets_manger.dart';
import '../../../core/resources/colors.dart';
import '../../../core/resources/icon_broken.dart';
import '../../../data/datasourse/imp_vetma_remote_datasourse.dart';
import '../../../data/models/new_model.dart';
import '../../cubit/auth/auth_cubit.dart';
import '../../cubit/user_cubit/user_cubit.dart';
import '../../widget/bottom_with_backgraund.dart';
import '../../widget/tost.dart';

class ProfileScreenBottomNav extends StatefulWidget {
  const ProfileScreenBottomNav({super.key});

  @override
  State<ProfileScreenBottomNav> createState() => _ProfileScreenBottomNavState();
}

class _ProfileScreenBottomNavState extends State<ProfileScreenBottomNav> {
  File? _image;
  final picker = ImagePicker();
  String? profileUrl;
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
    return StreamBuilder(
      stream: UserCubit.get(context)
          .getUserDataStream(FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.data!;
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        color: ColorManager.profile,
                        border: Border.all(
                          color: ColorManager.profile,
                          width: 5.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      getImage();
                                    },
                                    child: Container(
                                      height: 110,
                                      width: 110,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(55)),
                                      ),
                                      child: ClipRRect(
                                        
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(60)),
                                        child: profileWidget(
                                          imageUrl: user.profileUrl,
                                          image: _image,
                                         
                                        ),
                                      ),
                                    ),
                                  ),
                                  // ClipRRect(
                                  //       borderRadius: const BorderRadius.all(
                                  //           Radius.circular(60)),
                                  //       child: profileWidget(
                                  //           imageUrl: user.profileUrl,
                                  //           image: _image),
                                  //     ),
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
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${user.firstName}\n${user.lastName}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 25),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ListTile(
                      leading: Image.asset(
                        IconManager.emaiIcon,
                        height: 30,
                        width: 30,
                      ),
                      minLeadingWidth: 0,
                      title: const Text(
                        'Email',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        user.email,
                        style: const TextStyle(fontSize: 15),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: ColorManager.prymaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ListTile(
                      leading: Image.asset(
                        IconManager.phoneIcon,
                        height: 30,
                        width: 30,
                      ),
                      minLeadingWidth: 0,
                      title: const Text(
                        'Mobile',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        user.phoneNumber,
                        style: const TextStyle(fontSize: 15),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: ColorManager.prymaryColor,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: BottomWithBackgraund(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).loggedOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.splashRoute, (route) => false);
                    },
                    text: 'L O G O U T',
                  ),
                ),
                if (_image != null)
                  Center(
                    child: BottomWithBackgraund(
                      onPressed: () {
                        _updateProfile();
                      },
                      text: 'Update',
                    ),
                  ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void _updateProfile() {
    BlocProvider.of<UserCubit>(context).getUpdateUser(
      user: UserModel(
        uid: FirebaseAuth.instance.currentUser!.uid,
        profileUrl: profileUrl!,
      ),
    );
    toast("Profile Updated");
  }
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
        progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
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
