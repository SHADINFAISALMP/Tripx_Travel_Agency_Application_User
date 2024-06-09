import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/screens/favorites/favorite_manager.dart';
import 'package:tripx_user_application/screens/package_details/package_details.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class HolidaysScreen extends StatefulWidget {
  const HolidaysScreen({super.key});

  @override
  State<HolidaysScreen> createState() => _HolidaysScreenState();
}

class _HolidaysScreenState extends State<HolidaysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: colorteal,
            ),
          ),
          backgroundColor: whitecolor,
          centerTitle: true,
          title: mytext("HOLIDAYS PACKAGES",
              fontFamily: bodoni,
              fontSize: 22,
              color: colorteal,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorteal,
        body: SafeArea(
          child: buildListView(),
        ));
  }

  Widget buildListView() {
    final CollectionReference packageDetails =
        FirebaseFirestore.instance.collection('packagedetails');
    return StreamBuilder(
        stream: packageDetails.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: whitecolor, size: 60),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No Packages available',),
            );
          }
          final querySnapshot = snapshot.data!;
          return ListView.builder(
              itemCount: querySnapshot.size,
              itemBuilder: (context, index) {
                final item = querySnapshot.docs[index];
                List<String> images =
                    (item['imagepath'] as List<dynamic>).cast<String>();
                return Homescreen_list_items(
                    context: context, imagePath: images.first, item: item);
              });
        });
  }
}

class Homescreen_list_items extends StatefulWidget {
  final BuildContext context;
  final String imagePath;
  final QueryDocumentSnapshot<Object?> item;

  const Homescreen_list_items({
    super.key,
    required this.context,
    required this.imagePath,
    required this.item,
  });

  @override
  State<Homescreen_list_items> createState() => _Homescreen_list_itemsState();
}

class _Homescreen_list_itemsState extends State<Homescreen_list_items>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    bool favoriteStatus = await FavoriteManager.isFavorite(widget.item.id);
    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  Future<void> toggleFavorite() async {
    if (isFavorite) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orange,
          content: Center(
            child: Text(
              'REMOVED FROM FAVORITES',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Bodoni',
              ),
            ),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orange,
          content: Center(
            child: Text(
              'ADDED TO FAVORITES',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Bodoni',
              ),
            ),
          ),
        ),
      );
    }
    await FavoriteManager.toggleFavorite(widget.item.id, {
      'imagePath': widget.imagePath,
      'packagename': widget.item['packagename'],
      'placenames': widget.item['placenames'],
      'packagediscription': widget.item['packagediscription'],
      'days': widget.item['days'],
      'night': widget.item['night'],
      'packageamount': widget.item['packageamount'],
    });
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  String _checkNullOrEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Not Available';
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PackageDetails(
              itemslists: widget.item,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          border: Border.all(color: orangecolor),
          borderRadius: BorderRadius.circular(15),
          color: whitecolor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Image.network(
                    widget.imagePath,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: toggleFavorite,
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.tour, color: colorteal),
                const SizedBox(width: 5),
                mytext(
                    _checkNullOrEmpty(widget.item['packagename']).toUpperCase(),
                    fontFamily: bodoni,
                    fontSize: 25,
                    color: colorteal,
                    fontWeight: FontWeight.bold),
              ],
            ),
            SizedBox(
              height: mediaqueryheight(0.001, context),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.place, color: colorteal),
                  const SizedBox(width: 5),
                  mytext(_checkNullOrEmpty(widget.item['placenames']),
                      fontFamily: sedan,
                      fontSize: 18,
                      color: colorteal,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 5),
                  mytext(_checkNullOrEmpty(widget.item['packagediscription']),
                      fontFamily: sedan,
                      fontSize: 18,
                      color: colorteal,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            SizedBox(
              height: mediaqueryheight(0.01, context),
            ),
            Row(
              children: [
                const SizedBox(width: 30),
                const Icon(Icons.sunny, color: colorteal),
                mytext(
                  _checkNullOrEmpty(widget.item['days']),
                  fontFamily: bodoni,
                  fontSize: 18,
                  color: colorteal,
                ),
                const SizedBox(width: 20),
                const Icon(Icons.nights_stay, color: colorteal),
                mytext(
                  _checkNullOrEmpty(widget.item['night']),
                  fontFamily: bodoni,
                  fontSize: 18,
                  color: colorteal,
                ),
                const SizedBox(width: 20),
                const Icon(Icons.attach_money, color: colorteal),
                mytext(
                  widget.item['packageamount'],
                  fontFamily: bodoni,
                  fontSize: 18,
                  color: colorteal,
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
