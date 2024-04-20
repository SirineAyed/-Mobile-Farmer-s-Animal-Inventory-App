import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Monitoring App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FarmMonitor(),
    );
  }
}

class FarmMonitor extends StatefulWidget {
  @override
  _FarmMonitorState createState() => _FarmMonitorState();
}

class _FarmMonitorState extends State<FarmMonitor> {
  bool weatherAlert = false;
  bool pestAlert = false;
  bool equipmentControl = false;

  void toggleWeatherAlert() {
    setState(() {
      weatherAlert = !weatherAlert;
    });
  }

  void togglePestAlert() {
    setState(() {
      pestAlert = !pestAlert;
    });
  }

  void toggleEquipmentControl() {
    setState(() {
      equipmentControl = !equipmentControl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farm Monitoring App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Weather Alerts:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Switch(
              value: weatherAlert,
              onChanged: (value) {
                toggleWeatherAlert();
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Pest Alerts:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Switch(
              value: pestAlert,
              onChanged: (value) {
                togglePestAlert();
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                toggleEquipmentControl();
              },
              child: Text('Remote Equipment Control'),
            ),
            if (equipmentControl)
              Column(
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Card(
                    child: ListTile(
                      title: Text('Drone Control'),
                      trailing: IconButton(
                        icon: Icon(Icons.power_settings_new),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Irrigation Control'),
                      trailing: IconButton(
                        icon: Icon(Icons.power_settings_new),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Harvest Control'),
                      trailing: IconButton(
                        icon: Icon(Icons.power_settings_new),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
