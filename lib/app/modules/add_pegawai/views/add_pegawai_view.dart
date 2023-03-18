import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_pegawai_controller.dart';

class AddPegawaiView extends GetView<AddPegawaiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TAMBAH PEGAWAI'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField(autocorrect: false,
              controller: controller.nipC,
              decoration: const InputDecoration(
                labelText: 'NIP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            TextField(autocorrect: false,
              controller: controller.namaC,
              decoration: const InputDecoration(
                labelText: 'NAMA',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            TextField(autocorrect: false,
              controller: controller.emailC,
              decoration: const InputDecoration(
                labelText: 'EMAIL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                controller.addPegawai();
              },
              child: const Text('Tambah Pegawai'),
            ),
          ],
        ));
  }
}
