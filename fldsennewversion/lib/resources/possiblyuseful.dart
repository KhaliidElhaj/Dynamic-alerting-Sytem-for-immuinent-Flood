/// a button that gets the location and moves camera with a button
// FloatingActionButton(
// backgroundColor: Colors.black,
// elevation: 1,
// onPressed: () {
// readonrequest();
// moveCamera();
// },
// child: const Icon(
// Icons.location_on,
// ),
// ),
///just a button that moves the camera. belongs in the site sel page
// Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// const SizedBox(
// height: 250,
// ),
// FloatingActionButton(
// backgroundColor: Colors.white,
// elevation: 1,
// onPressed: () {
// moveCamera();
// },
// child: const Icon(
// Icons.access_time,
// color:Colors.black ,
// ),
// ),
// ],
// ),
/// makes a snackbar pop up with the location name
// final snackbar1 = SnackBar(
//   backgroundColor: Colors.green,
//   content: Text(
//     'Your current location is ' + siteName,
//   ),
// );
// ScaffoldMessenger.of(context).showSnackBar(snackbar1);
///Locally and "network" stored images, using them for testing/design purposes
// 'https://images.unsplash.com/photo-1604315841269-a1f298321670?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80',
// 'https://images.unsplash.com/photo-1582624301042-7adc1f5c8332?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
// 'https://images.unsplash.com/photo-1599689018034-48e2ead82951?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=812&q=80',
//lib/resources/images/',
//'lib/resources/images/',
//'lib/resources/images/',
///code for placing a carousel in the siteSel page, with functions showing the sites on the carousel images
// CarouselSlider.builder(
// options: CarouselOptions(
// height: 400,
// enlargeCenterPage: true,
// enableInfiniteScroll: false,
// ),
// itemCount: placeHolders.length,
// itemBuilder: (context, int index, realIndex) {
// final placeImages = placeHolders[index];
// return buildImage(placeImages, index);
// },
// ),
// ),
// ),
// );
// }
//
// Widget buildImage(String placeImages, index) => Container(
//   margin: const EdgeInsets.symmetric(horizontal: 6),
//   color: Colors.transparent,
//   child: Stack(children: [
//     InkWell(
//       onTap: () {
//         readonrequestgardencity();
//         //readonrequesthell();
//         debugPrint('Site Chosen');
//         final snackbar1 = SnackBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           content: Text(
//             'Your current location is ' + gardenCitySiteName,
//           ),
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackbar1);
//       },
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(14),
//         child: SizedBox(
//           height: double.infinity,
//           child: Image.asset(
//             placeImages,
//             fit: BoxFit.cover,
//             width: double.infinity,
//           ),
//         ),
//       ),
//     ),
//     Column(
//       children: [
//         Container(
//           alignment: Alignment.center,
//           child: Text(
//             ' $gardenCitySiteName',
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         Container(
//           alignment: Alignment.center,
//           child: Text(
//             '  $gardenCitySiteStat',
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     )
//   ]),
// );
//
// readonrequestgardencity() {
//   // gets the value of "Location" and its child "garden city"/"hell" from the DB and changes it to a string in case of any data typing issues
//
//   dbref.child('location').child('garden city').get().then((DataSnapshot dataSnapshot) {
//     debugPrint('DATA : ' + dataSnapshot.value.toString());
//     setState(() {
//       gardenCityDatabaseVals = dataSnapshot.value.toString();
//     });
//   });
//
//   //below will the the set the site/location name and print it in the console
//
//   dbref.child('location').child('garden city').child('name').onValue.listen((event) {
//     debugPrint('LOCATION : ' + event.snapshot.value.toString());
//     setState(() {
//       gardenCitySiteName = event.snapshot.value.toString();
//     });
//   });
//
//   //below will the the latitude and print it in the console
//
//   dbref.child('location').child('garden city').child('lat').onValue.listen((event) {
//     setState(() {
//       lat = event.snapshot.value;
//     });
//     debugPrint('LAT : ' + event.snapshot.value.toString());
//   });
//
//   //below will the the longitude and print it in the console
//
//   dbref.child('location').child('garden city').child('long').onValue.listen((event) {
//     setState(() {
//       long = event.snapshot.value;
//     });
//     debugPrint('LONG : ' + event.snapshot.value.toString());
//   });
//
//   //gets the status of the site
//
//   dbref.child('location').child('garden city').child('status').onValue.listen((event) {
//     setState(() {
//       gardenCitySiteStat = event.snapshot.value;
//     });
//     debugPrint('STATUS : ' + event.snapshot.value.toString());
//   });
// }
//
// void readonrequesthell() {
//   // gets the value of "Location" and its child "hell" from the DB and changes it to a string in case of any data typing issues
//
//   dbref.child('location').child('hell').get().then((DataSnapshot dataSnapshot) {
//     debugPrint('DATA : ' + dataSnapshot.value.toString());
//     setState(() {
//       helldatabaseVals = dataSnapshot.value.toString();
//     });
//   });
//
//   //below will the the set the site/location name and print it in the console
//
//   dbref.child('location').child('hell').child('name').onValue.listen((event) {
//     debugPrint('LOCATION : ' + event.snapshot.value.toString());
//     setState(() {
//       hellSiteName = event.snapshot.value.toString();
//     });
//   });
//
//   //below will the the latitude and print it in the console
//
//   dbref.child('location').child('hell').child('lat').onValue.listen((event) {
//     setState(() {
//       lat = event.snapshot.value;
//     });
//     debugPrint('LAT : ' + event.snapshot.value.toString());
//   });
//
//   //below will the the longitude and print it in the console
//
//   dbref.child('location').child('hell').child('long').onValue.listen((event) {
//     setState(() {
//       long = event.snapshot.value;
//     });
//     debugPrint('LONG : ' + event.snapshot.value.toString());
//   });
//
//   //gets the status of the site
//
//   dbref.child('location').child('hell').child('status').onValue.listen((event) {
//     setState(() {
//       hellSiteStat = event.snapshot.value;
//     });
//     debugPrint('STATUS : ' + event.snapshot.value.toString());
//   });
// }
///for the hell location
// String helldatabaseVals = '';
// dynamic hellSiteName = '';
// dynamic hellSiteStat = '';
// dynamic hellSiteWL = '';
// dynamic hellSiteWV = '';
///read function for Site_selection page
// void readonrequest2(String finalSite) {
//   // gets the value of "Location" and its child "garden city"/"hell" from the DB and changes it to a string in case of any data typing issues
//
//   dbref.child('location').child(finalSite).get().then((DataSnapshot dataSnapshot) {
//     debugPrint('DATA : ' + dataSnapshot.value.toString());
//     setState(() {
//       databaseVals = dataSnapshot.value.toString();
//     });
//   });
//
//   //below will the the set the site/location name and print it in the console
//
//   dbref.child('location').child(finalSite).child('name').onValue.listen((event) {
//     debugPrint('LOCATION : ' + event.snapshot.value.toString());
//     setState(() {
//       siteName = event.snapshot.value.toString();
//     });
//   });
//
//   //below will the the latitude and print it in the console
//
//   dbref.child('location').child(finalSite).child('lat').onValue.listen((event) {
//     setState(() {
//       lat = event.snapshot.value;
//     });
//     debugPrint('LAT : ' + event.snapshot.value.toString());
//   });
//
//   //below will the the longitude and print it in the console
//
//   dbref.child('location').child(finalSite).child('long').onValue.listen((event) {
//     setState(() {
//       long = event.snapshot.value;
//     });
//     debugPrint('LONG : ' + event.snapshot.value.toString());
//   });
//
//   //gets the status of the site
//
//   dbref.child('location').child(finalSite).child('status').onValue.listen((event) {
//     setState(() {
//       siteStat = event.snapshot.value.toString();
//     });
//     debugPrint('STATUS : ' + event.snapshot.value.toString());
//   });
//
//   //gets the waterLevel of the site
//
//   dbref.child('location').child(finalSite).child('waterLevel').onValue.listen((event) {
//     setState(() {
//       waterLevel = event.snapshot.value;
//     });
//     debugPrint('WATER LEVEL : ' + event.snapshot.value.toString());
//   });
//
//   //gets the waterVelocity of the site
//
//   dbref.child('location').child(finalSite).child('waterVelocity').onValue.listen((event) {
//     setState(() {
//       waterVelocity = event.snapshot.value;
//     });
//     debugPrint('WATER VELOCITY : ' + event.snapshot.value.toString());
//   });
//   navigationState.setPage(0);
//   return debugPrint('Got Data Successfully.');
//
// }
///box Shadows for the three orb-like ui in the home page
//boxShadow: const [
//                               BoxShadow(
//                                 color: Colors.black,
//                                 spreadRadius: 0.01,
//                                 blurRadius: 1,
//                                 offset:
//                                     Offset(0, 3), // changes position of shadow
//                               ),
//                             ],
///titles data for graph
//topTitles: SideTitles(
//                           showTitles: false,
//                         ),
//                         rightTitles: SideTitles(
//                           showTitles: false,
//                         ),
//                         leftTitles: SideTitles(
//                           textAlign: TextAlign.left,
//                           showTitles: true,
//                           margin: 1,
//                         ),
//                         bottomTitles: SideTitles(
//                           textAlign: TextAlign.left,
//                           showTitles: true,
//                           margin: 1,
//                         ),
///Draws the horizontal and vertical line on the graph
// getDrawingVerticalLine: (value) {
                            //   return FlLine(
                            //     color: Colors.white,
                            //     strokeWidth: 1,
                            //   );
                            // },
                            // getDrawingHorizontalLine: (value) {
                            //   return FlLine(
                            //     color: Colors.g,
                            //     strokeWidth: 1,
                            //   );
                            // },
