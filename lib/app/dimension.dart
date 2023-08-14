// Set Dimension for the different devices like Phone and Table
// mobileDimension and tableDimension is assigned with the help of bootstrap screen resolution documentation

import 'package:flutter/cupertino.dart';

const mobileDimension = 768;
const tableDimension = 992;
const wearDimension = 300;

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
