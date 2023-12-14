import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../utilities/utils/colors.dart';
import 'OrderCellWidget.dart';
import '../../../../data/model/OrderDataModel.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({Key? key}) : super(key: key);
  static const routeName = "OrdersList";

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  int? groupValue = 0;
  static List<OrderDataModel> _listOfItems = [];

  _OrdersListState() {
    _listOfItems.add(OrderDataModel(
        orderNumber: 00350,
        userName: "Muhammad Rohan",
        totalAmount: 1000,
        dateTime: "Aug 23, 2022"));
    _listOfItems.add(OrderDataModel(
        orderNumber: 00351,
        userName: "Muhammad Rohan",
        totalAmount: 2000,
        dateTime: "Aug 23, 2022"));
    _listOfItems.add(OrderDataModel(
        orderNumber: 00352,
        userName: "Muhammad Rohan",
        totalAmount: 100,
        dateTime: "Aug 23, 2022"));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Order list',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w800, fontSize: 26),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: AppColors.darkBlue,
            indicatorColor: AppColors.darkBlue,
            tabs: [
              Tab(
                text: 'Today',
                icon: Icon(Icons.today),
              ),
              Tab(text: 'Previous', icon: Icon(Icons.history)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _listOfOrders(),
            Center(child: Text('Previous')),
          ],
        ),
      ),
    );
  }

  Widget _listOfOrders() {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: _listOfItems.length,
            itemBuilder: (context, index) {
              return OrderCellWidget(order: _listOfItems[index]);
            }),
      ),
    );
  }
}
