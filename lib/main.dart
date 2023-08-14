// @dart=2.9
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footwear/app/app_screen.dart';
import 'package:footwear/helper/objectbox.dart';
import 'package:footwear/state/objectbox_state.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for tests',
        defaultColor: HexColor("#FFB301"),
        importance: NotificationImportance.Max,
        ledColor: Colors.white,
        channelShowBadge: true,
        enableVibration: true,
      ),
    ],
  );
  ObjectBoxState.objectBoxInstance = await ObjectBoxInstance.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: HexColor("#FFB301"),
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const MyApp()));
}
