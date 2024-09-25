import 'package:curie/widgets/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ButtonsOnCard extends StatelessWidget {
  const ButtonsOnCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 1,
      left: 30.0,
      right: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            ctaText: "Add Money",
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ),
            color: Colors.limeAccent[400],
          ),
          const CustomButton(
            ctaText: "Scan & Pay",
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
