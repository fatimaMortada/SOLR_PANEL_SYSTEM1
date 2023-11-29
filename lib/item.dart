import 'package:flutter/material.dart';

class Item {
  final String _name;
  final double _price;
  bool _selected = false; // determines if an item is selected from the menu
  final String _image; // holds image url

  Item(this._name, this._price, this._image);

  // getters and setters
  String get name => _name;
  double get price => _price;
  bool get selected => _selected;
  String get image => _image;
  set selected(bool e) => _selected = e;

  // item description is displayed in the ListView
  @override
  String toString() {
    String space = ''; // loop computes spaces between price and name
    for (int i = 0; i < 5 - _price.toString().length; i++) {
      space += ' ';

    }
    return 'Price: \$$_price $space$_name';
  }
}

// list of items, used to populate ListView
List<Item> items = [
  Item('panel_Longi_545w', 163.50,
      "https://wakedelectric.com/cdn/shop/products/Y1-SOL545W_1_grande.jpg?v=1645876394"),
  Item('inverter_Grovolt_3.6kw', 400.0,
      "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRP1KKfLGmMoEhHxn4UAolP8-fprKZLgvVbFRulyiyo9hf-mM4j"),
  Item("inverter-Grovolt-8,2kw", 1350,
      'https://grovolt.com/wp-content/uploads/GI-R48-8.2KW-1080x675.jpg'),
  Item("inverter-Grovolt-6,2kw", 680,
      'https://lazenecommerce.com/wp-content/uploads/2022/10/invertor1.webp'),
  Item('batterie_Voltstar_200AH', 200,
      "https://www.deepakbatteries.com/images/vs6500tt.png"),
  Item('disjoncteur', 30 ,
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThVix96gqekKhSA9LZRklWTOJZu3ZUYnTEG4U7oBwqOj-rZ6H5hKp2sSK49rwB3bz5zic&usqp=CAU"),
  Item('cable_pv', 60 ,
      "https://amercable.nexans.com/.imaging/mte/nexans-theme/820x820/dam/nexans-amercable/Type-PV_Side.jpg0/jcr:content/Type%20PV_Side.jpg"),
  Item('cache_cable', 20 ,
      "https://azzi-electric.com/azzi-electric/uploaded/item/Azzi-Electric20180528104340.jpg"),
  Item('protected', 10 ,
      "https://www.voltiat.com/wp-content/uploads/2021/03/%D8%AC%D9%87%D8%A7%D8%B2-%D8%AD%D9%85%D8%A7%D9%8A%D8%A9-%D8%A7%D9%84%D8%A3%D8%AC%D9%87%D8%B2%D8%A9-%D8%A7%D9%84%D9%85%D9%86%D8%B2%D9%84%D9%8A%D8%A9-780x470.jpg"),
];




class ShowSelectedItems extends StatelessWidget {
  const ShowSelectedItems({required this.width, Key? key}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    List<Item> selectedItems = [];
    for (var e in items) {
      if (e.selected) {
        selectedItems.add(e);
      }
    }
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: selectedItems.length,
      itemBuilder: (context, index) {
        return Column(children: [
          const SizedBox(height: 10),
          SizedBox(width: width * 0.1),
          Text(selectedItems[index].toString(), style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          // get image from url stored in Item image field
          Image.network(selectedItems[index].image,
              height: width * 0.2),
          const SizedBox(height: 10),
        ]);
      },
    );
  }
}