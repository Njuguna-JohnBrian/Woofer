import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woofer/theme.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: WFTheme.mainColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello Samuel 👋🏽",
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const Text(
              "what would you like to do?",
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(
              "assets/images/person.svg",
              height: 30,
              width: 30,
              color: Colors.brown,
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: size.height * 0.05),
        shrinkWrap: true,
        children: [
          GridView.count(
            crossAxisCount: 2,
            primary: false,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 4.0,
            shrinkWrap: true,
            children: [
              _buildCrad(
                'Grooming',
                'assets/images/groom.png',
                1,
              ),
              _buildCrad(
                'Training',
                'assets/images/whistle.png',
                2,
              ),
              _buildCrad(
                'Vet',
                'assets/images/vet.png',
                3,
              ),
              _buildCrad(
                'Pet Shop',
                'assets/images/house.png',
                4,
              ),
              _buildCrad(
                'Adoption',
                'assets/images/heart.png',
                5,
              ),
              _buildCrad(
                'Dog walker',
                'assets/images/dog.png',
                6,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCrad(String name, String profile, int cardIndex) {
    return Card(
      color: WFTheme.mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      elevation: 7.0,
      shadowColor: Colors.grey.shade800,
      margin: cardIndex.isEven
          ? const EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
          : const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 10.0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 50.0,
          ),
          Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(
                  profile,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            name,
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
