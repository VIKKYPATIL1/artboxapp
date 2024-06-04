import 'package:art_box/screens/payment.dart';
import 'package:flutter/material.dart';

class CheckBoxStyle extends StatefulWidget {
  const CheckBoxStyle({
    super.key,
  });

  @override
  State<CheckBoxStyle> createState() => _CheckBoxStyleState();
}

class _CheckBoxStyleState extends State<CheckBoxStyle> {
  bool? isCheckBasic = true;
  bool? isCheckPremium = false;
  bool? isCheckPro = false;
  Icon check = Icon(Icons.check_circle_rounded);
  Icon uncheck = Icon(Icons.circle_outlined);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
            onPressed: () {
              setState(() {
                isCheckBasic = true;
                isCheckPremium = false;
                isCheckPro = false;
              });
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PaymentGatewayScreen(
                        index: 0,
                      )));
            },
            icon: isCheckBasic == true ? check : uncheck,
            label: Text(r'Basic: $ 9.99/month')),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton.icon(
            onPressed: () {
              setState(() {
                isCheckBasic = false;
                isCheckPremium = true;
                isCheckPro = false;
              });
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PaymentGatewayScreen(
                        index: 1,
                      )));
            },
            icon: isCheckPremium == true ? check : uncheck,
            label: Text(r'Premium: $39.99/month')),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton.icon(
            onPressed: () {
              setState(() {
                isCheckBasic = false;
                isCheckPremium = false;
                isCheckPro = true;
              });
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PaymentGatewayScreen(
                        index: 2,
                      )));
            },
            icon: isCheckPro == true ? check : uncheck,
            label: Text(r'Pro: $69.99/month')),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
