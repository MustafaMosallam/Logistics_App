enum ShipmentTrackingSteps {
  loadingAreaArrived(title: "تم الوصول لمنطقة التحميل"),
  doneLoadingAndBilling(title: "تم تحميل الشحنة واستلام وصل المنشأ");

  final String title;

  const ShipmentTrackingSteps({required this.title});
}
