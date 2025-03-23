import 'package:flutter/material.dart';
import 'package:gahshomar/src/presentation/watch_face_active.dart';
import 'package:gahshomar/src/presentation/watch_face_inactive.dart';
import 'package:wear_plus/wear_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: WatchShape(
            builder: (context, shape, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Shape: ${shape == WearShape.round ? 'round' : 'square'}',
                  ),
                  child!,
                ],
              );
            },
            child: AmbientMode(
              builder: (context, mode, child) {
                 return WearMode.active == mode
                      ? WatchFaceActive()
                      : WatchFaceInactive();

              },
            ),
          ),
        ),
      ),
    );
  }
}