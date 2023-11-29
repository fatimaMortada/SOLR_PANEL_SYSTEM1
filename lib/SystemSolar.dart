import 'package:flutter/material.dart';
import 'item.dart';
class SystemSolar extends StatefulWidget {
  const SystemSolar({super.key});
  @override
  _SystemSolarState createState() => _SystemSolarState();
}

// ignore: unused_element
class _SystemSolarState extends State<SystemSolar> {
  double _sum = 0; // holds the total price for selected items
  bool _showSelected = false;
  List<int> quantities = List<int>.filled(items.length, 0);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.green[200],
  appBar: AppBar(
    backgroundColor: Colors.green,
  title: Text('Total Price: \$$_sum'),
  centerTitle: true,
  actions: [
  Tooltip(
  message: 'Reset selection',
  child: IconButton(
  onPressed: () {
  setState(() {
  _sum = 0;
  quantities = List<int>.filled(items.length, 0);
  for (var e in items) {
  e.selected = false;
  }
  _showSelected = false;
  });
  },
  icon: const Icon(
  Icons.restore,
  ),
  ),
  ),
  Tooltip(
  message: 'Show/Hide Selected Items',
  child: IconButton(
  onPressed: () {
  if (_sum != 0) {
  setState(() {
  _showSelected = !_showSelected;
  });
  }
  },
  icon: const Icon(
  Icons.shopping_cart_checkout,
  ),
  ),
  ),
  Tooltip(
  message: 'Calculate Total',
  child: IconButton(
  onPressed: () {
  calculateTotal();
  List<Item> selectedItems =
  items.where((item) => item.selected).toList();
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => TotalPage(
  selectedItems: selectedItems,
  quantities: quantities,
  totalSum: _sum,
  ),
  ),
  );
  },
  icon: const Icon(
  Icons.calculate,
  ),
  ),
  ),
  ],
  ),
  body: _showSelected
  ? ShowSelectedItems()
      : Container(
  width: double.infinity,
  child: ListView.builder(
  shrinkWrap: true,
  itemCount: items.length,
  itemBuilder: (context, index) {
  return Column(
  children: [
  Row(
  children: [
  Checkbox(
  value: items[index].selected,
  onChanged: (e) {
  items[index].selected = e as bool;
  if (items[index].selected) {
  _sum += items[index].price;
  } else {
  _sum -= items[index].price;
  }
  setState(() {});
  },
  ),
  Text(items[index].toString()),
  NumericUpDown(
  value: quantities[index],
  onChanged: (value) {
  quantities[index] = value;
  calculateTotal();
  },
  ),
  ],
  ),
  Image.network(items[index].image),
  ],
  );
  },
  ),
  ),
  );
  }

  void calculateTotal() {
  _sum = 0;
  for (int i = 0; i < items.length; i++) {
  if (items[i].selected) {
  _sum += items[i].price * quantities[i];
  }
  }
  setState(() {});
  }
  }

  class ShowSelectedItems extends StatelessWidget {
  const ShowSelectedItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  // Implement the UI for showing selected items here
  return Container(
  child: Text('Selected Items'),
  );
  }
  }

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
  appBar: AppBar(
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
  SizedBox(height: 20),
  Text(
  '${selectedItems[index].toString()} x${quantities[index]}',
  style: TextStyle(
  fontSize: 20,
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
  color: Colors.blue,
  child: Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text(
  'Subtotal: \$ ${totalSum.toStringAsFixed(2)}',
  style: TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  ),
  ),
  ],
  ),
  ),
  );
  }
  }

  class NumericUpDown extends StatefulWidget {
  final int value;
  final ValueChanged<int> onChanged;

  const NumericUpDown({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  _NumericUpDownState createState() => _NumericUpDownState();
  }

  class _NumericUpDownState extends State<NumericUpDown> {
  late int _value;

  @override
  void initState() {
  super.initState();
  _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
  return Row(
  children: [
  IconButton(
  onPressed: () {
  setState(() {
  if (_value > 0) {
  _value--;
  widget.onChanged(_value);
  }
  });
  },
  icon: Icon(Icons.remove),
  ),
  Text(_value.toString()),
  IconButton(
  onPressed: () {
  setState(() {
  _value++;
  widget.onChanged(_value);
  });
  },
  icon: Icon(Icons.add),
  ),
  ],
  );
  }
  }
