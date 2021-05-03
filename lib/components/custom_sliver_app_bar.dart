import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      title: Text('KN'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
      centerTitle: true,
    );
  }
}