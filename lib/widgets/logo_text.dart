import 'package:BookIn/modules/auth/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          child: Text(
            "BookIn",
            style: TextStyle(
              color: Colors.white,
              fontSize:
                  screenWidth < 600 ? screenWidth * .20 : screenWidth * .09,
              fontFamily: 'Barriecito',
              height: 1,
            ),
          ),
          onPressed: () => Get.to(() => LoginPage()),
        ),
        SizedBox(height: 0),
        Text(
          "by Luxi Studio",
          style: TextStyle(
            color: Colors.white,
            fontSize:
                screenWidth < 600 ? screenWidth * 0.04 : screenWidth * .02,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}
