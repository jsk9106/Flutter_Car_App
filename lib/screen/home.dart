import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_car_app/components/custom_sliver_app_bar.dart';
import 'package:flutter_car_app/components/header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: Divider(color: Colors.white70, height: 0.7),
          ),
          Header(),
        ],
      ),
    );
  }
}


