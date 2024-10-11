import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_text_field.dart';
import 'package:weather_forecasting_app/views/password_changed_view.dart';
import 'package:weather_forecasting_app/widgets/custom_button.dart';
import 'package:weather_forecasting_app/widgets/custom_text_field.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  
  String statusMessage = '';

  Future<void> resetPassword() async {
    if (newPasswordController.text.trim() != confirmPasswordController.text.trim()) {
      setState(() {
        statusMessage = 'Passwords do not match.';
      });
      return;
    }

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePassword(newPasswordController.text.trim());
        setState(() {
          statusMessage = 'Password updated successfully!';
        });
      } else {
        setState(() {
          statusMessage = 'No user is signed in.';
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        statusMessage = e.message ?? 'An error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D2837),
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), 
            color: Colors.white
          ),
          child: const BackButton(),
        ),
      ),
      body: Container(
        color: const Color(0xff1D2837),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Create new password',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Your password must be unique from\n those previously used.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
              const SizedBox(height: 50),
              TextFieldWidget(
                label: 'New password',
                controller: newPasswordController,
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                label: 'Confirm password',
                controller: confirmPasswordController,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Create',
                onTap: () async {
                  await resetPassword();

                  if (statusMessage == 'Password updated successfully!') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PasswordChangedView()),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                statusMessage,
                style: const TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}