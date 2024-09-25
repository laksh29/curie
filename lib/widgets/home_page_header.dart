import 'package:curie/common/utils/extensions.dart';
import 'package:curie/widgets/common_widgets/custom_container.dart';
import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // user info
        Row(
          children: [
            const SizedBox.square(
              dimension: 35.0,
              child: CustomContainer(
                radius: 5.0,
                bgImage:
                    "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?q=80&w=3220&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
            ),
            10.whitespaceWidth,
            RichText(
              text: const TextSpan(
                  text: "hey,",
                  style: TextStyle(
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                  children: [
                    TextSpan(
                        text: "\nJohn!",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ))
                  ]),
            ),
          ],
        ),
        const Spacer(),
        // curie money
        Row(
          children: [
            const Text(
              "9876543210@curieyesbank",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            5.whitespaceWidth,
            const SizedBox.square(
              dimension: 15.0,
              child: CustomContainer(
                radius: 2.0,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }
}
