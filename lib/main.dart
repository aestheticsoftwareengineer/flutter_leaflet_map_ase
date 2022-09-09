import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ASE Leaflet Map',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo/ase_logo.png',
              height: 35,
              width: 35,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('ASE Leaflet Map'),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(34.05203647535833, -118.30392497961998),
          zoom: 10.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']
          ),
          MarkerLayerOptions(markers: getMarkers()),
        ],
      ),
    );
  }

  List<Marker> getMarkers() {
    return [
      Marker(
        width: 60.0,
        height: 18.0,
        point: LatLng(34.04174113752068, -118.39901469256829),
        builder: (context) => Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.green,
            ),
            child: const Center(child: Text('Aesthetic'))),
      ),
      Marker(
        width: 60.0,
        height: 18.0,
        point: LatLng(33.99143546729806, -118.2669500772087),
        builder: (context) => Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.green,
          ),
          child: const Center(child: Text('Software')),
        ),
      ),
      Marker(
        width: 60.0,
        height: 60.0,
        point: LatLng(34.1012283833039, -118.28684706207231),
        builder: (context) => Image.asset('assets/images/logo/ase_logo.png', height: 60.0, width: 60.0,),
      ),
      Marker(
        width: 60.0,
        height: 18.0,
        point: LatLng(34.04576430314672, -118.15770545053259),
        builder: (context) => Container(
          width: 60.0,
          height: 18.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.green,
          ),
          child: const Center(child: Text('Engineer')),
        ),
      ),
    ];
  }
}
