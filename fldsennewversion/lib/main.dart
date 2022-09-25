import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fldsenv1/pages/graphs_info.dart';
import 'package:fldsenv1/pages/about_info.dart';
import 'package:fldsenv1/resources/localization_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/homepage.dart';
import 'pages/site_selection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: unused_local_variable
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  dbref = FirebaseDatabase.instance.ref();

  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Oswald'),
    debugShowCheckedModeBanner: false,
    supportedLocales: L10n.all,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    home: const SplashScreen(),
  ));
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'assets/Posiden.gif',
      ),
      backgroundColor: Colors.white,
      nextScreen: const Mainpage(),
      splashIconSize: 1200,
    );
  }
}

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

final navigationKey = GlobalKey<CurvedNavigationBarState>();
final navigationState = navigationKey.currentState!;

class _MainpageState extends State<Mainpage> {
  // screens is a list that houses all the pages and using the index variable we can navigate through them
  final screens = [
    const HomePage(),
    const SiteSel(),
    const GraphsInfo(),
    const AboutInfo(),
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.home_sharp,
        size: 30,
      ),
      const Icon(Icons.location_on_sharp, size: 30),
      const Icon(Icons.timeline_outlined, size: 30),
      const Icon(Icons.info_sharp, size: 30),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.white.withOpacity(0.5),
        key: navigationKey,
        index: index,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        color: Colors.white.withOpacity(0.5),
        backgroundColor: Colors.transparent,
        items: items,
        height: 50,
        onTap: (index) => setState(() => this.index = index),
      ),

      body: IndexedStack(
        index: index,
        children: screens,
      ), //will use the screens list in conjunction with the index list to show pages
    );
  }
}
