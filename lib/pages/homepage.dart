import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<ProductWidget> productList = [
  ProductWidget(
      name: "Boston Lettuce",
      image: "images/1.jpg",
      price: '1.10',
      quantity: 'piece'),
  ProductWidget(
      name: "Purple Cauliflower",
      image: "images/2.jpg",
      price: '1.85',
      quantity: 'kg'),
  ProductWidget(
      name: "Savoy Cabbage ",
      image: "images/3.jpg",
      price: '1.45',
      quantity: 'kg'),
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[30],
        body: Column(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          iconSize: 16,
                          color: Colors.black,
                          onPressed: () {}),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 10, 0),
                  child: Text(
                    "Vegatables",
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, 1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Search"),
                        ),
                      )),
                ),

                // This is for chips
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Wrap(
                      spacing: 6.0,
                      runSpacing: 2.0,
                      children: <Widget>[
                        ChipWidget(
                          chipName: 'Cabbage and lettuce(14)',
                        ),
                        ChipWidget(
                          chipName: 'Cucumbers and tomatoes(6)',
                        ),
                        ChipWidget(
                          chipName: 'Onions and garlic(8)',
                        ),
                        ChipWidget(
                          chipName: 'Peppers(7)',
                        ),
                        ChipWidget(
                          chipName: 'Potatoes and carrot',
                        ),
                      ],
                    ),
                  ),
                ),

                ProductWidget()
              ],
            )
          ],
        ),

        //This is for bottom navigation bar
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 10,
          selectedItemColor: Theme.of(context).primaryColorDark,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.dashboard),
                highlightColor: Colors.deepPurpleAccent,
              ),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
              ),
              title: Text("Cart"),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.person),
              ),
              title: Text("profile"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductWidget extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final String quantity;

  ProductWidget(
      {@required this.name,
      @required this.image,
      @required this.price,
      @required this.quantity});

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: productList.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Image.asset(productList[index].image),
                    height: 150,
                    width: 120,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        productList[index].name,
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Row(
                        children: <Widget>[
                          Text(productList[index].price,
                              style: TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              )),
                          Text(
                            "€/",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            productList[index].quantity,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            color: Colors.white10,
                            child: IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: null),
                          ),
                          FlatButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            color: Colors.lightGreen,
                            child: IconButton(
                                icon: Icon(
                                  Icons.shopping_cart,
                                ),
                                color: Colors.white,
                                onPressed: null),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
            );
          }),
    );
  }
}

class ChipWidget extends StatefulWidget {
  final String chipName;

  ChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  _ChipWidgetState createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 10.0,
      ),
      selected: _isSelected,
      backgroundColor: Color(0xffededed),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Color(0xffedfff),
    );
  }
}
