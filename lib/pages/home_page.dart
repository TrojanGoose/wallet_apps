// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/util/my_buttons.dart';
import 'package:wallet_app/util/my_card.dart';
import 'package:wallet_app/util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //pagecontroller
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' Cards',
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                  // plus icon
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[400], shape: BoxShape.circle),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            //cards
            Container(
              height: 200,
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.deepPurple[400],
                  ),
                  MyCard(
                    balance: 52.20,
                    cardNumber: 12345678,
                    expiryMonth: 04,
                    expiryYear: 28,
                    color: Colors.blue[400],
                  ),
                  MyCard(
                    balance: 1000.08,
                    cardNumber: 12345678,
                    expiryMonth: 01,
                    expiryYear: 26,
                    color: Colors.green[400],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: SwapEffect(
                activeDotColor: Colors.grey.shade800,
              ),
            ),

            SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // send button
                  MyButton(
                    buttonText: 'Send',
                    iconImagePath: 'lib/icon/send.png',
                  ),

                  // pay button
                  MyButton(
                    buttonText: 'Pay',
                    iconImagePath: 'lib/icon/card-payment.png',
                  ),

                  // bill button
                  MyButton(
                    buttonText: 'Bill',
                    iconImagePath: 'lib/icon/bill.png',
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 40,
            ),
            // column -> stats + transactions
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  MyListTile(
                    iconImagePath: 'lib/icon/analysis.png',
                    tileTitle: 'Statistics',
                    tileSubTitle: 'Payments and Income',
                  ),
                  MyListTile(
                    iconImagePath: 'lib/icon/atm-card.png',
                    tileTitle: 'Transactions',
                    tileSubTitle: 'Transaction History',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
