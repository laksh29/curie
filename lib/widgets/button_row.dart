import 'package:curie/common/utils/extensions.dart';
import 'package:curie/widgets/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 11.0,
            ),
            color: Colors.white,
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/sip.png",
                  scale: 8.0,
                ),
                5.whitespaceWidth,
                const Text("Setup SIP")
              ],
            ),
          ),
          CustomButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            color: Colors.white,
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/linked.png",
                  scale: 8.0,
                ),
                5.whitespaceWidth,
                const Text("Linked Bank\nAccounts")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
