import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/widgets/custom_text_field.dart';


class Changepassword extends StatelessWidget {
  const Changepassword  ({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
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
                        fontSize: 35,
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
                        fontSize: 20,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          fixedSize: WidgetStatePropertyAll(
                              Size.fromWidth(double.maxFinite)),
                          shape: WidgetStatePropertyAll(LinearBorder.none),
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xff8458FF))),
                      onPressed: () {},
                      child: const Text(
                        'Create',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}
