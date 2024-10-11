import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/loginAndregister/_widgets/build_text_field.dart';
import 'package:weather_forecasting_app/views/password_changed_view.dart';
import 'package:weather_forecasting_app/widgets/custom_button.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    bool isCurrentPasswordVisible = false;
bool isNewPasswordVisible = false;
bool isConfirmPasswordVisible = false;
    final TextEditingController currentPasswordController =
        TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    String statusMessage = '';

    Future<void> changePassword() async {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        setState(() {
          statusMessage = 'No user is currently logged in.';
        });
        return;
      }

      try {
        // Reauthenticate the user
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: currentPasswordController.text.trim(),
        );

        await user.reauthenticateWithCredential(credential);

        // Change password
        await user.updatePassword(newPasswordController.text.trim());
        setState(() {
          statusMessage = 'Password changed successfully!';
        });
      } on FirebaseAuthException catch (e) {
        setState(() {
          statusMessage = e.message ?? 'An error occurred';
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D2837),
        leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: const BackButton()),
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
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Your password must be unique from\n those previously used.',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              buildTextField(
                controller: currentPasswordController,
                hintText: 'Current password',
                isPassword: true,
                screenHeight: screenHeight,
                isPasswordVisible: isCurrentPasswordVisible,
                onTogglePasswordVisibility: () {
                  setState(() {
                    isCurrentPasswordVisible= !isCurrentPasswordVisible; // Toggle visibility
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              buildTextField(
                controller: newPasswordController,
                hintText: 'New password',
                isPassword: true,
                screenHeight: screenHeight,
                isPasswordVisible: isNewPasswordVisible,
                onTogglePasswordVisibility: () {
                  setState(() {
                    isNewPasswordVisible = !isNewPasswordVisible; // Toggle visibility
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              buildTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm password',
                isPassword: true,
                screenHeight: screenHeight,
                isPasswordVisible: isConfirmPasswordVisible,
                onTogglePasswordVisibility: () {
                  setState(() {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible; // Toggle visibility
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Create',
                  onTap: () async {
  if (newPasswordController.text.trim() != confirmPasswordController.text.trim()) {
    setState(() {
      statusMessage = 'New password and confirmation do not match.';
    });
    return;
  }
  
  await changePassword(); 

  if (statusMessage == 'Password changed successfully!') {
    Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const PasswordChangedView()),
    );
  }
},),
              if (statusMessage.isNotEmpty)
                Text(
                  statusMessage,
                  style: const TextStyle(color: Colors.redAccent),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
