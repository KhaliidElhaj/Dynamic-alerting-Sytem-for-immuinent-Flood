import 'dart:async';
// import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'package:fldsenv1/resources/build_methods.dart';
import 'package:fldsenv1/resources/google_maps.dart';
import 'package:fldsenv1/resources/notification_file.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//for the button that says 'live tracking' to disappear
bool isVisible = true;
bool isVisible2 = false;

//for firebaseRT
late DatabaseReference dbref;

//for the all locations
String databaseVals = '';
String siteName = '';
String siteStat = 'Null';
var waterLevel = 0.0;
var waterVelocity = 0.0;

//for background colors to change to depending on status

dynamic bgColor = defaultBgColor;

final defaultBgColor = [
  ///both black colors
  // Color(0xFF000000),
  // Color(0xFF000001),
  Colors.indigo,
  Colors.teal
];

final lowLevelBgColor = [
  Colors.green,
  Colors.lightGreen,
];

final highLevelBgColor = [
  Colors.red.shade900,
  Colors.deepOrange,
];

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //for the timer
  static const maxSeconds = 10;
  int seconds = maxSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    dbref = FirebaseDatabase.instance.ref();
  }

  bool switchVal = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'POSIDEN',
              style: TextStyle(
                letterSpacing: 5,
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            ///failed attempt at making a notification
            // ElevatedButton(
            //   onPressed: () => notif() ,
            //   child: const Text('Hello'),),
            SizedBox(
              height: 50,
              width: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: seconds / maxSeconds,
                    strokeWidth: 3,
                    valueColor: const AlwaysStoppedAnimation(Colors.white),
                    backgroundColor: Colors.greenAccent,
                  ),
                  Center(child: Text('$seconds'))
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: AnimatedContainer(
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.dstATop),
                repeat: ImageRepeat.repeat,
                image: const AssetImage('lib/resources/images/tetrapods.png')),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: bgColor,
            ),
          ),
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: SizedBox(
                      height: 310,
                      child: buildGoogleMap(),
                    ),
                  ),
                  Text(
                    siteName,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.white,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ///Container for the water's level
                          buildStatCont(
                              AppLocalizations.of(context)!.water_level,
                              "$waterLevel" +
                                  AppLocalizations.of(context)!.mSingPlur),

                          ///Container for the water's Velocity
                          buildStatCont(
                              AppLocalizations.of(context)!.water_velocity,
                              '$waterVelocity' +
                                  AppLocalizations.of(context)!.mPerS),

                          ///Container for the Site's Status
                          buildStatCont(
                              AppLocalizations.of(context)!.site_status,
                              siteStat),
                        ]),
                  ),
                  const Divider(
                    height: 15,
                    color: Colors.white,
                  ),
                  //gets the location and moves camera with a button also hides itself
                  Visibility(
                    visible: isVisible,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 5,
                        fixedSize: const Size(100, 50),
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isVisible = false;
                          isVisible2 = true;
                        });
                        notif('Notification Placeholder',
                            "i don't know what to write here");
                        readonrequest();
                        startTimer();
                        moveCameraWithDelay();
                      },
                      child: Text(
                        AppLocalizations.of(context)!.liveTracking,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                  //Stops the tracking timer and makes itself visible using the old button
                  Visibility(
                    visible: isVisible2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 5,
                        fixedSize: const Size(100, 50),
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          stopTimer();
                          isVisible = true;
                          isVisible2 = false;
                        });
                        // notif('Notification bitch',
                        //     "i don't know what to write here");
                        // readonrequest();
                        // startTimer();
                        // moveCameraWithDelay();
                      },
                      child: const Text(
                        'Stop Tracking',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  //pulls data from Firebase and stores it in multiple areas USED ONLY ONCE
  readonrequest() {
    // gets the value of "Location" and its child "garden city"/"Museum"/(Whatever) from the DB and changes it to a string in case of any data typing issues

    dbref
        .child('location')
        .child(siteName)
        .get()
        .then((DataSnapshot dataSnapshot) {
      debugPrint('DATA : ' + dataSnapshot.value.toString());
      setState(() {
        databaseVals = dataSnapshot.value.toString();
      });
    });

    //below will the the set the site/location name and print it in the console

    dbref
        .child('location')
        .child(siteName)
        .child('name')
        .onValue
        .listen((event) {
      debugPrint('LOCATION : ' + event.snapshot.value.toString());
      setState(() {
        siteName = event.snapshot.value.toString();
      });
    });

    //below will the the latitude and print it in the console

    dbref
        .child('location')
        .child(siteName)
        .child('lat')
        .onValue
        .listen((event) {
      setState(() {
        lat = event.snapshot.value;
      });
      debugPrint('LAT : ' + event.snapshot.value.toString());
    });

    //below will the the longitude and print it in the console

    dbref
        .child('location')
        .child(siteName)
        .child('long')
        .onValue
        .listen((event) {
      setState(() {
        long = event.snapshot.value;
      });
      debugPrint('LONG : ' + event.snapshot.value.toString());
    });

    //gets the status of the site

    dbref
        .child('location')
        .child(siteName)
        .child('status')
        .onValue
        .listen((event) {
      setState(() {
        siteStat = event.snapshot.value.toString();
      });
      debugPrint('STATUS : ' + event.snapshot.value.toString());
    });

    //gets the waterLevel of the site

    dbref
        .child('location')
        .child(siteName)
        .child('waterLevel')
        .onValue
        .listen((event) {
      setState(() {
        waterLevel = event.snapshot.value as double;
      });
      debugPrint('WATER LEVEL : ' + event.snapshot.value.toString());
    });

    //gets the waterVelocity of the site

    dbref
        .child('location')
        .child(siteName)
        .child('waterVelocity')
        .onValue
        .listen((event) {
      setState(() {
        waterVelocity = event.snapshot.value as double;
      });
      debugPrint('WATER VELOCITY : ' + event.snapshot.value.toString());
    });

    Future.delayed(const Duration(milliseconds: 250), () {
      if (waterLevel < 25) {
        debugPrint('---------Water Level Normal---------');
        setState(() {
          bgColor = lowLevelBgColor;
        });
      } else {
        debugPrint('---------Flooding!---------');
        setState(() {
          bgColor = highLevelBgColor;
        });
      }
    });

    final snackbar1 = SnackBar(
      padding: const EdgeInsets.all(20),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Text(
        siteName + ' Is Still ' + siteStat,
      ),
    );
    Future.delayed(const Duration(milliseconds: 500), () {
      ScaffoldMessenger.of(context).showSnackBar(snackbar1);
    });
  }

  //A function that gets certain data depending on the Site Chosen REPEATABLE USE
  dataGaS() {
    Future.delayed(const Duration(milliseconds: 250), () {
      if (waterLevel < 25) {
        debugPrint('---------Water Level Normal---------');
        debugPrint(databaseVals);
        setState(() {
          bgColor = lowLevelBgColor;
          notif('CLEAR FOR NOW | Site Is $siteStat',
              'Current Location: $siteName');
        });
      } else {
        debugPrint('---------Flooding!---------');
        debugPrint(databaseVals);
        setState(() {
          bgColor = highLevelBgColor;
          notif('EVACUATE NOW | Site Is $siteStat',
              'Current Location: $siteName');
        });
      }
    });
  }

  //the next two functions loop each other for the timer to work every ten seconds.
  void restartTimer() {
    seconds = maxSeconds;
    _timer!.cancel();
    startTimer();
    debugPrint('RESTARTED');
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          debugPrint(seconds.toString());
          seconds--;
        } else {
          restartTimer();
          dataGaS();
          debugPrint(seconds.toString());
        }
      });
    });
  }

  void stopTimer() {
    setState(() {
      _timer!.cancel();
      bgColor = defaultBgColor;
    });
    dataGaS();
  }
}
