import 'package:automated_course_plan_generator/Screens/btmnav.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../components/background.dart';
import '../main.dart';
import 'Welcome/welcome_screen.dart';
import 'admin/adminscreen.dart';

class SplashScreen extends StatefulWidget {
  // ith statefull anne abstract classinna inheritt chayunnu
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //first working function
    checkLoggedIn(); //calling function checklogged ithh thazhaa kidappundd
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Center(child: Image.asset("assets/images/splashlogo.jpg")));
  }

  Future<void> goToWelcome() async {
    await Future.delayed(
        const Duration(seconds: 3)); // ee page 3 second delay channe
    await Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) =>
            const WelcomeScreen())); //welcome pagill lott pokanneee
  }

  Future<void> checkLoggedIn() async {
    final _sharedPrefs = await SharedPreferences
        .getInstance(); //shared preference inda instance edukannee
    final _loggedStatus = _sharedPrefs.getString(
        LOG_KEY); // nerathey eduthaa instance ill ninnu value edukkanne
    if (_loggedStatus == 'adminlog') {
      // ahh eduthaa value check chayukka ath admin log annenkill
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx1) => AdminScreen())); // adminscreenillot povukkaaa
    } else if (_loggedStatus == 'stafflog') {
      // ahh eduthaa value check chayukka ath stafflog  annenkill
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx1) => BtmNav())); // btmnav illot povukkaaa
    } else {
      // value vereey enthenkillum annenkill
      goToWelcome(); //gotowelcome anna functionill povukka mukallill ullath
    }
  }
}
