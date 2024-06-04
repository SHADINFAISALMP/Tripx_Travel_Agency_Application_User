import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(_createRoute);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: whitecolor,
            )),
        centerTitle: true,
        title: Text('ABOUT US',
            style: TextStyle(
                fontFamily: bodoni,
                fontWeight: FontWeight.bold,
                color: whitecolor)),
        backgroundColor: colorteal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'TRIPX',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: sedan,
                  fontWeight: FontWeight.bold,
                  color: colorteal,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'About Company',
              style: TextStyle(
                fontSize: 24,
                fontFamily: sedan,
                fontWeight: FontWeight.bold,
                color: colorteal,
              ),
            ),
            Divider(
              thickness: 1.5,
              color: colorteal,
            ),
            const SizedBox(height: 10),
            Text(
              'Tripx is a travel agency app that specializes in holiday and package bookings. Our platform offers a wide range of destinations and packages for users to choose from. In addition to holiday bookings, users can also search for flights and hotels through our app.',
              style: TextStyle(
                  fontSize: 17, fontFamily: sedan, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Text(
              'Mission',
              style: TextStyle(
                fontSize: 24,
                fontFamily: sedan,
                fontWeight: FontWeight.bold,
                color: colorteal,
              ),
            ),
            Divider(
              thickness: 1.5,
              color: colorteal,
            ),
            const SizedBox(height: 10),
            Text(
              'Our mission at Tripx is to provide seamless and convenient travel booking experiences for our users. We aim to make travel planning easy and stress-free, allowing our customers to focus on enjoying their trips to the fullest.',
              style: TextStyle(
                  fontSize: 17, fontFamily: sedan, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Text(
              'Vision',
              style: TextStyle(
                fontSize: 24,
                fontFamily: sedan,
                fontWeight: FontWeight.bold,
                color: colorteal,
              ),
            ),
            Divider(
              thickness: 1.5,
              color: colorteal,
            ),
            const SizedBox(height: 10),
            Text(
              'Our vision at Tripx is to become the go-to platform for all travel booking needs. We strive to continuously innovate and improve our services to offer the best possible experience for our users.',
              style: TextStyle(
                  fontSize: 17, fontFamily: sedan, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Text(
              'Core Values',
              style: TextStyle(
                fontSize: 24,
                fontFamily: sedan,
                fontWeight: FontWeight.bold,
                color: colorteal,
              ),
            ),
            Divider(
              thickness: 1.5,
              color: colorteal,
            ),
            const SizedBox(height: 10),
            Text(
              'Customer Satisfaction: We prioritize the needs and preferences of our customers to ensure their satisfaction.',
              style: TextStyle(
                  fontSize: 17, fontFamily: sedan, color: Colors.black54),
            ),
            const SizedBox(height: 5),
            Text(
              'Innovation: We are committed to staying ahead of the curve by constantly evolving and adapting to the changing travel industry.',
              style: TextStyle(
                  fontSize: 17, fontFamily: sedan, color: Colors.black54),
            ),
            const SizedBox(height: 5),
            Text(
              'Integrity: We uphold the highest standards of honesty and transparency in all our dealings with customers and partners.',
              style: TextStyle(
                  fontSize: 17, fontFamily: sedan, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Text(
              'Team',
              style: TextStyle(
                fontSize: 24,
                fontFamily: sedan,
                fontWeight: FontWeight.bold,
                color: colorteal,
              ),
            ),
            Divider(
              thickness: 1.5,
              color: colorteal,
            ),
            const SizedBox(height: 10),
            Text(
              'Our team at Tripx is comprised of dedicated professionals who are passionate about travel and technology. With a diverse range of skills and expertise, we work together to deliver exceptional service and experiences to our users.',
              style: TextStyle(
                  fontSize: 17, fontFamily: sedan, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'THANK YOU...',
                style: TextStyle(
                    fontSize: 28, fontFamily: sedan, color: colorteal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const AboutUs(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return RotationTransition(
          turns: animation,
          child: ScaleTransition(
            scale: animation,
            alignment: Alignment.center,
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
