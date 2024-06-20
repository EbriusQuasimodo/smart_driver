import 'package:flutter/material.dart';

class CourierMapScreen extends StatelessWidget {
  const CourierMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [SliverAppBar(title: Text('Курьеры'),)],
      ),
    );
  }
}
