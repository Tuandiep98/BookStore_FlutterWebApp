import 'package:book_store/Utils/platform_utils.dart';
import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: PlatformUtils.isDevice() ? 130 : 50,
      padding: EdgeInsets.only(top: PlatformUtils.isDevice() ? 20 : 0),
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      color: Colors.white.withOpacity(0.9),
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
        CircleAvatar(
          radius: 20,
          child: Image.asset(
            'assets/images/girl_emoji_01.png',
            height: 40,
            width: 40,
          ),
        ),
        const SizedBox(width: 20),
        InkWell(
          onTap: () {
            PanaraInfoDialog.show(
              context,
              title: "Hello",
              message: "This is the PanaraInfoDialog",
              buttonText: "Okay",
              onTapDismiss: () {
                Navigator.pop(context);
              },
              panaraDialogType: PanaraDialogType.success,
              barrierDismissible: false, // optional parameter (default is true)
            );
          },
          child: const Icon(
            Icons.settings,
            size: 24,
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
