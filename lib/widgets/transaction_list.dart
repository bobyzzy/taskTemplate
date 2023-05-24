import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, required this.userTransaction});

  final List<Transaction> userTransaction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: userTransaction.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.indigo.shade900,
                    width: 2,
                  )),
                  child: Text(
                    "BYN ${userTransaction[index].amount}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.indigo.shade900,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userTransaction[index].title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat().format(userTransaction[index].date),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}




//children: userTransaction.map(
          //   (tx) {
          //     return Card(
          //       child: Row(
          //         children: [
          //           Container(
          //             margin: const EdgeInsets.symmetric(
          //               vertical: 10,
          //               horizontal: 15,
          //             ),
          //             padding: const EdgeInsets.all(10),
          //             decoration: BoxDecoration(
          //                 border: Border.all(
          //               color: Colors.indigo.shade900,
          //               width: 2,
          //             )),
          //             child: Text(
          //               "BYN ${tx.amount}",
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 20,
          //                 color: Colors.indigo.shade900,
          //               ),
          //             ),
          //           ),
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 tx.title,
          //                 style: const TextStyle(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //               Text(
          //                 DateFormat().format(tx.date),
          //                 style: const TextStyle(color: Colors.grey),
          //               ),
          //             ],
          //           )
          //         ],
          //       ),
          //     );
          //   },
          // ).toList()),