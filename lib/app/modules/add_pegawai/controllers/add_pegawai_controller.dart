import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPegawaiController extends GetxController {
  TextEditingController nipC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  CollectionReference pegawai =
      FirebaseFirestore.instance.collection('pegawai');

  void addPegawai() async {
    if (nipC.text.isNotEmpty &&
        nipC.text.isNotEmpty &&
        emailC.text.isNotEmpty) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailC.text,
          password: '123456',
        );

        if (credential.user != null) {
          String uid = credential.user!.uid;

          await pegawai.doc(uid).set({
            'nip': nipC.text,
            'name': namaC.text,
            'email': emailC.text,
            'uid': uid,
            'createAt': DateTime.now().toIso8601String(),
          });
        }
        print(credential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar('Terjadi Kesalahan', 'Password terlalu singkat');
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar('Terjadi Kesalahan', 'Email sudah tersedia');
        }
      } catch (e) {
        Get.snackbar('Terjadi Kesalahan', 'Tidak dapat menambahkan pegawai');
      }
    } else {
      Get.snackbar('Terjadi Kesalahan', 'NIP, Nama, Email harus di isi');
    }
  }
}
