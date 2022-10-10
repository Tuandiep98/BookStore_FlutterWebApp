import 'package:book_store/Utils/platform_utils.dart';
import 'package:book_store/core/bloc/setting_bloc/setting_bloc.dart';
import 'package:book_store/elements/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../elements/setting_element.dart';
import 'dialog_utils.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      color: Colors.grey.shade200,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        color: context
            .read<SettingBloc>()
            .getTheme()
            .backgroundColor
            .withOpacity(0.9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLogo(),
            const SizedBox(width: 10),
            // _buildCategories(),
            const Spacer(),
            _buildFunction(),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        const SizedBox(width: 10),
        Image.asset(
          'assets/images/thumb.jpg',
          width: 45,
          height: 45,
        ),
        const SizedBox(width: 5),
        const Text(
          'iLibrary',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.book_outlined, size: 24),
              SizedBox(height: 5),
              Text(
                'Books',
                style: TextStyle(
                    // fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.spatial_audio_rounded, size: 24),
            SizedBox(height: 5),
            Text(
              'Audiobooks',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.mic, size: 24),
            SizedBox(height: 5),
            Text(
              'Podcasts',
              style: TextStyle(
                  // fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildFunction() {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            await DialogUtils.showDialogWithChild(
              context,
              enableBlur: true,
              child: SettingElement(),
              padding: const EdgeInsets.all(12),
            );
          },
          child: CircleAvatar(
            radius: 20,
            child: Image.asset(
              'assets/images/girl_emoji_01.png',
              height: 40,
              width: 40,
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
