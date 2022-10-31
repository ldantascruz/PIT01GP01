import 'package:finances_group/src/view/design/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card_brazilian/credit_card_widget.dart';
import 'package:flutter_credit_card_brazilian/flutter_credit_card.dart';

class MyCards extends StatelessWidget {
  const MyCards({super.key});

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          InkWell(
            onTap: (() {
              debugPrint('Cards Page');
            }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cartões',
                  style: CustomAppTextTheme.headline2,
                ),
                const Icon(
                  Icons.navigate_next,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CreditCardWidget(
                  cardNumber: '5555 4875 6521 1725',
                  expiryDate: '12/2025',
                  cardHolderName: 'Antônio Carlos Ferreira',
                  cvvCode: '123',
                  height: 200,
                  width: myWidth * 0.80,
                  cardType: CardType.visa,
                  showBackView:
                      false, //true when you want to show cvv(back) view
                ),
                CreditCardWidget(
                  cardNumber: '6847 2487 0241 3849',
                  expiryDate: '06/2029',
                  cardHolderName: 'Silas Cardoso Genro',
                  cvvCode: '321',
                  height: 200,
                  width: myWidth * 0.80,
                  cardType: CardType.mastercard,
                  cardBgColor: Colors.amber.shade700,
                  showBackView:
                      false, //true when you want to show cvv(back) view
                ),
                CreditCardWidget(
                  cardNumber: '1874 9564 2050 9475',
                  expiryDate: '01/2024',
                  cardHolderName: 'João Fernandes Pires',
                  cvvCode: '456',
                  height: 200,
                  width: myWidth * 0.80,
                  cardType: CardType.americanExpress,
                  cardBgColor: Colors.grey.shade800,
                  showBackView:
                      false, //true when you want to show cvv(back) view
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}