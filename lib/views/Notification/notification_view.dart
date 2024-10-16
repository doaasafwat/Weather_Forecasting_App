import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/views/Notification/notification_view_body.dart';


class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Notification',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff1D2837),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            width: 40,
            height: 40,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 24,
                color: Color(0xff8458FF),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 25,
              width: 57,
              decoration: const BoxDecoration(
                color: Color(0xff8458FF),
              ),
              child: const Center(
                child: Text(
                  '1 New',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      body: NotificationViewBody(),
    );
  }
}
