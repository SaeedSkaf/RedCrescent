import 'package:animated_fab_button_menu/animated_fab_button_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sarc/ui/map/map_view_model.dart';
import 'package:stacked/stacked.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MapViewModel>.reactive(
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          title: const Text("مواقع المراكز في مدينة حمص"),
          backgroundColor: Colors.red[600],
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                model.animateMap(model.mymarker["300"]!);
              },
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              child: const Text("300"),
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FabMenu(
            fabBackgroundColor: Colors.red,
            elevation: 2.0,
            fabAlignment: Alignment.bottomLeft,
            fabIcon: const Text('المراكز'),
            closeMenuButton: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            overlayOpacity: 0.5,
            overlayColor: Colors.grey[100],
            children: model.mymarker.keys
                .map((e) => MenuItem(
                      title:
                          "المركز رقم ${model.mymarker[e]!.infoWindow.title!}",
                      onTap: () {
                        model.animateMap(model.mymarker[e]!);
                        Navigator.pop(context);
                      },
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ))
                .toList()),
        body: GoogleMap(
          markers: model.mymarker.values.toSet(),
          mapType: MapType.hybrid,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          initialCameraPosition: model.initialCameraPosition,
          onMapCreated: (GoogleMapController controller) {
            model.setController(controller);
          },
        ),
      ),
      viewModelBuilder: () => MapViewModel(),
      onModelReady: (model) async {
        await model.setMarkerCustomImage();
      },
    );
  }
}
