import 'package:flutter/material.dart';

class UsersInfo with ChangeNotifier {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  UsersInfo({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
  });
}

class UserAddress with ChangeNotifier {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  UserAddress({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
  });
}

class UserLocation with ChangeNotifier {
  final String lat;
  final String lng;

  UserLocation({
    this.lat,
    this.lng,
  });
}

class UserCompany with ChangeNotifier {
  final String name;
  final String catchPhrase;
  final String bs;

  UserCompany({
    this.name,
    this.catchPhrase,
    this.bs,
  });
}
