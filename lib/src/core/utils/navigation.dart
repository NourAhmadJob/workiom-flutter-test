import 'package:flutter/material.dart';

to(BuildContext context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

toAndFinish(BuildContext context, Widget widget) =>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget),(r) => false);
