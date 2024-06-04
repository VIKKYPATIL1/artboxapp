import 'package:flutter/material.dart';
import 'package:checkout_screen_ui/checkout_page/checkout_page.dart';
import 'package:checkout_screen_ui/checkout_ui.dart';

class PaymentGatewayScreen extends StatefulWidget {
  const PaymentGatewayScreen({super.key, required this.index});
  final int index;

  @override
  State<PaymentGatewayScreen> createState() => _PaymentGatewayState();
}

/// Build a list of what the user is buying
final List<PriceItem> priceItems = [
  PriceItem(
      name: 'Basic',
      quantity: 1,
      itemCostCents: 90,
      canEditQuantity: true,
      description: "10 Images + Fast Response"),
  PriceItem(
      name: 'Premium', quantity: 2, itemCostCents: 390, canEditQuantity: true),
  PriceItem(
      name: 'Pro', quantity: 1, itemCostCents: 690, canEditQuantity: true),
];

class _PaymentGatewayState extends State<PaymentGatewayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 139, 146, 152),
      body: CheckoutPage(
          data: CheckoutData(
              displayTestData: true,
              displayNativePay: true,
              onBack: () {
                Navigator.of(context).pop();
              },
              countriesOverride: ["India", "United State"],
              priceItems: [priceItems[widget.index]],
              payToName: priceItems[0].name,
              initPhone: "9875642369",
              onCardPay: (value, price) {})),
    );
  }
}
