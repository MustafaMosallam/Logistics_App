class Shipment {
  final String id;
  final String merchantId;
  final ShipmentLocation origin;
  final ShipmentLocation destination;
  final CargoDetails cargoDetails;
  final String status;
  final DateTime estimatedPickupDate;
  final DateTime estimatedDeliveryDate;
  final List<TimelineEntry> timeline;
  final DateTime createdAt;

  Shipment({
    required this.id,
    required this.merchantId,
    required this.origin,
    required this.destination,
    required this.cargoDetails,
    required this.status,
    required this.estimatedPickupDate,
    required this.estimatedDeliveryDate,
    required this.timeline,
    required this.createdAt,
  });

  factory Shipment.fromJson(Map<String, dynamic> json) {
    return Shipment(
      id: json["_id"],
      merchantId: json["merchantId"],
      origin: ShipmentLocation.fromJson(json["origin"]),
      destination: ShipmentLocation.fromJson(json["destination"]),
      cargoDetails: CargoDetails.fromJson(json["cargoDetails"]),
      status: json["status"],
      estimatedPickupDate: DateTime.parse(json["estimatedPickupDate"]),
      estimatedDeliveryDate: DateTime.parse(json["estimatedDeliveryDate"]),
      timeline:
          (json["timeline"] as List)
              .map((item) => TimelineEntry.fromJson(item))
              .toList(),
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }
}

class ShipmentLocation {
  final String address;
  final Coordinates coordinates;
  final String country;

  ShipmentLocation({
    required this.address,
    required this.coordinates,
    required this.country,
  });

  factory ShipmentLocation.fromJson(Map<String, dynamic> json) {
    return ShipmentLocation(
      address: json["address"],
      coordinates: Coordinates.fromJson(json["coordinates"]),
      country: json["country"],
    );
  }
}

class Coordinates {
  final double lat;
  final double lng;

  Coordinates({required this.lat, required this.lng});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      lat: json["lat"].toDouble(),
      lng: json["lng"].toDouble(),
    );
  }
}

class CargoDetails {
  final String description;
  final double weight;
  final double volume;
  final String category;
  final bool hazardous;
  final String specialInstructions;

  CargoDetails({
    required this.description,
    required this.weight,
    required this.volume,
    required this.category,
    required this.hazardous,
    required this.specialInstructions,
  });

  factory CargoDetails.fromJson(Map<String, dynamic> json) {
    return CargoDetails(
      description: json["description"],
      weight: json["weight"].toDouble(),
      volume: json["volume"].toDouble(),
      category: json["category"],
      hazardous: json["hazardous"],
      specialInstructions: json["specialInstructions"],
    );
  }
}

class TimelineEntry {
  final String status;
  final DateTime createdAt;

  TimelineEntry({required this.status, required this.createdAt});

  factory TimelineEntry.fromJson(Map<String, dynamic> json) {
    return TimelineEntry(
      status: json["status"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }
}
