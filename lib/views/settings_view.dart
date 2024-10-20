import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecasting_app/views/create_new_password.dart';
import 'package:weather_forecasting_app/widgets/custom_list_tile.dart';
import 'package:weather_forecasting_app/widgets/temperature_unit_provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool cellurData = true;
  bool resetIdentifier = false;

  @override
  Widget build(BuildContext context) {
    var temperatureNotifier = Provider.of<TemperatureUnitNotifier>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF1D2837),
      appBar: AppBar(
        centerTitle: true,
        leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: const BackButton()),
        backgroundColor: const Color(0xFF1D2837),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Container(
        color: const Color(0xFF1D2837),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView(
            children: [
              const CustomListTileWidget(
                iconBackgroundColor: Color.fromARGB(255, 29, 67, 220),
                icon: Icons.location_on,
                title: 'Location',
                trailingTitle: 'Always',
              ),
              SwitchListTile(
                value: cellurData,
                onChanged: (val) {
                  setState(() {
                    cellurData = val;
                  });
                },
                tileColor: const Color(0xFF1D2837),
                title: const Text(
                  'Cellular Data',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const CustomListTileWidget(
                  icon: Icons.notifications,
                  iconBackgroundColor: Colors.red,
                  title: 'Notifications',
                  trailingTitle: ''),
              const CustomListTileWidget(
                  icon: Icons.language,
                  iconBackgroundColor: Color.fromARGB(255, 23, 97, 110),
                  title: 'Language',
                  trailingTitle: 'EN'),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CreateNewPassword();
                  }));
                },
                child: const CustomListTileWidget(
                    icon: Icons.password,
                    iconBackgroundColor: Colors.blue,
                    title: 'Change Password',
                    trailingTitle: ''),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 20),
                    child: Text(
                      'Temperature Unit',
                      style:
                          TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                    ),
                  ),
                  CheckboxListTile(
                    title: const Text(
                      'Celsius',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: temperatureNotifier.isCelsius,
                    onChanged: (newValue) {
                      temperatureNotifier.toggleTemperatureUnit();
                    },
                  ),
                  CheckboxListTile(
                    title: const Text(
                      'Fahrenheit',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: !temperatureNotifier.isCelsius,
                    onChanged: (newValue) {
                      temperatureNotifier.toggleTemperatureUnit();
                    },
                  )
                ],
              ),
              SwitchListTile(
                value: resetIdentifier,
                onChanged: (bool value) {
                  setState(() {
                    resetIdentifier = value;
                  });
                },
                tileColor: const Color(0xFF1D2837),
                title: const Text(
                  'Reset Identifier',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
