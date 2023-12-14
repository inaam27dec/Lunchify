import 'package:flutter/material.dart';

class OrderDataModel {
  int orderNumber;
  String userName;
  double totalAmount;
  String dateTime;
  OrderDataModel(
      {required this.orderNumber,
      required this.userName,
      required this.totalAmount,
      required this.dateTime});
}
