import 'package:find_seat/app_config.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void main() {
  MyApp.initSystemDefault();

  runApp(
    AppConfig(
      appName: "EAP Films",
      flavorName: "prod",
      initialRoute: Router.SPLASH,
      child: MyApp(),
    ),
  );
}
