import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class TrackingLBSPage extends StatefulWidget {
  late Location location = Location();
  double userHeading = 0.0;
  LatLng userLocation = const LatLng(0, 0);
  TrackingLBSPage({super.key});

  Future<void> _getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    try {
      // Cek apakah layanan lokasi diaktifkan
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      // Cek izin lokasi
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      // Ambil lokasi pengguna
      LocationData _locationData = await location.getLocation();
      userLocation = LatLng(_locationData.latitude!, _locationData.longitude!);
      userHeading = _locationData.heading!;
    } catch (e) {
      log("Error: $e");
    }
  }

  @override
  State<TrackingLBSPage> createState() => _TrackingLBSPageState();
}

class _TrackingLBSPageState extends State<TrackingLBSPage> {
  late StreamSubscription<LocationData> locationSubscription;
  void _listenLocationChanges() {
    try {
      setState(() {
        //listener
        locationSubscription =
            widget.location.onLocationChanged.listen((currentLocation) {
          setState(() {
            widget.userLocation =
                LatLng(currentLocation.latitude!, currentLocation.longitude!);
            widget.userHeading = currentLocation.heading!;
          });
        });
      });
    } catch (e) {
      log("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();

    widget._getLocation();
    _listenLocationChanges();
  }

  @override
  void dispose() {
    locationSubscription.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tracking LBS"),
        ),
        body: widget.userLocation.latitude == 0 &&
                widget.userLocation.longitude == 0
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text("Menunggu lokasi..."),
                  ],
                ),
              )
            : FlutterMap(
                options: MapOptions(
                  initialCenter: widget.userLocation,
                  initialZoom: 13,
                  minZoom: 5,
                  maxZoom: 40,
                ),
                children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: widget.userLocation,
                          width: 80,
                          height: 80,
                          rotate: true,
                          child: Transform.rotate(
                              angle: widget.userHeading * (3.14 / 180),
                              child: const Icon(
                                Icons.navigation,
                                size: 20,
                                color: Colors.red,
                              )),
                        ),
                      ],
                    ),
                  ]));
  }
}
