import 'package:curie/common/utils/extensions.dart';
import 'package:curie/widgets/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BNBTile extends StatelessWidget {
  const BNBTile({
    super.key,
    required this.index,
    required this.name,
    required this.image,
  });
  final int index;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox.square(
          dimension: 40.0,
          child: CustomButton(
            radius: 5.0,
            bgImage: image,
          ),
        ),
        3.whitespaceHeight,
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
