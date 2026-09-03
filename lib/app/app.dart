import 'package:flutter/material.dart';
import 'router.dart';

class StudyLockApp extends StatelessWidget {
  const StudyLockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Study Lock',
      theme: ThemeData(useMaterial3: true),
      routerConfig: router,
    );
  }
}
