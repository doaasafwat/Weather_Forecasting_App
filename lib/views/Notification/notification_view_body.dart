import 'package:flutter/material.dart';
import 'package:weather_forecasting_app/widgets/notification_date_widget.dart';
import 'package:weather_forecasting_app/widgets/notification_message_widget.dart';

class NotificationViewBody extends StatelessWidget {
  NotificationViewBody({super.key}); // إزالة const هنا

  final List<Map<String, String>> notifications = [
    {
      'title': 'Daily Weather Summary',
      'sub': 'Clear skies with a high of 26°C. Perfect day to enjoy the outdoors!',
      'image': 'assets/images/cloud.jpg',
    },
    {
      'title': 'Severe Weather Alert',
      'sub': 'Heavy rain and strong winds expected this evening. Stay indoors and stay safe!',
      'image': 'assets/images/cloud.jpg',
    },
    {
      'title': 'Rain Notification',
      'sub': 'Rain in 20 minutes. Grab your umbrella before heading out!',
      'image': 'assets/images/cloud.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const CustomeNotificationsDate(
            date: 'Today',
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final title = notifications[index]['title']!;
                final sub = notifications[index]['sub']!;
                final image = notifications[index]['image']!;
                return Column(
                  children: [
                    NotificationMessageWidget(
                      messTitle: title,
                      messSubTitle: sub,
                      imagePath: image,
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const CustomeNotificationsDate(
            date: 'Yesterday',
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final title = notifications[index]['title']!;
                final sub = notifications[index]['sub']!;
                final image = notifications[index]['image']!;
                return Column(
                  children: [
                    NotificationMessageWidget(
                      messTitle: title,
                      messSubTitle: sub,
                      imagePath: image,
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

