import 'package:flutter/material.dart';
import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/services/utils_services.dart';

import '../../common_widgets/payment_dialog.dart';
import 'order_status_widget.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  OrderTile({super.key, required this.order});

  final UtilServices utilServices = UtilServices();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: order.status == 'pending_payment',
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pedido: ${order.id}'),
                Text(
                  utilServices.formatDateTime(order.createdDateTime),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 150,
                        child: ListView(
                          children: order.items.map((orderItem) {
                            return _OrderItemWidget(
                              utilServices: utilServices,
                              orderItem: orderItem,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.grey.shade300,
                      thickness: 2,
                      width: 8,
                    ),
                    Expanded(
                      flex: 2,
                      child: OrderStatusWidget(
                        status: order.status,
                        isOverdue:
                            order.createdDateTime.isBefore(DateTime.now()),
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  style: const TextStyle(fontSize: 20),
                  children: [
                    const TextSpan(
                      text: 'Total ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: utilServices.priceToCurrency(order.total),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: order.status == 'pending_payment',
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return PaymentDialog(
                            order: order,
                          );
                        });
                  },
                  icon: const Icon(Icons.pix_sharp),
                  label: const Text('Ver QR code Pix'),
                ),
              )
            ],
          )),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    super.key,
    required this.utilServices,
    required this.orderItem,
  });

  final UtilServices utilServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(
            utilServices.priceToCurrency(
              orderItem.totalPrice(),
            ),
          ),
        ],
      ),
    );
  }
}
