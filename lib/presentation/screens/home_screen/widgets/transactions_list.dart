import 'package:flutter/material.dart';

import '../../../../app/constants/text_style_constants.dart';
import '../../../../app/dependencies/svg_dep.dart';
import '../../../../data/model/transaction_model.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList({Key? key}) : super(key: key);
  final List<Transaction> transList = [
    Transaction(
        date: '09:14', heading: 'Spotify', amount: 'N10,000.00', isDebit: true),
    Transaction(
        date: '09:14', heading: 'Spotify', amount: 'N10,000.00', isDebit: true),
    Transaction(date: '09:14', heading: 'Spotify', amount: 'N10,000.00'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        transList.length,
        (index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                SvgAsset(imgPath: transList[index].imagePath),
                Column(
                  children: [
                    Text(transList[index].heading),
                    Text(transList[index].date),
                  ],
                ),
              ],
            ),
            Text(
              transList[index].amount,
              style: transList[index].isDebit
                  ? TextStylesConstants.debitText
                  : TextStylesConstants.creditText,
            ),
          ],
        ),
      ),
    );
  }
}
