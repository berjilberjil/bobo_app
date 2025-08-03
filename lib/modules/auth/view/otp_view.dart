import 'package:bobo/modules/auth/view/new.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isOTPValid = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      
      backgroundColor: const Color(0xFF131315),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            title: const Text(
              "OTP Verifications",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            ), // Change icon colorwh

            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter the OTP sent to number",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 20),
                PinCodeTextField(
                  textStyle: TextStyle(color: Colors.white),
                  appContext: context,
                  length: 6, // number of OTP digits
                  onChanged: (value) {
                    print(value);
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 35,
                    fieldWidth: 45,
                    activeFillColor: Color(0xFF1e1e20), // adjust for dark mode
                    inactiveFillColor: Color(0xFF1e1e20),
                    selectedFillColor: Color(0xFF1e1e20),
                    activeColor: Colors.transparent,
                    selectedColor: Colors.white,
                    inactiveColor: Colors.transparent,
                  ),
                  keyboardType: TextInputType.number,
                  enableActiveFill: true,

                  onCompleted:
                      (value) => setState(() {
                        isOTPValid = value.length == 6; // check if OTP is valid
                      }),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Didn't get the OTP?",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      "(Request again in 0:29s)",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.02),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.18,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.message,
                          color: Colors.white.withOpacity(0.3),
                          size: screenWidth * 0.03,
                        ),
                        label: Text(
                          "SMS",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontSize: screenWidth * 0.025,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF1e1e20),
                          minimumSize: Size(double.infinity, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    SizedBox(
                      width: screenWidth * 0.3,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.white.withOpacity(0.3),

                          size: screenWidth * 0.03,
                        ),
                        label: Text(
                          "Whatsapp",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontSize: screenWidth * 0.025,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF1e1e20),
                          minimumSize: Size(double.infinity, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: SizedBox(
              width: double.infinity,
              height: screenWidth < 600 ? 48 : 40,
              child: ElevatedButton(
                onPressed:
                    isOTPValid
                        ? () {
                          Get.to(() => NewPage());
                        }
                        : null,

                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: Colors.grey,
                  disabledForegroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: isOTPValid ? Colors.black : Colors.white,
                    fontSize:
                        screenWidth < 600
                            ? screenWidth * 0.04
                            : screenWidth * 0.01,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
