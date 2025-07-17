enum UserRoleModel {
  merchant(name: "Merchant"),
  truckOwner(name: "Truck Owner"),
  fleetOwner(name: "Fleet Owner");

  final String name;
  const UserRoleModel({required this.name});
}
