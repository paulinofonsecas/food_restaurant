import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

import '../../components/cards/big/big_card_image_slide.dart';
import '../../components/cards/big/restaurant_info_big_card.dart';
import '../../components/section_title.dart';
import '../../constants.dart';
import '../../demoData.dart';
import '../details/details_screen.dart';
import '../featured/featurred_screen.dart';
import 'components/medium_card_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String locationStr = "loading...";

  _HomeScreenState() {
    requestLocation();
  }

  void requestLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) async {
      double? lat = currentLocation.latitude;
      double? lon = currentLocation.longitude;
      if (lat == null || lon == null) {
        return;
      }

      String newLocation = await reverseSearchLocation(lat, lon);
      setState(() {
        locationStr = newLocation;
      });
    });
  }

  Future<String> reverseSearchLocation(double lat, double lon) async {
    http.Response res = await http.get(
        Uri.parse(
            "https://nominatim.openstreetmap.org/reverse?lat=$lat&lon=$lon&format=jsonv2&accept-language=th"),
        headers: {'Accept-Language': 'th'});
    dynamic json = jsonDecode(res.body);
    // print(json);
    String output =
        "${json['address']['road']}, ${json['address']['city']}, ${json['address']['state']}";

    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9999.0),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                FirebaseAuth.instance.currentUser?.photoURL ??
                    'https://www.ilovejapantours.com/images/easyblog_articles/6/doraemon-gadget-cat-from-the-future-wallpaper-4.jpg',
              ),
            ),
          ),
        ),
        title: const Text('Restaurantes'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoLocationToDeliveryWidget(locationStr: locationStr),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: BigCardImageSlide(images: demoBigImages),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              SectionTitle(
                title: "Principais parceiros",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeaturedScreen(),
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              const MediumCardList(),
              const SizedBox(height: 20),
              // Banner
              // const PromotionBanner(), หน้าโปรโมชั่น
              const SizedBox(height: 20),
              SectionTitle(
                title: "Melhores pratos",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeaturedScreen(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const MediumCardList(),
              const SizedBox(height: 20),
              SectionTitle(title: "Todos os restaurantes", press: () {}),
              const SizedBox(height: 16),

              // Demo list of Big Cards
              Column(
                children: demoMediumCardData.map((restaurant) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(
                        kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
                    child: RestaurantInfoBigCard(
                      // Use demoBigImages list
                      images: [restaurant["image"]],
                      // Use demoRestaurantNames list for name
                      name: restaurant["name"],
                      rating: restaurant["rating"],
                      numOfRating: 200,
                      deliveryTime: restaurant["delivertTime"],
                      foodType: const ["Fried Chicken"],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsScreen(),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoLocationToDeliveryWidget extends StatelessWidget {
  const InfoLocationToDeliveryWidget({
    super.key,
    required this.locationStr,
  });

  final String locationStr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Localização atual".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.black),
          ),
          Text(
            locationStr,
            style: const TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
