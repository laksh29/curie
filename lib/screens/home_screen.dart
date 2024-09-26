import 'package:curie/common/utils/extensions.dart';
import 'package:curie/widgets/bnb_tile.dart';
import 'package:curie/widgets/button_row.dart';
import 'package:curie/widgets/buttons_on_card.dart';
import 'package:curie/widgets/display_card.dart';
import 'package:curie/widgets/home_page_header.dart';
import 'package:curie/widgets/knowledge_carousel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final List carousel = [
      "https://plus.unsplash.com/premium_photo-1664372145591-f7cc308ff5da?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c3R1ZHl8ZW58MHx8MHx8fDA%3D",
      "https://images.unsplash.com/photo-1604882737274-4afaddefec9b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3R1ZHl8ZW58MHx8MHx8fDA%3D",
      "https://plus.unsplash.com/premium_photo-1663013506908-a6f66c941587?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHN0dWR5fGVufDB8fDB8fHww",
      "https://images.unsplash.com/photo-1668554245893-2430d0077217?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww",
      "https://images.unsplash.com/photo-1622675103136-e4b90c9a33d6?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ];

    final List bnbName = [
      'Home',
      'Transacton',
      'Debit Card',
    ];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // background
            Column(
              children: [
                Container(
                  height: height / 3,
                  color: Colors.black87,
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow[100],
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // header
                  (height * 0.07).whitespaceHeight,

                  const HomePageHeader(),
                  //
                  (height * 0.08).whitespaceHeight,

                  SizedBox(
                    height: height * 0.28,
                    child: Stack(
                      children: [
                        DisplayCard(height: height),
                        const ButtonsOnCard(),
                      ],
                    ),
                  ),

                  //
                  (height * 0.03).whitespaceHeight,
                  const ButtonsRow(),

                  //
                  (height * 0.03).whitespaceHeight,
                  const Text(
                    "Curie's Knowledge Bank",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  (height * 0.02).whitespaceHeight,
                  CurieKnowledgeCarousel(
                      height: height, carousel: carousel, width: width)
                ],
              ),
            )
          ],
        ),
      ),

      // BNB
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomAppBar(
          color: Colors.black87,
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 2.0,
            top: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              3,
              (index) {
                return BNBTile(
                  index: index,
                  name: bnbName.elementAt(index),
                  image: carousel.elementAtOrNull(index),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
