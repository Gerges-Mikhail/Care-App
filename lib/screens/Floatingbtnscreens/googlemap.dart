import 'package:care/common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class SimpleMap extends StatefulWidget {
  @override
  _SimpleMapState createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
  static final LatLng _kMapCenter =
      LatLng(50.500502, 20.890365);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  late GoogleMapController _controller;

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller.setMapStyle(value);
  }
  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: _kMapCenter,
          infoWindow: InfoWindow(title: 'Marker 1'),
          rotation: 90),

    };
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkblue,
        title: Text('Reach Us'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        onMapCreated: onMapCreated,
        mapType: MapType.satellite,
        myLocationEnabled: true,
        markers: _createMarker(),
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
      ),
    );
  }
}
