import 'package:uts_mobile/models/service_model.dart';

class DoctorModel {
  final String name;
  final String image;
  final List<String> services;
  final double distance;
  final String price; // Harga layanan
  final String specialOffers; // Penawaran spesial

  DoctorModel({
    required this.name,
    required this.image,
    required this.services,
    required this.distance,
    required this.price,
    this.specialOffers = '',
  });
}

var doctors = [
  DoctorModel(
      name: "Dr. Hertin ",
      image: "Dr. Stone.jpg",
      services: [Service.vaccine, Service.surgery],
      distance: 10,
      price: "Rp 500.000", // Menambahkan harga
      specialOffers: "Diskon 10% untuk vaksinasi"), // Penawaran spesial
  DoctorModel(
      name: "Dr. Adi",
      image: "Dr1.jpg",
      services: [Service.checkup, Service.dentalCare],
      distance: 5,
      price: "Rp 300.000", // Menambahkan harga
      specialOffers: "Gratis konsultasi pertama"), // Penawaran spesial
  DoctorModel(
      name: "Dr. Budi",
      image: "Dr2.jpg",
      services: [Service.grooming],
      distance: 15,
      price: "Rp 200.000"), // Tidak ada penawaran spesial
];
