import 'package:flutter/material.dart';

class ListTileDrawerItem extends StatelessWidget {

  String data;
  Function()? onPress;

  ListTileDrawerItem({
    super.key,
    required this.data,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      title: Text(data),
    );
  }
}