import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomErrorBuilder extends StatelessWidget {
  const CustomErrorBuilder({super.key, required this.errorDetails});

  final FlutterErrorDetails errorDetails;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
                size: 80,
              ),
              Text(
                kReleaseMode
                    ? 'Oops... something went wrong'
                    : errorDetails.exception.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
