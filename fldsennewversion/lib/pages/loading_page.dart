///page errors out something about using the same global key when routing in the main.dart file... fuck this shit
// //import 'package:overlay_support/overlay_support.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
//
// class Loading extends StatefulWidget {
//   const Loading({Key? key}) : super(key: key);
//
//   @override
//   _LoadingState createState() => _LoadingState();
// }
// class _LoadingState extends State<Loading> {
//
//   bool internetConnection = false;
//
//   @override
//   void initState() {
//     loadingChecker();
//     super.initState();
//   }
//
//   static String internetString = '';
//
//   static const spinkit = SpinKitWave(
//     color: Colors.blue,
//     size: 50,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(11.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children:  [
//               spinkit,
//               const Text('Checking Internet Connection, please wait'),
//               Text(internetString,style: const TextStyle(
//                 color:Colors.black,
//               ),)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void loadingChecker () async {
//     internetConnection = await InternetConnectionChecker().hasConnection;
//    //final internetColor = internetConnection ? Colors.green : Colors.red;
//     //final internetText = internetConnection ? 'Internet Access Verified' : 'You have no internet access';
//     // showSimpleNotification(
//     //   Text(internetText,
//     //     style:const TextStyle(
//     //       color: Colors.white,
//     //       fontWeight: FontWeight.bold,
//     //     ),),
//     //   background: internetColor,
//     // );
//     if(internetConnection = true) {
//         internetString = 'You Have Internet Access';
//         Future.delayed(const Duration(milliseconds: 500),(){
//
//           Navigator.pushReplacementNamed(context, '/main');
//           debugPrint(internetConnection.toString());
//         });
//
//     }
//     else {
//         internetString = "You Have Don't Internet Access";
//         debugPrint(internetConnection.toString());
//     }
//   }
// }
