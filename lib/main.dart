import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lab_8/page_2.dart';

void main() {
  runApp(lab_8());
}

class lab_8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LocationWidget(),
    );
  }
}

class LocationWidget extends StatefulWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  var permission;
  Position? myPosition;
  void getMyLocation() async {
    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        try {
          permission = await Geolocator.requestPermission();
        } catch (e) {
          print("Permission denied by user");
        }
      }
    } catch (e) {
      print(e);
    }
    myPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    print(myPosition);
  }

  @override
  void initState() {
    super.initState();
    getMyLocation();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lab 8')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  getMyLocation();
                });
              },
              child: Text(" Get Location ", style: TextStyle(fontSize: 30)),
            ),
            Text(
              '$myPosition',
              style: const TextStyle(fontSize: 30),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page_2()));
                },
                child: Text(" Next Page ", style: TextStyle(fontSize: 20)))
          ],
        ),
      ),
    );
  }
}
