import 'package:firebase_database/firebase_database.dart';
import 'package:fldsenv1/main.dart';
import 'package:fldsenv1/resources/google_maps.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SiteSel extends StatefulWidget {
  const SiteSel({Key? key}) : super(key: key);

  @override
  _SiteSelState createState() => _SiteSelState();
}

// ignore: todo
//TODO : Create images Corresponding to Each Site, the images will be a blend of the google maps Satellite location and a picture of the place itself.

class _SiteSelState extends State<SiteSel> {
  String ssFinal = '';

  @override
  void initState() {
    super.initState();
    namesOfSites();
  }

  String firstSiteName = '';
  String secondSiteName = '';
  String thirdSiteName = '';
  String firstSiteStatus = '';
  String secondSiteStatus = '';
  String thirdSiteStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context)!.chooseASite,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: AnimatedContainer(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
              repeat: ImageRepeat.repeat,
              image: const AssetImage('lib/resources/images/tetrapods.png')),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: bgColor),
        ),
        duration: const Duration(milliseconds: 500),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.pAs,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),

                    ///for the first site, a button, will have an image and title of its respective location
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white10.withOpacity(1),
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: SizedBox(
                                  height: 400,
                                  width: 300,
                                  child: Image.asset(
                                    'lib/resources/images/GardenCity.jpg',
                                    fit: BoxFit.fill,
                                  ))),
                          Positioned.fill(
                            child: Material(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.black.withOpacity(0.5),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  dataGetterAndSetter('garden city');
                                  debugPrint('Site Set');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        firstSiteName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        firstSiteStatus,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ])),
                    const SizedBox(
                      width: 5,
                    ),

                    ///for the Second site, a button, will have an image and title of its respective location
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white10.withOpacity(1),
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: SizedBox(
                                  height: 400,
                                  width: 300,
                                  child: Image.asset(
                                    'lib/resources/images/Museum.jpg',
                                    fit: BoxFit.fill,
                                  ))),
                          Positioned.fill(
                            child: Material(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.black.withOpacity(0.5),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  dataGetterAndSetter('National Museum');
                                  debugPrint('Site Set');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        secondSiteName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        secondSiteStatus,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ])),
                    const SizedBox(
                      width: 5,
                    ),

                    ///for the Third site, a button, will have an image and title of its respective location
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white10.withOpacity(1),
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: SizedBox(
                                  height: 400,
                                  width: 300,
                                  child: Image.asset(
                                    'lib/resources/images/LosAngeles.jpg',
                                    fit: BoxFit.fill,
                                  ))),
                          Positioned.fill(
                            child: Material(
                              borderRadius: BorderRadius.circular(11),
                              color: Colors.black.withOpacity(0.5),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  dataGetterAndSetter('Los Angeles');
                                  debugPrint('Site Set');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        thirdSiteName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        thirdSiteStatus,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ])),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  //cannot be move to the build_methods file because it depends on the "dataGetterAndSetter" function which is defined here.
  // Container buildSiteSelContainer(mainSiteName,mainSiteStat,mainImage) {
  //   return ;
  // }

  void dataGetterAndSetter(String ssFinal) {
    // gets the value of "Location" and its child "garden city"/"Museum"/(Whatever) from the DB and changes it to a string in case of any data typing issues

    dbref
        .child('location')
        .child(ssFinal)
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
        .child(ssFinal)
        .child('name')
        .onValue
        .listen((event) {
      debugPrint('LOCATION : ' + event.snapshot.value.toString());
      setState(() {
        siteName = ssFinal; //event.snapshot.value.toString();
      });
    });

    //below will the the latitude and print it in the console

    dbref.child('location').child(ssFinal).child('lat').onValue.listen((event) {
      setState(() {
        lat = event.snapshot.value;
      });
      debugPrint('LAT : ' + event.snapshot.value.toString());
    });

    //below will the the longitude and print it in the console

    dbref
        .child('location')
        .child(ssFinal)
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
        .child(ssFinal)
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
        .child(ssFinal)
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
        .child(ssFinal)
        .child('waterVelocity')
        .onValue
        .listen((event) {
      setState(() {
        waterVelocity = event.snapshot.value as double;
      });
      debugPrint('WATER VELOCITY : ' + event.snapshot.value.toString());
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (waterLevel < 25) {
        debugPrint('---------Okay---------');
        setState(() {
          bgColor = lowLevelBgColor;
        });
      } else {
        debugPrint('---------Not Okay---------');
        setState(() {
          bgColor = highLevelBgColor;
        });
      }
    });

    // final snackbar1 = SnackBar(
    //   padding: const EdgeInsets.all(20),
    //   elevation: 0,
    //   backgroundColor: Colors.transparent,
    //   content: Text(
    //     siteName + ' Is ' + siteStat,
    //   ),
    // );
    // ScaffoldMessenger.of(context).showSnackBar(snackbar1);
    navigationState.setPage(0);
  }

  void namesOfSites() {
    dbref
        .child('location')
        .child('garden city')
        .child('name')
        .onValue
        .listen((event) {
      setState(() {
        firstSiteName = event.snapshot.value.toString();
      });
    });
    dbref
        .child('location')
        .child('garden city')
        .child('status')
        .onValue
        .listen((event) {
      setState(() {
        firstSiteStatus = event.snapshot.value.toString();
      });
    });

    dbref
        .child('location')
        .child('National Museum')
        .child('name')
        .onValue
        .listen((event) {
      setState(() {
        secondSiteName = event.snapshot.value.toString();
      });
    });
    dbref
        .child('location')
        .child('National Museum')
        .child('status')
        .onValue
        .listen((event) {
      setState(() {
        secondSiteStatus = event.snapshot.value.toString();
      });
    });

    dbref
        .child('location')
        .child('Los Angeles')
        .child('name')
        .onValue
        .listen((event) {
      setState(() {
        thirdSiteName = event.snapshot.value.toString();
      });
    });
    dbref
        .child('location')
        .child('Los Angeles')
        .child('status')
        .onValue
        .listen((event) {
      setState(() {
        thirdSiteStatus = event.snapshot.value.toString();
      });
    });
  }
}
