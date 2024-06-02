import 'dart:async';
import 'dart:io';
import 'package:ayush_hospitals/modules/sortedMarkers/sortedMarkers.dart';
import 'package:ayush_hospitals/widgets/controlButtons.dart';
import 'package:ayush_hospitals/widgets/topExpandButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:ayush_hospitals/modules/map/tomtom_routing_engine.dart';
import 'package:ayush_hospitals/view/home/MarkerDetailsPage.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});
  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  final ChromeSafariBrowser browser = ChromeSafariBrowser();
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController googleMapController;
  LocationData? _locationData;
  List<LatLng> polylineCoordinates = [];
  bool dirController = false;
  Set<Marker> markers = {};
  LatLng? dirControllerLatLng;
  bool dirIsPressed = false;
  BitmapDescriptor sourceMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationMarker = BitmapDescriptor.defaultMarker;
  Set<Circle> circles = {};

  @override
  void initState() {
    webViewInit();
    setCustomMarkes();
    currLocation();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void getPolyPoints(LatLng source, LatLng destination) {
    tomtom_api.getRouteBetweenCoordinates(source, destination).then((value) {
      polylineCoordinates = value;
      setState(() {});
    });
  }

  void webViewInit() async {
    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(false);
    }
    AndroidInAppWebViewController.getSafeBrowsingPrivacyPolicyUrl();
  }

// To get the current Location and listen location changes
  void currLocation() async {
    Location location = Location();

// Collecting Location Data

    _locationData = await location.getLocation();

    _controller.future.then((value) {
      googleMapController = value;
      setCustomMarkes();
      location.onLocationChanged.listen((newloc) {
        _locationData = newloc;
        if (dirIsPressed) {
          googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(_locationData!.latitude!, _locationData!.longitude!),
            zoom: 16,
            tilt: 50,
          )));
          getPolyPoints(
              LatLng(_locationData!.latitude!, _locationData!.longitude!),
              dirControllerLatLng!);
        } else {
          polylineCoordinates = [];
        }

        markers.removeWhere((element) =>
            element.markerId == const MarkerId("current location"));

        markers.add(Marker(
          infoWindow: InfoWindow(
              title: "Me", snippet: "current location", onTap: () {}),
          icon: sourceMarker,
          markerId: const MarkerId("current location"),
          position: LatLng(_locationData!.latitude!, _locationData!.longitude!),
        ));
        addCircles(_locationData!.latitude!, _locationData!.longitude!);

        setState(() {});
      });
    });
    setState(() {});
  }

  void addCircles(double latitude, double longitude) {
    double radius1Km = 25000; // 25 kilometers in meters
    double radius2Km = 50000; // 50 kilometers in meters
    double radius3Km = 1000000; // 100 kilometers in meters

    circles = Set.from([
      Circle(
        circleId: CircleId("circle30Km"),
        center: LatLng(latitude, longitude),
        radius: radius3Km,
        fillColor:
            const Color.fromARGB(255, 255, 17, 0).withOpacity(0.3), // Red
        strokeWidth: 0,
      ),
      Circle(
        circleId: CircleId("circle20Km"),
        center: LatLng(latitude, longitude),
        radius: radius2Km,
        fillColor: Color.fromARGB(255, 255, 236, 29).withOpacity(0.6), // Yellow
        strokeWidth: 0,
      ),
      Circle(
        circleId: CircleId("circle10Km"),
        center: LatLng(latitude, longitude),
        radius: radius1Km,
        fillColor: Color.fromARGB(255, 4, 136, 17).withOpacity(0.8), // Green
        strokeWidth: 0,
      ),
    ]);
  }

  void setCustomMarkes() async {
    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "lib/assets/images/hospital2.png")
        .then((icon) {
      destinationMarker = icon;
    });

    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "lib/assets/images/currLoc2.png")
        .then((icon) {
      sourceMarker = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Holistic Heal",
          style: TextStyle(
            // fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        titleTextStyle: const TextStyle(color: Colors.green, fontSize: 26),
        centerTitle: true, // Align title text along the center
        // toolbarHeight: 95, // Increase the height of the AppBar
      ),
      body: Stack(
        children: [
          _locationData == null
              ? const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.black,
                  ),
                )
              : GoogleMap(
                  zoomControlsEnabled: false,
                  mapToolbarEnabled: false,
                  markers: markers,
                  circles: polylineCoordinates.isNotEmpty ? {} : circles,
                  initialCameraPosition: _currCameraPosition(),
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  polylines: {
                    Polyline(
                      polylineId: const PolylineId("default1"),
                      color: Colors.red,
                      points: polylineCoordinates,
                      width: 6,
                      startCap: Cap.roundCap,
                      jointType: JointType.round,
                      endCap: Cap.roundCap,
                    ),
                  },
                ),
          if (dirController)
            DirControlButtons(
              markerSet: markers,
              locationData: _locationData,
              dirControllerLatLng: dirControllerLatLng,
              polylineChange: (value) {
                polylineCoordinates = value;
                setState(() {});
              },
              controllerToggle: (value) {
                dirController = value;
                polylineCoordinates = [];
                googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: dirControllerLatLng!, zoom: 10),
                  ),
                );
              },
              markerChange: (value) {
                markers = value;
                markers.add(
                  Marker(
                    infoWindow: InfoWindow(
                      title: "Me",
                      snippet: "current location",
                      onTap: () {},
                    ),
                    icon: sourceMarker,
                    markerId: const MarkerId("current location"),
                    position: LatLng(
                      _locationData!.latitude!,
                      _locationData!.longitude!,
                    ),
                  ),
                );
                setState(() {});
              },
              onDirctionButtonPressed: (value) {
                dirIsPressed = value;
                if (!dirIsPressed) polylineCoordinates = [];
                setState(() {});
              },
            ),
          TopExpandButtons(
            sortedMarkerSet: (value) {
              getMarker(value);
              setState(() {});
            },
          )
        ],
      ),
    );
  }

