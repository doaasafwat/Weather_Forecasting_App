import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecasting_app/views/Notification/notification_view.dart';
import 'package:weather_forecasting_app/views/SettingsView.dart';

class HeaderSearchView extends StatelessWidget {
  const HeaderSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 18, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.person,
                size: 50,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: TextStyle(
                      color: Color(0xff9F7CFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  child: Text('Hi, WelcomeBack'),
                ),
                SizedBox(
                  height: 5,
                ),
                DefaultTextStyle(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  child: Text('John Doe'),
                ),
              ],
            ),
            const SizedBox(
              width: 60,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffCAD6FF),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationView(),
                    ),
                  );
                },
                icon: const Icon(FontAwesomeIcons.bell),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffCAD6FF),
              ),
              child: IconButton(
                alignment: Alignment.center,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Setting(),
                    ),
                  );
                },
                icon: const Icon(FontAwesomeIcons.gear),
              ),
            )
          ],
        ),
      ),
    );
  }
}
