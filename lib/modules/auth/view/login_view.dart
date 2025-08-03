import 'package:bobo/modules/auth/view/otp_view.dart';
import 'package:bobo/widgets/logo_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPhoneValid = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox.expand(
            child: Image.asset('assets/images/happy.png', fit: BoxFit.cover),
          ),

          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),

          // Foreground Content in Column
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                // Logo
                const Center(child: LogoText()),

                const Spacer(flex: 3),

                // Login Text
                Text(
                  "Login or Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    fontFamily: 'Poppins',
                  ),
                ),

                const SizedBox(height: 10),

                // Phone Field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: IntlPhoneField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        
                        
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      counterText: '',
                      filled: true,
                      fillColor: Colors.black,

                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    initialCountryCode: 'IN',
                    dropdownTextStyle: TextStyle(color: Colors.white),
                    onChanged: (phone) {
                      setState(() {
                        isPhoneValid = phone.number.length >= 10;
                      });
                    },
                  ),
                ),

                SizedBox(height: screenWidth * 0.02),

                
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: SizedBox(
                    width: double.infinity,
                    height:
                        screenWidth < 600
                            ? 48
                            : 40, 
                    child: ElevatedButton(
                      onPressed: isPhoneValid ? () {
                        Get.to(() => OtpScreen());
                        } : null,

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
                          color: isPhoneValid ? Colors.black : Colors.white,
                          fontSize: screenWidth<600? screenWidth * 0.04 :screenWidth * 0.01,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      
                    ),
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
