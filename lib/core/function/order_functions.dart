import 'package:flutter/material.dart';
import 'package:souq_al_khamis_delivey_version/core/theme/app_theme.dart';

printOrderType(String val) {
  return val == '0' ? 'Delivery' : 'Receive';
}

printOrrderPaymentMethod(String val) {
  return val == '0' ? 'cash' : 'payment cart';
}

printDeliverPriceOrder(String val) {
  return val == '0' ? 'no delivey price' : val;
}

Color colorCard(String val) {
  if (val == '2') {
    return OrderStatusColor.waiting;
  }
  if (val == '3') {
    return OrderStatusColor.shipping;
  }
  if (val == '4') {
    return OrderStatusColor.archived;
  }
  return AppColor.neutralMedium;
}
