import 'package:civil_manager/view_model/services/splash_services.dart';
import 'package:flutter/material.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashServices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          decoration:const BoxDecoration(
            image:  DecorationImage(
              image: AssetImage("assets/logo/logo.png"),
              fit: BoxFit.fitWidth,
            ),
          )
      ),
    );
  }
}
