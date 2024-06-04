import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: whitecolor,
              )),
          centerTitle: true,
          backgroundColor: colorteal,
          title: Text(
            "Customer Support",
            style: TextStyle(
                color: whitecolor,
                fontWeight: FontWeight.bold,
                fontFamily: bodoni),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How can we help you?",
                style: TextStyle(
                    color: colorteal,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: bodoni),
              ),
              Divider(
                thickness: 1,
                endIndent: mediaquerywidht(0.35, context),
                color: colorteal,
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(
                  Icons.phone_in_talk_outlined,
                  color: colorteal,
                  size: 30,
                ),
                title: Text(
                  "Call Support",
                  style: TextStyle(
                      color: colorteal,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () async {
                  final Uri url = Uri(scheme: 'tel', path: '9072051005');

                  if (await canLaunchUrl(url)) {
                    launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "can't do the call",
                        style: TextStyle(color: colorteal),
                      ),
                      backgroundColor: whitecolor,
                    ));
                  }
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.email_outlined,
                  color: colorteal,
                  size: 30,
                ),
                title: Text(
                  "Email Support",
                  style: TextStyle(
                      color: colorteal,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () async {
                  final Uri url =
                      Uri(scheme: 'mailto', path: 'shadinfaisal305@gmail.com');

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "can't do the sms",
                        style: TextStyle(color: colorteal),
                      ),
                      backgroundColor: whitecolor,
                    ));
                  }
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.sms_outlined,
                  color: colorteal,
                  size: 30,
                ),
                title: Text(
                  "SMS Support",
                  style: TextStyle(
                      color: colorteal,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () async {
                  final Uri url = Uri(scheme: 'sms', path: '9072051005');

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "can't do the sms",
                        style: TextStyle(color: colorteal),
                      ),
                      backgroundColor: whitecolor,
                    ));
                  }
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: colorteal,
                  size: 30,
                ),
                title: Text(
                  "Office Location",
                  style: TextStyle(
                      color: colorteal,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () async {
                  final Uri url = Uri(
                    scheme: 'geo',
                    path: '11.258260547089058, 75.79156079541575',
                  );

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "can't do the direction",
                        style: TextStyle(color: colorteal),
                      ),
                      backgroundColor: whitecolor,
                    ));
                  }
                },
              ),
              SizedBox(height: 20),
              Text(
                "Frequently Asked Questions",
                style: TextStyle(
                    fontSize: 22,
                    color: colorteal,
                    fontWeight: FontWeight.bold,
                    fontFamily: bodoni),
              ),
              Divider(
                thickness: 1,
                endIndent: mediaquerywidht(0.25, context),
                color: colorteal,
              ),
              Expanded(
                child: ListView(
                  children: const [
                    ExpansionTile(
                      title: Text(
                        "How do I contact customer support?",
                        style: TextStyle(
                            color: colorteal,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "You can contact customer support by calling our support number, sending an email, or sms message",
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        "What is your refund policy?",
                        style: TextStyle(
                            color: colorteal,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Our refund policy allows you to request a refund within 30 days of purchase. Please contact customer support by calling our support number, sending an email, or sms message",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
