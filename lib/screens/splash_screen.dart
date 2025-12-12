import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/auth');
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.car_repair, size: 96, color: Colors.orange),
            SizedBox(height: 16),
            Text('فاست بلاك تايجر لقطع الغيار', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
