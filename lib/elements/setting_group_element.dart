import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/bloc/setting_bloc/setting_bloc.dart';

class SettingGroupElement extends StatefulWidget {
  final List<Widget> children;
  const SettingGroupElement({super.key, required this.children});

  @override
  State<SettingGroupElement> createState() => _SettingGroupElementState();
}

class _SettingGroupElementState extends State<SettingGroupElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: context.read<SettingBloc>().isDarkMode()
            ? Theme.of(context).backgroundColor
            : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: widget.children,
      ),
    );
  }
}
