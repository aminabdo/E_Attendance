
import 'package:flutter/material.dart';

import 'new_orders.dart';

class OnGoingOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return OrderItem();
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 5,
        );
      },
      itemCount: 5,
    );
  }
}
