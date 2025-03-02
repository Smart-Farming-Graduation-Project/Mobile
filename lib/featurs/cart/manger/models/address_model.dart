import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressModel {
  final String addressTitle;
  final String addressDescription;
  final LatLng position;

  AddressModel({
    required this.addressTitle,
    required this.addressDescription,
    required this.position,
  });
}

List<AddressModel> demoAddresses = [
  AddressModel(
    addressTitle: 'Tahrir Square',
    addressDescription: 'A major public square in Downtown Cairo, Egypt.',
    position: const LatLng(30.0444, 31.2357),
  ),
  AddressModel(
    addressTitle: 'Pyramids of Giza',
    addressDescription: 'The last remaining wonder of the ancient world.',
    position: const LatLng(29.9792, 31.1342),
  ),
  AddressModel(
    addressTitle: 'Bibliotheca Alexandrina',
    addressDescription: 'A major library and cultural center in Alexandria.',
    position: const LatLng(31.2089, 29.9092),
  ),
  AddressModel(
    addressTitle: 'Karnak Temple',
    addressDescription: 'One of the largest ancient religious sites in Luxor.',
    position: const LatLng(25.7188, 32.6573),
  ),
  AddressModel(
    addressTitle: 'Aswan High Dam',
    addressDescription: 'A rock-fill dam across the Nile in Aswan.',
    position: const LatLng(23.9696, 32.8775),
  ),
  AddressModel(
    addressTitle: 'Al-Azhar Park',
    addressDescription: 'A beautiful green space in the heart of Cairo.',
    position: const LatLng(30.0378, 31.2636),
  ),
  AddressModel(
    addressTitle: 'Citadel of Salah El-Din',
    addressDescription: 'A historic fortification in Cairo.',
    position: const LatLng(30.0288, 31.2596),
  ),
  AddressModel(
    addressTitle: 'El Montaza Palace',
    addressDescription: 'A palace and extensive gardens in Alexandria.',
    position: const LatLng(31.2877, 30.0125),
  ),
  AddressModel(
    addressTitle: 'Luxor Temple',
    addressDescription: 'A large ancient Egyptian temple complex in Luxor.',
    position: const LatLng(25.6994, 32.6396),
  ),
  AddressModel(
    addressTitle: 'Saint Catherine\'s Monastery',
    addressDescription: 'One of the oldest Christian monasteries in the world.',
    position: const LatLng(28.5557, 33.9755),
  ),
];
