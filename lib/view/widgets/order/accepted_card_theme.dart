import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:souq_al_khamis_delivey_version/core/class/status_request.dart';
import 'package:souq_al_khamis_delivey_version/core/class/handling_data.dart';
import 'package:souq_al_khamis_delivey_version/core/theme/app_theme.dart';
import 'package:souq_al_khamis_delivey_version/core/function/order_functions.dart';
import 'package:souq_al_khamis_delivey_version/data/datacorse/remote/model/order_model.dart';
import 'package:souq_al_khamis_delivey_version/view/widgets/shared/app_card.dart';
import 'package:souq_al_khamis_delivey_version/view/widgets/shared/app_badge.dart';
import 'package:souq_al_khamis_delivey_version/view/widgets/shared/app_button.dart';

class AcceptedThemeCard extends StatelessWidget {
  final OrderModel orderModel;
  final StatusRequest statusRequest;
  final Color color;
  final void Function()? orderArchive;
  final void Function()? goToOrderDetails;
  const AcceptedThemeCard({
    super.key,
    required this.orderModel,
    required this.statusRequest,
    required this.color,
    this.orderArchive,
    required this.goToOrderDetails,
  });

  @override
  Widget build(BuildContext context) {
    return HandlingDataView(
      statusRequest: statusRequest,
      widget: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order #${orderModel.orderId}', style: TextStyles.font18DarkBlueBold),
                  AppBadge(text: Jiffy.parse('${orderModel.orderDatetime}').fromNow(), color: color),
                ],
              ),
              const SizedBox(height: 16),
              
              Row(
                children: [
                   const Icon(Icons.person_outline, size: 20, color: AppColor.textSecondary),
                   const SizedBox(width: 8),
                   Expanded(child: Text('${orderModel.addressName ?? "Customer"}', style: TextStyles.font16WhiteSemiBold.copyWith(color: AppColor.textPrimary))),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                   const Icon(Icons.location_on_outlined, size: 20, color: AppColor.textSecondary),
                   const SizedBox(width: 8),
                   Expanded(child: Text('${orderModel.addressCity ?? ""}, ${orderModel.addressStreet ?? ""}', style: TextStyles.font14GrayRegular)),
                ],
              ),
              
              const SizedBox(height: 16),
              const Divider(color: AppColor.neutralLight),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Payment', style: TextStyles.font13GrayRegular),
                  Text('${printOrrderPaymentMethod(orderModel.orderPaymentMethod!)}', style: TextStyles.font14DarkBlueMedium),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Type', style: TextStyles.font13GrayRegular),
                  Text('${printOrderType(orderModel.orderType!)}', style: TextStyles.font14DarkBlueMedium),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price', style: TextStyles.font14GrayRegular),
                  Text('\$${orderModel.orderTotalPrice}', style: TextStyles.font18DarkBlueBold.copyWith(color: AppColor.primaryColor)),
                ],
              ),
              
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: AppButton(
                      text: 'Details',
                      isOutlined: true,
                      onPressed: goToOrderDetails ?? () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: AppButton(
                      text: 'Done',
                      onPressed: orderArchive ?? () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
