import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/reservation_details_entites.dart';
import '../models/doctor_model.dart';
import '../models/new_model.dart';
import 'base_remoto_data_source.dart';

class RemoteDataSourse implements BaseRemoteDataSource {
  late final FirebaseFirestore firestore;

  @override
  Future<void> saveReservationDetailsDataSource(
      ReservationDetailsModel reservationDetail) async {
    final docRef =
        FirebaseFirestore.instance.collection('ReservationDetails').doc();

    // Check if the selected day and time is already reserved
    final querySnapshot = await FirebaseFirestore.instance
        .collection('ReservationDetails')
        .where('doctorUid', isEqualTo: reservationDetail.doctorUid)
        .where('day', isEqualTo: reservationDetail.day)
        .where('appointment', isEqualTo: reservationDetail.appointment)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // A reservation already exists for the selected day and time
      throw Exception(
          'This time slot is already reserved. Please choose another time.');
    }

    reservationDetail.reservationUid = docRef.id;
    await docRef.set(reservationDetail.toMap());
  }

  @override
  Future<void> signUp(UserModel user) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
  }

  @override
  Future<void> signUpDoctor(Doctors doctors) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: doctors.email!, password: doctors.password!);
  }

  @override
  Future<void> getCreateCurrentDoctor(Doctors doctors) async {
    final userCollection = FirebaseFirestore.instance.collection("doctors");
    final uid = await getCurrentUId();
    userCollection.doc(uid).get().then((userDoc) {
      final newUser = Doctors(
        bio: doctors.bio,
        email: doctors.email,
        password: doctors.password,
        fee: doctors.fee,
        name: doctors.name,
        location: doctors.location,
        phote: doctors.phote,
        id: uid,
      ).toMap();
      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
        return;
      } else {
        userCollection.doc(uid).update(newUser);
        print("user already exist");
        return;
      }
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Future<void> getCreateCurrentUser(UserModel user) async {
    final userCollection = FirebaseFirestore.instance.collection("users");
    final uid = await getCurrentUId();
    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
        firstName: user.firstName,
        lastName: user.lastName,
        uid: uid,
        phoneNumber: user.phoneNumber,
        email: user.email,
        profileUrl: user.profileUrl,
        isOnline: user.isOnline,
        status: user.status,
        dob: user.dob,
        gender: user.gender,
      ).toDocument();
      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
        return;
      } else {
        userCollection.doc(uid).update(newUser);
        print("user already exist");
        return;
      }
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Future<void> forgetPasssword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<String> getCurrentUId() async =>
      FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<void> googleAuth() async {
    final usersCollection = FirebaseFirestore.instance.collection("users");

    try {
      final GoogleSignInAccount? account = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await account!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final information =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      usersCollection
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((user) async {
        if (!user.exists) {
          var uid = FirebaseAuth.instance.currentUser!.uid;
          var newUser = UserModel(
                  firstName: information!.displayName!,
                  lastName: information.displayName!,
                  email: information.email!,
                  phoneNumber: information.phoneNumber == null
                      ? ""
                      : information.phoneNumber!,
                  profileUrl:
                      information.photoURL == null ? "" : information.photoURL!,
                  isOnline: false,
                  status: "",
                  dob: "",
                  gender: "",
                  uid: information.uid)
              .toDocument();

          usersCollection.doc(uid).set(newUser);
        }
      }).whenComplete(() {
        print("New User Created Successfully");
      }).catchError((e) {
        print("getInitializeCreateCurrentUser ${e.toString()}");
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<bool> isSignIn() async =>
      FirebaseAuth.instance.currentUser?.uid != null;
  late String verificationId;

  @override
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signInWithPhone(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    this.verificationId = verificationId;
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  @override
  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);

    await signInWithPhone(credential);
  }

  @override
  Future<void> signInWithPhone(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> signIn(UserModel user) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<List<Doctors>> fetchDoctors() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('doctors').get();
    log('snapshot');
    final docs = snapshot.docs;
    return docs.map((doc) => Doctors.fromJson(doc.data())).toList();
  }

  @override
  Future<UserModel> getUserInfo(userId) async {
    final uid = await getCurrentUId();

    DocumentSnapshot<Map<String, dynamic>> snap =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    log(snap.id);
    if (snap.exists) {
      print(snap.data());
      return UserModel.fromJson(snap.data()!);
    } else {
      return Future.error('error');
    }
  }

  @override
  Stream<UserModel> getUserInfo2(String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((doc) {
      return UserModel.fromJson(doc.data()!);
    });
  }

  @override
  Stream<Doctors> getDoctorInfoStream(String userId) {
    return FirebaseFirestore.instance
        .collection('doctors')
        .doc(userId)
        .snapshots()
        .map((doc) {
      return Doctors.fromJson(doc.data()!);
    });
  }

  @override
  Future<String> uploadFile({required File file}) async {
    final ref = FirebaseStorage.instance.ref().child(
        "Documents/${DateTime.now().millisecondsSinceEpoch}${getNameOnly(file.path)}");
    print("file ${file.path}");

    final uploadTask = ref.putFile(file);

    final imageUrl =
        (await uploadTask.whenComplete(() {})).ref.getDownloadURL();
    return await imageUrl;
  }

  static String getNameOnly(String path) {
    return path.split('/').last.split('%').last.split("?").first;
  }

  @override
  Future<void> getUpdateUser(UserModel user) async {
    Map<String, dynamic> userInformation = {};
    print(user.firstName);
    log(user.firstName);
    final userCollection = FirebaseFirestore.instance.collection("users");

    if (user.profileUrl != "") {
      userInformation['profileUrl'] = user.profileUrl;
    }
    if (user.status != "") {
      userInformation['status'] = user.status;
    }
    if (user.phoneNumber != "") {
      userInformation["phoneNumber"] = user.phoneNumber;
    }
    if (user.firstName != "") {
      userInformation["firstName"] = user.firstName;
    }

    userCollection.doc(user.uid).update(userInformation);
  }

  @override
  Future<void> signinDoctor(Doctors doctors) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: doctors.email!,
      password: doctors.password!,
    );
  }

  @override
  Future<List<ReservationDetailsModel>> fetchReservationDetailsDoctor(
      String id) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('ReservationDetails')
        .where('doctorUid', isEqualTo: id)
        .get();
    return snapshot.docs
        .map((doc) => ReservationDetailsModel(
              appointment: doc['appointment'],
         
              priese: doc["priese"],
              day: doc['day'],
              userId: doc['userId'],
              date: doc['date'],
              doctorUid: doc['doctorUid'],
              nameOfDocotr: doc['nameOfDocotr'],
              nameOfUserReversation: doc['nameOfUserReversation'],
              photoOfUser: doc['photoOfUser'],
              reservationUid: doc['reservationUid'],
            ))
        .toList();
  }

  @override
  Future<List<ReservationDetailsModel>> fetchNotaficationDetailsDoctor(
      String id) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('ReservationDetails')
        .where('userId', isEqualTo: id)
        .get();
    return snapshot.docs
        .map((doc) => ReservationDetailsModel(
              appointment: doc['appointment'],
              priese: doc["priese"],
              day: doc['day'],
              date: doc['date'],
              doctorUid: doc['doctorUid'],
              nameOfDocotr: doc['nameOfDocotr'],
              nameOfUserReversation: doc['nameOfUserReversation'],
              photoOfUser: doc['photoOfUser'],
              reservationUid: doc['reservationUid'],
            ))
        .toList();
  }

  Doctors? doctors;
  UserModel? userModel;
  @override
  Future<void> getInformmationDoctorDatabaseUsecaseDataSource(
      String uid) async {
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
    });
  }

  @override
  Future<void> getInformmationUserDatabaseUsecaseDataSource(String uid) async {
    FirebaseFirestore.instance
        .collection('doctors')
        .doc(uid)
        .get()
        .then((value) {
      doctors = Doctors.fromJson(value.data()!);
    });
  }
}

class StorageProviderRemoteDataSource {
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static Future<String> uploadFile({required File file}) async {
    final ref = _storage.ref().child(
        "Documents/${DateTime.now().millisecondsSinceEpoch}${getNameOnly(file.path)}");
    print("file ${file.path}");

    final uploadTask = ref.putFile(file);

    final imageUrl =
        (await uploadTask.whenComplete(() {})).ref.getDownloadURL();
    return await imageUrl;
  }

  static String getNameOnly(String path) {
    return path.split('/').last.split('%').last.split("?").first;
  }
}
