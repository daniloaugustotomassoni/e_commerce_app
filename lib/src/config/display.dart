import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Display {
  static init() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
