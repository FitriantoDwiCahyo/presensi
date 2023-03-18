import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  void login() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailC.text,
          password: passC.text,
        );

        print(credential);

        if (credential.user != null) {
          if (credential.user!.emailVerified) {
            Get.offAllNamed(Routes.HOME);
          } else {
            Get.defaultDialog(title: 'Belum Verifikasi');
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar('Terjadi Kesalahan', 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
              'Terjadi Kesalahan', 'Wrong password provided for that user.');
        }
      } catch (e) {
        Get.snackbar('Terjadi Kesalahan', 'Tidak bisa login');
      }
    } else {
      Get.snackbar('Terjadi Kesalahan', 'Email dan Password tidak bisa kosong');
    }
  }
}
