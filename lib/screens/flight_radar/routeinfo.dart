// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tripx_user_application/models/flightradar/all_state.dart';
import 'package:tripx_user_application/api_services/flight_service.dart';

class Routeinfo extends StatefulWidget {
  final double? fromLat;
  final double? fromlon;
  final double? toLat;
  final double? toLon;
  final String? icao24;

  const Routeinfo(
      {super.key,
      this.fromLat,
      this.fromlon,
      this.toLat,
      this.toLon,
      this.icao24});

  @override
  State<Routeinfo> createState() => _RouteinfoState();
}

class _RouteinfoState extends State<Routeinfo> {
  final Set<Marker> _markers = {};
  BitmapDescriptor? _markerpin;
  LatLng? _currentlocation;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    setCustomMappine();
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
      updateState();
    });
  }

  void setCustomMappine() async {
    _markerpin = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/flightsradar1.png');
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    updateState();
  }

  void updateState() async {
    LatLng from = LatLng(widget.fromLat!, widget.fromlon!);
    LatLng to = LatLng(widget.toLat!, widget.toLon!);
    AllState state = await FlightService().getState(widget.icao24!,context);
    _currentlocation = LatLng(state.latitude!, state.longitude!);
    setState(() {
      _markers.clear();
      _markers.add(Marker(markerId: MarkerId(from.toString()), position: from));
      _markers.add(Marker(markerId: MarkerId(to.toString()), position: to));
      _markers.add(Marker(
          markerId: MarkerId(_currentlocation.toString()),
          position: _currentlocation!,
          icon: _markerpin!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.fromLat!, widget.fromlon!),
          zoom: 0,
        ),
        onMapCreated: _onMapCreated,
        markers: _markers,
        mapType: MapType.normal,
      ),
    ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
