import 'package:flutter/material.dart';
import 'item.dart';

class TotalPage extends StatelessWidget {
  final List<Item> selectedItems;
  final List<int> quantities;
  final double totalSum;

  const TotalPage({
    Key? key,
    required this.selectedItems,
    required this.quantities,
    required this.totalSum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Total Page'),
      ),
      body: selectedItems.isEmpty
          ? Center(
        child: Text('No items selected.'),
      )
          : ListView.builder(
        itemCount: selectedItems.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 10),
              Text(
                '${selectedItems[index].toString()} x${quantities[index]}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Image.network(
                selectedItems[index].image,
              ),
              SizedBox(height: 10),
              Divider(),
            ],
          );
        },
      ),
      bottomNavigationBar: selectedItems.isEmpty
          ? null
          : Container(
        padding: EdgeInsets.all(16),
        color: Colors.green[200],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subtotal: \$ ${totalSum.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}