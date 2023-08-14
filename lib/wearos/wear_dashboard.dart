import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wear/wear.dart';

class WearDashboard extends StatefulWidget {
  const WearDashboard({super.key});
  // static const routes = "/wear_dashboard";
  @override
  State<WearDashboard> createState() => _WearDashboardState();
}

class _WearDashboardState extends State<WearDashboard> {
  @override
  Widget build(BuildContext context) {
    return WatchShape(builder: (context, shape, child) {
      return AmbientMode(builder: (context, mode, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                    child: Text(
                      "Welcome to Dashboard",
                      style: GoogleFonts.poppins(
                        color: HexColor("FFB301"),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(color: Colors.grey, width: 2),
                    ),
                    minLeadingWidth: 20,
                    leading: Icon(Icons.money_rounded,
                        color: HexColor("FFB301"), size: 20),
                    title: Text("Total Sales",
                        style: TextStyle(
                          color: HexColor("FFB301"),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )),
                    subtitle: const Text("Rs.60000"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(color: Colors.grey, width: 2),
                    ),
                    minLeadingWidth: 20,
                    leading: Icon(Icons.check_box,
                        color: HexColor("FFB301"), size: 20),
                    title: Text("Total Items",
                        style: TextStyle(
                          color: HexColor("FFB301"),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )),
                    subtitle: const Text("6000 Units"),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
