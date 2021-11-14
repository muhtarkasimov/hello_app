import 'package:flutter/material.dart';

class RatesWidget extends StatelessWidget {
  final String currency;
  final String buyPrice;
  final String sellPrice;

  const RatesWidget(this.currency, this.buyPrice, this.sellPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                child:  Icon(Icons.attach_money, color: Colors.red,)),
            Container(child: Text(currency), alignment: Alignment.center,),
            Container(child: Text(buyPrice), alignment: Alignment.topRight,),
            Container(child: Text(sellPrice),),
          ],
        ),
      ),
    );
  }
}