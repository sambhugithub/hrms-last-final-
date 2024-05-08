import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hrms/localizations/app_localizations.dart';
import 'package:hrms/view/widgets/toast_msg.dart';


class CurrentLocation{

  Future <Map<String,String>> getCurrentLoc(context) async {
    bool serviceEnabled= await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return ToastMsg().showToast(Translation.of(context)!.translate('location_services_are_disabled')!,Colors.red);
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied){
        return ToastMsg().showToast(Translation.of(context)!.translate('location_permission_are_denied')!,Colors.red);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return ToastMsg().showToast(Translation.of(context)!.translate('location_permission_permanantly_denied')!,Colors.red);
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high,forceAndroidLocationManager: true ,);
    //List<Location> location = await locationFromAddress('${countryC!.text}, ${stateC!.text}, ${cityC!.text}, ${addressC!.text}, ${areaC!.text}');
    List<Location> location = await locationFromAddress('India, westbengal,kolkata,teghoriya,ananda apartments first floor,700136');
    print('location: $location');
     //print("lat: ${position.latitude.toString()}");
     //print("long: ${position.longitude.toString()}");
    double lat =position.latitude;
    double long =position.longitude;
    //double distanceInMeters = Geolocator.distanceBetween( location.first.latitude, location.first.longitude,position.latitude, position.longitude,);
    //print('distance $distanceInMeters');

    List<Placemark> placemark = await placemarkFromCoordinates(lat,long);
    //debugPrint("place: $placemark");
    //print("place: $placemark");
    print('${placemark.first.name}, ${placemark.first.street}, ${placemark.first.thoroughfare}, ${placemark.first.subLocality}, ${placemark.first.subAdministrativeArea}, ${placemark.first.postalCode}');
    String country= placemark.first.country!;
    String state= placemark.first.administrativeArea!;
    String sub_admini_area= placemark.first.subAdministrativeArea!;//presidency Division
    String locality= placemark.first.locality!;//kolkata
    String sub_locality= placemark.first.subLocality!;//koikhali
    String street= placemark.first.street!;//doshodrone khelar math road
    String thoroughfare=placemark.first.thoroughfare!;
    String name=placemark.first.name!;
    String postal_code= placemark.first.postalCode!;//700052/
    return {
      'country':country,
      'state':state,
      'subAdminiArea':sub_admini_area,
      'locality':locality,
      'subLocality':sub_locality,
      'street':street,
      'thoroughfare':thoroughfare,
      'name':name,
      'postalCode':postal_code,
      'lat':'$lat',
      'long':'$long',
    };

  }
}