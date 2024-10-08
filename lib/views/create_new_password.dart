import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/views/password_changed_view.dart';
import 'package:weather_forecasting_app/widgets/custom_button.dart';
import 'package:weather_forecasting_app/widgets/custom_text_field.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const TextFieldWidget(
                label: 'Current password',
              ),
              const SizedBox(
                height: 20,
              ),
              const TextFieldWidget(
                label: 'New password',
              ),
              const SizedBox(
                height: 20,
              ),
              const TextFieldWidget(
                label: 'Confirm password',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Create',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PasswordChangedView()),
                  );
                },
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
