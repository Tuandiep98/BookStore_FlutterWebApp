import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/bloc/setting_bloc/setting_bloc.dart';
import '../author_activity_element.dart';
import 'shimmer_element.dart';

class BookElementReverseShimmer extends StatelessWidget {
  const BookElementReverseShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: context.read<SettingBloc>().getTheme().primaryColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 180, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          Container(
                            width: 120,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 80,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.star_rounded,
                                  size: 15, color: Colors.grey),
                              Icon(Icons.star_rounded,
                                  size: 15, color: Colors.grey),
                              Icon(Icons.star_rounded,
                                  size: 15, color: Colors.grey),
                              Icon(Icons.star_rounded,
                                  size: 15, color: Colors.grey),
                              Icon(Icons.star_rounded,
                                  size: 15, color: Colors.grey),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: 120,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: 80,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: 120,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    const SizedBox(
                      width: 430,
                      height: 1,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    AuthorActivityElement(
                      authors: [0, 1, 2],
                      isShimmer: true,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: Material(
                elevation: 4.0,
                color: Colors.grey[300],
                type: MaterialType.transparency,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          color: context
                              .read<SettingBloc>()
                              .getTheme()
                              .primaryColorDark,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 15.0,
                        ),
                      ],
                    ),
                    height: 240,
                    width: 150,
                    child: ShimmerElement(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 15.0,
                          ),
                        ],
                      ),
                      height: 240,
                      width: 150,
                      child: Text(''),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