///Line graph page's title has a circular timer on it
//Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Line Graph',
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: 45,
//               width: 45,
//               child: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   CircularProgressIndicator(
//                     value: secondsGraph / maxSecondsGraph,
//                     strokeWidth: 2,
//                     valueColor: const AlwaysStoppedAnimation(Colors.white),
//                     backgroundColor: Colors.greenAccent,
//                   ),
//                   Center(child: Text('$secondsGraph'))
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
///if adding another page where all the sites can be scrolled through this widget is the one to use
// GoogleMap buildGoogleMap2() {
//   return GoogleMap(
//     mapType: MapType.hybrid,
//     initialCameraPosition: campos2,
//     onMapCreated: (GoogleMapController controller) {
//       _controller.complete(controller);
//     },
//     zoomControlsEnabled: false,
//     minMaxZoomPreference: const MinMaxZoomPreference(15, 15),
//     onCameraMove: null,
//     circles:
//     circles, //draws circles on certain coords, located in google_maps_circles_&_markers.dart
//   );
// }
///site_selection build method
//  Container buildSiteSelContainer(mainSiteName,mainSiteStat,mainImage) {
//     return Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           width: 1,
//                           color: Colors.white10.withOpacity(1),
//                         ),
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Stack(children: [
//                         ClipRRect(
//                             borderRadius: BorderRadius.circular(11),
//                             child: SizedBox(
//                                 height: 400,
//                                 width: 300,
//                                 child: Image.asset(
//                                   mainImage,
//                                   fit: BoxFit.fill,
//                                 ))),
//                         Positioned.fill(
//                           child: Material(
//                             borderRadius: BorderRadius.circular(11),
//                             color: Colors.black.withOpacity(0.5),
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(12),
//                               onTap: () {
//                                 dataGetterAndSetter(mainSiteName);
//                                 debugPrint('Site Set');
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       mainSiteName,
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     Text(
//                                       mainSiteStat,
//                                       style:  const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ]));
//   }
///row with build methods of site_selection page
//Row(
//                   children: [
//                     const SizedBox(
//                       width: 5,
//                     ),
//
//                     ///for the first site, a button, will have an image and title of its respective location
//                     buildSiteSelContainer(firstSiteName,firstSiteStatus,'lib/resources/images/'),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     ///for the Second site, a button, will have an image and title of its respective location
//                     buildSiteSelContainer(secondSiteName, secondSiteStatus, 'lib/resources/images/'),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     ///for the Third site, a button, will have an image and title of its respective location
//                     buildSiteSelContainer(thirdSiteName, thirdSiteStatus, 'lib/resources/images/'),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                   ],
//                 ),