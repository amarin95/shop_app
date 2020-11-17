import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/orders.dart';
import 'package:flutter_complete_guide/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart' as oi;

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
Future _ordersFuture;

Future _obtainOrdersFuture(){
  return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
}

  //to avoid rerun of the http request if rebuild => 
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: _ordersFuture,
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              //error handling
              return Center(
                child: Text('Error has ocurred!'),
              );
            } else {
              return Consumer<Orders>(builder: (ctx, orderData, child) => ListView.builder(itemBuilder: (ctx, i) => oi.OrderItem(orderData.orders[i]), itemCount: orderData.orders.length));
            }
          }
        },
      ),
    );
  }
}
