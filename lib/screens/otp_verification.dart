import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/bottomnavigation.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Airplane.jpg'),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: mediaqueryheight(.16, context),
                  ),
                  child: mytext(
                    "OTP VERIFICATION",
                    fontFamily: 'sedan',
                    fontSize: mediaqueryheight(.034, context),
                    color: white70,
                  ),
                ),
                SizedBox(
                  height: mediaqueryheight(.1, context),
                ),
                mytext(
                  "        Code has sent to \n shadinfaisal@gmail.com",
                  fontSize: mediaqueryheight(.021, context),
                  color: white70,
                  fontFamily: 'sedan',
                ),
                SizedBox(
                  height: mediaqueryheight(.021, context),
                ),
                mytext(
                  "Please enter your 4 digits code",
                  fontSize: mediaqueryheight(.021, context),
                  color: white70,
                  fontFamily: 'sedan',
                ),
                SizedBox(
                  height: mediaqueryheight(.021, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const OtpBox(),
                    SizedBox(
                      width: mediaquerywidht(.03, context),
                    ),
                    const OtpBox(),
                    SizedBox(
                      width: mediaquerywidht(.03, context),
                    ),
                    const OtpBox(),
                    SizedBox(
                      width: mediaquerywidht(.03, context),
                    ),
                    const OtpBox(),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
    "haven't recieved the verification code? \n                      resend code",
    textAlign: TextAlign.start,
    style: TextStyle(
        fontFamily: 'sedan',
        fontSize: mediaqueryheight(.021, context),
        color: white70,
        fontWeight: FontWeight.normal),
  ),
                SizedBox(
                  height: mediaqueryheight(.041, context),
                ),
                Container(
                  height: mediaqueryheight(.061, context),
                  width: mediaquerywidht(.7, context),
                  decoration: BoxDecoration(
                    color: white70,
                    borderRadius: BorderRadius.circular(
                      mediaqueryheight(.011, context),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Bottomnavigation())),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: mediaquerywidht(.03, context),
                          ),
                        ),
                        SizedBox(
                          width: mediaquerywidht(.04, context),
                        ),
                        mytext(
                          'VERIFY & CONTINUE',
                          color: blackcolor,
                          fontSize: mediaqueryheight(.021, context),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'sedan',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpBox extends StatelessWidget {
  const OtpBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaquerywidht(.17, context),
      child: TextFormField(
        maxLength: 1,
        showCursor: false,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: white70,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              mediaqueryheight(.011, context),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
