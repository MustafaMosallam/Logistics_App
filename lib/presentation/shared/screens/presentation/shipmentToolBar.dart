import 'dart:developer';

import 'package:app/constants/api_path.dart';
import 'package:app/presentation/features/customer/presentation/shipments/create_shipments_screens.dart/model/shipments_model.dart';
import 'package:app/presentation/shared/screens/models/shipment_status.dart';
import 'package:app/constants/colors.dart';
import 'package:app/presentation/shared/widgets/shipment_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShipmentDataScreenToolBar extends StatefulWidget {
  final int? initialTab;
  bool isTruckOwner;
  ShipmentDataScreenToolBar({
    super.key,
    this.initialTab,
    this.isTruckOwner = false,
  });

  @override
  State<ShipmentDataScreenToolBar> createState() =>
      _ShipmentDataScreenToolBarState();
}

class _ShipmentDataScreenToolBarState extends State<ShipmentDataScreenToolBar> {
  bool isLoading = false;
  String? errorMessage;
  final Dio _dio = Dio();
  List<Shipment> retreivedShipments = [];
  Future<void> getshipments() async {
    try {
      final response = await _dio.get(
        ApiPath.shipment,
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NjllMjgzZjFhMmRlMjNlNzk5NjUzYiIsImlhdCI6MTc1MjAzMjE2NSwiZXhwIjoxNzU0NjI0MTY1fQ.inV8FVSkDgCR-YI4-T11TGrbVBB3lOKxveoXi6hBP38",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final shipmentsJson = response.data["data"]["shipments"];

        if (shipmentsJson != null && shipmentsJson is List) {
          List<Shipment> shipments =
              shipmentsJson
                  .map<Shipment>((json) => Shipment.fromJson(json))
                  .toList();
          for (var shipment in shipments) {
            log("Shipment ID: ${shipment.id}");
          }

          setState(() {
            retreivedShipments = shipments;
            errorMessage = null;
          });
        } else {
          setState(() {
            errorMessage = "لا يوجد شحنات لعرضها";
          });
        }
      } else {
        setState(() {
          errorMessage = "حدث خطأ أثناء تحميل الشحنات";
        });
      }
    } catch (e) {
      log("error: $e");
      setState(() {
        errorMessage = "فشل الاتصال بالخادم: ${e.toString()}";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  // int selectedIndex = 1;

  List<String> customerTabs = [
    "الشحنات الجارية",
    "الشحنات المعلقة",
    "الشحنات المكتملة",
  ];
  List<String> truckTabs = [
    "الشحنات الجارية",
    "المقدم عليها",
    "الشحنات المكتملة",
  ];

  List<String> tabs = [];

  String selectedTabLabel = "الشحنات المعلقة";

  List<ShipmentCard> onGoingShipments = [
    // ShipmentCard(
    //   isNew: false,
    //   id: 0,
    //   status: ShipmentStatus.ongoing,
    //   icon: Icons.local_shipping,
    // ),
  ];

  List<ShipmentCard> completedShipments = [
    // ShipmentCard(
    //   isOngoing: false,
    //   isNew: false,
    //   id: 1,
    //   status: ShipmentStatus.completed,
    //   icon: Icons.check,
    // ),
    // ShipmentCard(
    //   isOngoing: false,
    //   isNew: false,
    //   id: 1,
    //   status: ShipmentStatus.completed,
    //   icon: Icons.check,
    // ),
  ];

  List<ShipmentCard> pendingShipments = [
    // ShipmentCard(
    //   isOngoing: false,
    //   isNew: false,
    //   id: 2,
    //   status: ShipmentStatus.billUploadNeeded,
    //   icon: Icons.warning,
    // ),
    // ShipmentCard(
    //   isOngoing: false,
    //   isNew: false,
    //   id: 2,
    //   status: ShipmentStatus.billReviewing,
    //   icon: Icons.warning,
    // ),
    // ShipmentCard(
    //   isOngoing: false,
    //   isNew: false,
    //   id: 2,
    //   status: ShipmentStatus.waitForTrucks,
    //   icon: Icons.warning,
    // ),
  ];
  List<ShipmentCard> shipments = [];
  List<ShipmentCard> _getShipmentsForTab(String tab) {
    switch (tab) {
      case "الشحنات الجارية":
        return onGoingShipments;
      case "الشحنات المعلقة":
        return pendingShipments;
      case "الشحنات المكتملة":
        return completedShipments;
      default:
        return [];
    }
  }

  @override
  void initState() {
    super.initState();
    getshipments();

    if (widget.isTruckOwner) {
      selectedTabLabel = "المقدم عليها";
      tabs = truckTabs;
    } else {
      tabs = customerTabs;
    }
    if (widget.initialTab != null) {
      switch (widget.initialTab) {
        case 0:
          selectedTabLabel = "الشحنات الجارية";
        case 1:
          selectedTabLabel = "الشحنات المكتملة";
        case 2:
          selectedTabLabel =
              widget.isTruckOwner ? "المقدم عليها" : "الشحنات المعلقة";
      }
      final index = tabs.indexOf(selectedTabLabel);

      if (tabs.length >= 3) {
        if (index == 0) {
          tabs = [tabs[1], tabs[0], tabs[2]];
        } else if (index == tabs.length - 1) {
          tabs = [
            tabs[tabs.length - 3],
            tabs[tabs.length - 1],
            tabs[tabs.length - 2],
          ];
        } else {
          tabs = [tabs[index - 1], tabs[index], tabs[index + 1]];
        }
      }
    }
    shipments = onGoingShipments;
    shipments = _getShipmentsForTab(selectedTabLabel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              // Swipe right to left
              log("Going to the left", name: "gesture");
              setState(() {
                log(tabs.toString(), name: "tabs before");
                final currentIndex = tabs.indexOf(selectedTabLabel);
                log(tabs[currentIndex].toString(), name: "currentIndex");
                final nextIndex = (currentIndex - 1) % tabs.length;
                log(tabs[nextIndex].toString(), name: "nextIndex");

                selectedTabLabel = tabs[nextIndex];
                log(selectedTabLabel, name: "selectedTabLabel");

                // Rotate tabs array
                final temp = tabs[2];
                tabs[2] = tabs[1];
                tabs[1] = tabs[0];
                tabs[0] = temp;
                log(tabs.toString(), name: "tabs after");

                shipments = _getShipmentsForTab(selectedTabLabel);
              });
            } else if (details.primaryVelocity! < 0) {
              // Swipe left to right
              log("Going to the right", name: "gesture");
              setState(() {
                log(tabs.toString(), name: "tabs before");
                final currentIndex = tabs.indexOf(selectedTabLabel);
                log(tabs[currentIndex].toString(), name: "currentIndex");
                final prevIndex =
                    (currentIndex + 1 + tabs.length) % tabs.length;
                log(tabs[prevIndex].toString(), name: "prevIndex");
                selectedTabLabel = tabs[prevIndex];
                log(selectedTabLabel, name: "selectedTabLabel");
                // Rotate tabs array in opposite direction

                final temp = tabs[0];
                tabs[0] = tabs[1];
                tabs[1] = tabs[2];
                tabs[2] = temp;
                log(tabs.toString(), name: "tabs after");
                shipments = _getShipmentsForTab(selectedTabLabel);
              });
            }
          },
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 35.h,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 5.w, right: 0.w, top: 16.h),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(12),
                      // border: Border.all(color: Colors.orange.shade300),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(tabs.length, (index) {
                        // final isSelected = selectedIndex == index;
                        return GestureDetector(
                          onTap: () {
                            final tappedTab = tabs[index];

                            setState(() {
                              selectedTabLabel = tappedTab;

                              // Center the tapped tab by rearranging the list
                              if (tabs.length >= 3) {
                                final newTabs = <String>[];

                                // Ensure index-1, index, index+1 structure if possible
                                if (index == 0) {
                                  newTabs.addAll([tabs[1], tabs[0], tabs[2]]);
                                } else if (index == tabs.length - 1) {
                                  newTabs.addAll([
                                    tabs[tabs.length - 3],
                                    tabs[tabs.length - 1],
                                    tabs[tabs.length - 2],
                                  ]);
                                } else {
                                  newTabs.addAll([
                                    tabs[index - 1],
                                    tabs[index],
                                    tabs[index + 1],
                                  ]);
                                }

                                tabs = newTabs;
                                print(tabs);
                              }

                              shipments = _getShipmentsForTab(selectedTabLabel);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 3.r),
                            child: Text(
                              tabs[index],
                              style: TextStyle(
                                fontSize:
                                    tabs[index] == selectedTabLabel
                                        ? 20.sp
                                        : 12.sp,
                                color:
                                    tabs[index] == selectedTabLabel
                                        ? AppColors.primaryColor
                                        : AppColors.buttonColor.withAlpha(128),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Positioned(
                    top: 45.h,
                    child: Container(
                      height: 3.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,

                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              Expanded(
                child:
                    selectedTabLabel == "الشحنات المعلقة"
                        ? ListView.builder(
                          itemCount: retreivedShipments.length,
                          itemBuilder: (context, index) {
                            return ShipmentCard(
                              date:
                                  "${retreivedShipments[index].estimatedPickupDate}",
                              fromCountry:
                                  retreivedShipments[index].origin.country,
                              fromCity:
                                  retreivedShipments[index].origin.address,
                              toCountry:
                                  retreivedShipments[index].destination.country,
                              toCity:
                                  retreivedShipments[index].destination.address,
                              shipmentId: retreivedShipments[index].id,
                              isNew: false,
                              id: 2,
                              status: ShipmentStatus.billUploadNeeded,
                              icon: Icons.warning,
                            );
                          },
                        )
                        : Center(
                          child: Text(
                            "لا يوجد شحنات",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
