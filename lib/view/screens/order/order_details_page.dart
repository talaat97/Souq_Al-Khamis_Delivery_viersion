import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/order/orderDetailsController.dart';
import '../../../core/class/handling_data.dart';
import '../../../core/theme/app_theme.dart';
import '../../widgets/shared/app_card.dart';
import '../../widgets/shared/section_title.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = Get.put(Orderdetailscontroller());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.textPrimary),
        title: Text(
          'Order Details',
          style: TextStyles.font24BlackBold,
        ),
        centerTitle: true,
      ),
      body: AppBackground(
        child: GetBuilder<Orderdetailscontroller>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 100, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(title: 'Order Items'),
                  AppCard(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex: 3, child: Text('Item', style: TextStyles.font14GrayRegular)),
                            Expanded(flex: 1, child: Text('Qty', textAlign: TextAlign.center, style: TextStyles.font14GrayRegular)),
                            Expanded(flex: 1, child: Text('Price', textAlign: TextAlign.right, style: TextStyles.font14GrayRegular)),
                          ],
                        ),
                        const Divider(height: 24, color: AppColor.neutralLight),
                        ...List.generate(
                          pageController.orderDetailsList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    pageController.orderDetailsList[index].iteamsName!,
                                    style: TextStyles.font16WhiteSemiBold.copyWith(color: AppColor.textPrimary),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    pageController.orderDetailsList[index].countItems!.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyles.font15DarkBlueMedium,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '\$${pageController.itemPriceDiscount(
                                      double.parse(pageController.orderDetailsList[index].iteamsPrice!),
                                      double.parse(pageController.orderDetailsList[index].iteamsDiscount!),
                                    )}',
                                    textAlign: TextAlign.right,
                                    style: TextStyles.font15DarkBlueMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  AppCard(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Amount', style: TextStyles.font16WhiteSemiBold.copyWith(color: AppColor.textSecondary)),
                        Text('\$${pageController.orderModel.orderTotalPrice}', style: TextStyles.font24OrangeBold),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  const SectionTitle(title: 'Delivery Details'),
                  
                  if (pageController.orderModel.orderType == '0')
                    AppCard(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.location_on, color: AppColor.primaryColor),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${pageController.orderModel.addressName}, ${pageController.orderModel.addressCity}', 
                                    style: TextStyles.font16WhiteSemiBold.copyWith(color: AppColor.textPrimary)),
                                const SizedBox(height: 4),
                                Text('${pageController.orderModel.addressStreet}', 
                                    style: TextStyles.font14GrayRegular),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                  if (pageController.orderModel.orderType == '1')
                    AppCard(
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        height: 300,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: pageController.cameraPosition!,
                            onMapCreated: (GoogleMapController controllerMap) {
                              pageController.googleMapController!.complete(controllerMap);
                            },
                            markers: pageController.marker.toSet(),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
