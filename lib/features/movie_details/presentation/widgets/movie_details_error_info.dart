import 'package:flutter/material.dart';

class MovieDetailsErrorInfo extends StatelessWidget {
  const MovieDetailsErrorInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error,
                size: 50,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'An error occurred while downloading data. Please check your connection and try again.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
