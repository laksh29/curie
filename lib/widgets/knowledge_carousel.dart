import 'package:curie/common/utils/extensions.dart';
import 'package:curie/widgets/common_widgets/custom_container.dart';
import 'package:flutter/material.dart';

class CurieKnowledgeCarousel extends StatelessWidget {
  const CurieKnowledgeCarousel({
    super.key,
    required this.height,
    required this.carousel,
    required this.width,
  });

  final double height;
  final List carousel;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.25,
      child: ListView.separated(
        itemCount: carousel.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return SizedBox(
            height: height * 0.25,
            width: width * 0.4,
            child: CustomContainer(
              margin: const EdgeInsets.only(bottom: 5.0, right: 5.0),
              bgImage: carousel.elementAt(index),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return 10.whitespaceWidth;
        },
      ),
    );
  }
}
