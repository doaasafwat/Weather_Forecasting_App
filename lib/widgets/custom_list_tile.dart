import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget(
      {super.key,
      required this.icon,
      required this.iconBackgroundColor,
      required this.title,
      required this.trailingTitle});
  final IconData icon;
  final String title;
  final Color iconBackgroundColor;
  final String trailingTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: const Color(0xFF1D2837),
      leading: Container(
        decoration: BoxDecoration(
            color: iconBackgroundColor, borderRadius: BorderRadius.circular(5)),
        height: 35,
        width: 35,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            trailingTitle,
            style: const TextStyle(
                fontSize: 13, color: Color.fromARGB(255, 139, 139, 139)),
          ),
          const SizedBox(
            width: 8,
          ),
          const FaIcon(
            FontAwesomeIcons.greaterThan,
            size: 15,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}