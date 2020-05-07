import 'dart:async';

import 'package:find_seat/presentation/MainWidgetsCollection/MainWidgets.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyCinemas extends StatefulWidget {
  @override
  _NearbyCinemas createState() => _NearbyCinemas();
}

class _NearbyCinemas extends State<NearbyCinemas> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text('Nearby theatres'.toUpperCase(),
                    style: FONT_CONST.MEDIUM_BLACK2_14),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _cinemaList();
                  },
                  child: Text('View all',
                      style: FONT_CONST.MEDIUM_DEFAULT_10,
                      textAlign: TextAlign.right),
                ),
              )
            ],
          ),
          WidgetSpacer(height: 14),
          _buildGoogleMap()
        ],
      ),
    );
  }

  _cinemaList() {
    Navigator.pushNamed(context, Router.LIST_ALL_CINE);
  }

  Completer<GoogleMapController> control = Completer();

  Map<MarkerId, Marker> locations = <MarkerId, Marker>{};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(7.8731, 80.7718),
    zoom: 8.4746,
  );

  _buildGoogleMap() {
    return Container(
      height: 168,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(locations.values),
        onMapCreated: (GoogleMapController controller) {
          control.complete(controller);

          LatLng southwest = LatLng(7.2083, 79.8358);
          LatLng northeast = LatLng(6.68278, 80.39917);

          Future.delayed(Duration(seconds: 1), () {
            controller.animateCamera(
              CameraUpdate.newLatLngBounds(
                  LatLngBounds(southwest: southwest, northeast: northeast), 0),
            );
          });

          _marker(context);
        },
      ),
    );
  }

  Future<void> _marker(BuildContext context) async {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(4, 4)),
            'assets/ic_nearby_theatre.png')
        .then((icon) {
      _displayMarker(icon);
    });
  }

  _displayMarker(BitmapDescriptor bmp) {
    Map<String, LatLng> cinemas = new Map<String, LatLng>();
    cinemas["Royal Negombo"] = LatLng(7.2083, 79.8358);
    cinemas["Savoy Cinema"] = LatLng(6.68278, 80.39917);


    cinemas.forEach((markerIdVal, latLng) {
      final MarkerId markerId = MarkerId(markerIdVal);

      final Marker marker = Marker(
        markerId: markerId,
        icon: bmp,
        position: latLng,
        infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
        onTap: () {},
      );

      setState(() {
        locations[markerId] = marker;
      });
    });
  }
}
