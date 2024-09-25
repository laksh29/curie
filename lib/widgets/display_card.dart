import 'package:curie/common/utils/extensions.dart';
import 'package:curie/widgets/common_widgets/custom_container.dart';
import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  const DisplayCard({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.25,
      child: CustomContainer(
        color: Colors.white,
        allPadding: 30.0,
        offset: const Offset(7, 8),
        border: Border.all(color: Colors.black, width: 2.0),
        child: Column(
          children: [
            // balance
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.monetization_on,
                  size: 45.0,
                ),
                Text(
                  "52,503",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),

            //all time gains
            20.whitespaceHeight,
            Row(
              children: [
                const Text("All time gain:"),
                const Spacer(),
                const Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.green,
                ),
                3.whitespaceWidth,
                const Text(
                  "\$2,503",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),

            //Past 1-year CAGR
            5.whitespaceHeight,
            Row(
              children: [
                const Text("Past 1-year CAGR:"),
                const Spacer(),
                const Text(
                  "8.5%",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                3.whitespaceWidth,
                const Icon(
                  Icons.info_outline,
                  size: 18.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
