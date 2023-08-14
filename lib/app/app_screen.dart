import 'package:flutter/material.dart';
import 'package:footwear/app/first_screen.dart';
import 'package:footwear/app/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      color: Colors.white,
      // home: const ShippingAddress(),
      initialRoute: FirstScreen.routes,
      routes: getAppRoutes,
    );
  }
}