// Current Camera Postion
  CameraPosition _currCameraPosition() {
    return CameraPosition(
        target: LatLng(_locationData!.latitude!, _locationData!.longitude!),
        zoom: 14);
  }

  void getMarker(List<String> stringList) async {
    List<List<dynamic>> sortedData = await SortedMarkers.getSortedMarkers(
        stringList[0], stringList[1], stringList[2]);

    if (sortedData.isNotEmpty) {
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            sortedData[0][0].latitude, // Assuming latitude is at index 0
            sortedData[0][0].longitude, // Assuming longitude is at index 1
          ),
          zoom: 9,
        ),
      ));
    }
    markers = markersSet(sortedData);
    setState(() {});
  }

  Set<Marker> markersSet(List<List<dynamic>> sortedData) {
    Set<Marker> res = {};
    for (List<dynamic> sorted in sortedData) {
      LatLng sortedLatLng = sorted[0];
      String title = sorted[2];
      res.add(
        Marker(
          infoWindow: InfoWindow(
            title: title,
            snippet: "click to see details",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MarkerDetailsPage(title: title),
                ),
              );
            },
          ),
          icon: destinationMarker,
          markerId: MarkerId("$sorted[1]"),
          position: sortedLatLng,
          onTap: (() {
            if (dirControllerLatLng == null) {
              dirController = !dirController;
            } else if (!dirController &&
                (dirControllerLatLng != sortedLatLng ||
                    dirControllerLatLng == sortedLatLng)) {
              dirController = !dirController;
            }
            dirControllerLatLng = sortedLatLng;
            if (!dirController) polylineCoordinates = [];
            setState(() {});
          }),
        ),
      );
    }
    return res;
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }

  Future<void> disposeController() async {
    googleMapController = await _controller.future;
    googleMapController.dispose();
  }
}
