import 'package:flutter/cupertino.dart';

extension CustomExtensions on Widget{
  Padding paddingWithSymmetry({
    double vertical=0.0,
    double horizontal=0.0,
  })=> Padding(
    padding: EdgeInsets.symmetric(vertical: vertical,horizontal: horizontal),
    child: this,
  );

  Padding paddingWithOnly({
    double left=0.0,
    double bottom=0.0,
    double right=0.0,
    double top=0.0,
  })=> Padding(
    padding: EdgeInsets.only(bottom: bottom,left: left,top: top,right: right),
    child: this,
  );

  Padding paddingWithAll({
    double value=0.0,
  })=> Padding(
    padding: EdgeInsets.all(value),
    child: this,
  );

  Center wrapWithCenter() => Center(child: this,);

  Expanded expanded(int flex) => Expanded(flex: flex,child: this);
}