import 'package:book_store/core/bloc/setting_bloc/setting_bloc.dart';
import 'package:book_store/utils/platform_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewWidget extends StatelessWidget {
  final String authorName;
  final String review;
  final String imgUrl;
  final String datetime;
  const ReviewWidget({
    super.key,
    required this.authorName,
    required this.review,
    this.imgUrl = 'assets/images/girl_emoji_01.png',
    this.datetime = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          (PlatformUtils.isMobile(context) ? 0.9 : 0.5),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width *
            (PlatformUtils.isMobile(context) ? 0.9 : 0.5),
        maxHeight: 140,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                child: Image.asset(
                  imgUrl,
                  height: 40,
                  width: 40,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: MediaQuery.of(context).size.width *
                    (PlatformUtils.isMobile(context) ? 0.8 : 0.4),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          authorName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: context
                                .read<SettingBloc>()
                                .getTheme()
                                .colorScheme
                                .secondary,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              datetime,
                              style: TextStyle(
                                fontSize: 14,
                                color: context
                                    .read<SettingBloc>()
                                    .getTheme()
                                    .colorScheme
                                    .secondary,
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.star_rounded, size: 15, color: Colors.amber),
                        Icon(Icons.star_rounded, size: 15, color: Colors.amber),
                        Icon(Icons.star_rounded, size: 15, color: Colors.amber),
                        Icon(Icons.star_rounded, size: 15, color: Colors.amber),
                        Icon(Icons.star_rounded, size: 15, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width *
                (PlatformUtils.isMobile(context) ? 0.9 : 0.46),
            child: Text(
              review,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
