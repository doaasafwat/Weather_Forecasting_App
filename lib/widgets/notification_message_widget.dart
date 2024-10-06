import 'package:flutter/material.dart';

class NotificationMessageWidget extends StatelessWidget {
  const NotificationMessageWidget({super.key, required this.messTitle, required this.messSubTitle, required this.imagePath});
  final String messTitle;
  final String messSubTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 36,
          width: 36,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messTitle,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                messSubTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffFFFFFF).withOpacity(.75),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
