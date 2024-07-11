import 'package:flutter/material.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String serviceName;

  ServiceDetailScreen({required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          serviceName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF0A155A),
      ),
      body: Center(
        child: Text(
          serviceName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
        ),
      ),
    );
  }
}
