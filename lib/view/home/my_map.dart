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
  // ChromeSafariBrowser instance for displaying web pages in Chrome or Safari browser
  final ChromeSafariBrowser browser = ChromeSafariBrowser();

  // Completer for GoogleMapController
  Completer<GoogleMapController> _controller = Completer();
  
  // GoogleMapController instance
  late GoogleMapController googleMapController;
  
  // LocationData instance for storing current location data
  LocationData? _locationData;
  
  // List to store coordinates for drawing polylines on the map
  List<LatLng> polylineCoordinates = [];
  
  // Boolean flag for controlling direction buttons visibility
  bool dirController = false;
  
  // Set of markers to be displayed on the map
  Set<Marker> markers = {};
  
  // LatLng instance for holding the destination marker position
  LatLng? dirControllerLatLng;
  
  // Boolean flag for checking if direction button is pressed
  bool dirIsPressed = false;
  
  // BitmapDescriptor for source and destination markers
  BitmapDescriptor sourceMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationMarker = BitmapDescriptor.defaultMarker;
  
  // Set of circles to be displayed on the map
  Set<Circle> circles = {};

  @override
  void initState() {
    // Initialize web view
    webViewInit();
    
    // Set custom markers
    setCustomMarkes();
    
    // Get current location
    currLocation();
    super.initState();
  }

  @override
  void setState(fn) {
    // Check if the widget is mounted before calling setState
    if (mounted) {
      super.setState(fn);
    }
  }

  void getPolyPoints(LatLng source, LatLng destination) {
    // Fetch route coordinates between source and destination
    tomtom_api.getRouteBetweenCoordinates(source, destination).then((value) {
      polylineCoordinates = value;
      setState(() {});
    });
  }

  void webViewInit() async {
    // Enable web contents debugging for Android
    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(false);
    }
    // Get Safe Browsing privacy policy URL
    AndroidInAppWebViewController.getSafeBrowsingPrivacyPolicyUrl();
  }

  // Function to get the current location and listen for location changes
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

  // Function to add circles on the map
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

  // Function to set custom markers
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
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        titleTextStyle: const TextStyle(color: Colors.green, fontSize: 26),
        centerTitle: true,
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

  CameraPosition _currCameraPosition() {
    // Return the current camera position
    return CameraPosition(
        target: LatLng(_locationData!.latitude!, _locationData!.longitude!),
        zoom: 14);
  }

  void getMarker(List<String> stringList) async {
    // Fetch sorted marker data
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
    // Create a set of markers from sorted marker data
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
