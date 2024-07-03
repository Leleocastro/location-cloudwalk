import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:location/features/maps/ui/pages/map_view_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MapViewPage(),
    );
  }
}
