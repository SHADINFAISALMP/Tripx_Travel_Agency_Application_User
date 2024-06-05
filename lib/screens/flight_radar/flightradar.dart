import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tripx_user_application/models/flightradar/all_state.dart';
import 'package:tripx_user_application/screens/flight_radar/flight_info.dart';
import 'package:tripx_user_application/api_services/flight_service.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Flightradar extends StatefulWidget {
  const Flightradar({super.key});

  @override
  State<Flightradar> createState() => _SearchpageState();
}

class _SearchpageState extends State<Flightradar> {
  GoogleMapController? _mapController;
  String? _countryname = 'United Kingdom';
  LatLng? _sw = const LatLng(49.674, -14.015517);
  LatLng? _ne = const LatLng(61.061, 2.0919117);
  BitmapDescriptor? _localationpin;
  List<AllState>? _allStates;
  final Set<Marker> _markers = {};
  int _numberofFlights = 0;
  Timer? _timer;

  List<BoundingCountryBox> boundlist = [
    BoundingCountryBox('USA', 'United States', const LatLng(24.9493, -125.0011),
        const LatLng(49.5904, -66.9326)),
    BoundingCountryBox('CHN', 'China', const LatLng(8.8383436, 73.4997347),
        const LatLng(53.5608154, 134.7754563)),
    BoundingCountryBox('IRL', 'Ireland', const LatLng(51.222, -11.0133788),
        const LatLng(55.636, -5.6582363)),
    BoundingCountryBox('GBR', 'United Kingdom',
        const LatLng(49.674, -14.015517), const LatLng(61.061, 2.0919117)),
    BoundingCountryBox('IND', 'India', const LatLng(6.5546079, 68.1113787),
        const LatLng(35.6745457, 97.395561)),
    BoundingCountryBox('JPN', 'Japan', const LatLng(20.2145811, 122.7141754),
        const LatLng(45.7112046, 154.205541)),
    BoundingCountryBox('DEU', 'Germany', const LatLng(47.2701114, 5.8663153),
        const LatLng(55.099161, 15.0419319)),
    BoundingCountryBox('ESP', 'Spain', const LatLng(27.4335426, -18.3936845),
        const LatLng(43.9933088, 4.5918885)),
    BoundingCountryBox('THA', 'Thailand', const LatLng(5.612851, 97.3438072),
        const LatLng(20.4648337, 105.636812)),
  ];

  @override
  void initState() {
    super.initState();
    setCustomMapPin();
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) async {
      try {
        _allStates =
            await FlightService().getAllStateBounds(_sw!, _ne!, context);
        setState(() {
          createMarker();
        });
      } catch (e) {
        // Handle the error by showing an alert or a message
        debugPrint("Error fetching data: $e");
      }
    });
  }

  void setCustomMapPin() async {
    // ignore: deprecated_member_use
    _localationpin = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2),
        'assets/images/plane.png');
  }

  void handleselected() async {
    try {
      _allStates = await FlightService().getAllStateBounds(_sw!, _ne!, context);
      doSetState();
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }
  }

  void doSetState() {
    setState(
      () {
        _numberofFlights = _allStates?.length ?? 0;
        _mapController!.animateCamera(
          CameraUpdate.newLatLngBounds(
              LatLngBounds(southwest: _sw!, northeast: _ne!), 5),
        );
        createMarker();
      },
    );
  }

  void createMarker() {
    _markers.clear();
    _allStates?.forEach((state) {
      if (state.latitude != null || state.longitude != null) {
        LatLng position = LatLng(state.latitude!, state.longitude!);
        _markers.add(Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          icon: _localationpin!,
          infoWindow: InfoWindow(
            title: state.callsign?.trim() ?? '',
            snippet:
                'Origin country: ${state.originCountry}\nVelocity: ${state.velocity}\nGeom. alt: ${state.geoAltituce}\nBarom. alt: ${state.baroAltitude}',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FlightInfoScreen(
                            info: state,
                          )));
            },
          ),
        ));
      }
    });
  }

  void _onmapCreated(GoogleMapController controller) async {
    _mapController = controller;
    try {
      _allStates = await FlightService().getAllStateBounds(_sw!, _ne!, context);
      doSetState();
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Stack(
        children: <Widget>[
          Container(
            height: mediaqueryheight(0.31, context),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/flightradar1.jpg'),
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.cover)),
          ),
          SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    mytext("FLIGHT RADAR",
                        fontFamily: sedan,
                        fontSize: 28,
                        color: black54,
                        fontWeight: FontWeight.bold),
                    mytext("REAL-TIME FLIGHT TRACKER",
                        fontFamily: sedan,
                        fontSize: 18,
                        color: black54,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            fillColor: whitecolor,
                            filled: true,
                            hintText: "Select country",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onChanged: (value) {
                          for (var element in boundlist) {
                            if (element.id == value) {
                              _sw = element.sw;
                              _ne = element.ne;
                              _countryname = element.name;
                              handleselected();
                            }
                          }
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 'USA',
                            child: Text('United States Of America'),
                          ),
                          DropdownMenuItem(
                            value: 'CHN',
                            child: Text('China'),
                          ),
                          DropdownMenuItem(
                            value: 'IRL',
                            child: Text('Ireland'),
                          ),
                          DropdownMenuItem(
                            value: 'GBR',
                            child: Text('United Kingdom'),
                          ),
                          DropdownMenuItem(
                            value: 'IND',
                            child: Text('India'),
                          ),
                          DropdownMenuItem(
                            value: 'JPN',
                            child: Text('Japan'),
                          ),
                          DropdownMenuItem(
                            value: 'DEU',
                            child: Text('Germany'),
                          ),
                          DropdownMenuItem(
                            value: 'ESP',
                            child: Text('Spain'),
                          ),
                          DropdownMenuItem(
                            value: 'THA',
                            child: Text('Thailand'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "AIR-TRAFFIC OVER $_countryname".toUpperCase(),
                        style: const TextStyle(
                            color: black54,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "TOTAL FLIGHTS $_numberofFlights".toUpperCase(),
                        style: const TextStyle(
                            color: black54,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 460,
                child: Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(_sw!.latitude, _ne!.longitude),
                          // zoom: 1.5
                        ),
                        mapType: MapType.normal,
                        markers: _markers,
                        onMapCreated: _onmapCreated),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class BoundingCountryBox {
  final String id;
  final String name;
  final LatLng sw;
  final LatLng ne;

  BoundingCountryBox(this.id, this.name, this.sw, this.ne);
}
