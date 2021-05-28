import 'package:adherence_admin/src/features/home/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';

import 'src/utils/res/res.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.APP_NAME,
      theme: THEME_DATA,
      home: HomePage(),
    );
  }
}
