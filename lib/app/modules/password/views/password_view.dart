import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/password_controller.dart';

class PasswordView extends GetView<PasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Password'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextField(
            controller: controller.newPassC,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'New Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () {
              controller.newPassword();
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
