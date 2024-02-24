



import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';



class WelcomeComponent extends StatelessWidget {
  const WelcomeComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/welcoming.svg',
            height: 400,
            semanticsLabel: 'A red up arrow'
          ),
          const Gap(30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcame Boddy to ', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white54),),
              Text('wildflu',  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Color(0xFF79FCC8),))
            ],
          ),
          const Gap(10),
          const AutoSizeText(
            'The text to display, The text to display The text to display The text to display The text to display',
            style: TextStyle(fontSize: 14, color: Colors.white54),
            textAlign: TextAlign.center,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}

