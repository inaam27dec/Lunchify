import 'package:flutter/material.dart';

import '../../../../data/model/OrderDataModel.dart';

class OrderCellWidget extends StatelessWidget {
  final OrderDataModel order;
  OrderCellWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Task #${this.order.orderNumber}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              Text.rich(
                TextSpan(
                  children: [
                    const WidgetSpan(
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 15.0,
                      ),
                    ),
                    TextSpan(
                      text: order.userName,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Rs ${order.totalAmount}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
