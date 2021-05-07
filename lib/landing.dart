import 'package:farmerchoice/product.dart';
import 'package:farmerchoice/upload_post.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({Key key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  String postOrientation = 'list';
  List<Map> products = [
    {
      'image': 'assets/wheat.jpg',
      'price': '80',
      'product': 'Wheat',
      'quantity': '120'
    },
    {
      'image': 'assets/potato.jpg',
      'price': '80',
      'product': 'Potato',
      'quantity': '120'
    },
    {
      'image': 'assets/tomato.jpg',
      'price': '80',
      'product': 'Tomato',
      'quantity': '120'
    },
    {
      'image': 'assets/apple.jpg',
      'price': '80',
      'product': 'Apple',
      'quantity': '120'
    },
    {
      'image': 'assets/orange.jpg',
      'price': '80',
      'product': 'Orange',
      'quantity': '120'
    },
    {
      'image': 'assets/banana.jpg',
      'price': '80',
      'product': 'Banana',
      'quantity': '120'
    },
    {
      'image': 'assets/watermelon.jpg',
      'price': '80',
      'product': 'Watermelon',
      'quantity': '120'
    },
  ];

  setPostOrientation(String postOrientation) {
    setState(() {
      this.postOrientation = postOrientation;
    });
  }

  buildTogglePostOrientation(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffDEF9EF),
        borderRadius: BorderRadius.circular(
          50.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: IconButton(
              onPressed: () => setPostOrientation("list"),
              icon: Icon(Icons.list),
              color:
                  postOrientation == 'list' ? Color(0xff26c485) : Colors.grey,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: IconButton(
              onPressed: () => setPostOrientation("grid"),
              icon: Icon(Icons.grid_on),
              color:
                  postOrientation == 'grid' ? Color(0xff26c485) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          splashColor: Color(0xffDEF9EF),
          backgroundColor: Color(0xffffba49),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return UploadPost();
                },
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(
              10.0,
            ),
            child: Icon(
              Icons.add,
            ),
          ),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          color: Color(0xffF3FFFA),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  boxShadow: kElevationToShadow[4],
                ),
                padding: EdgeInsets.fromLTRB(
                  8.0,
                  10.0,
                  8.0,
                  8.0,
                ),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff26C485)),
                        shape: MaterialStateProperty.all(
                          CircleBorder(),
                        ),
                      ),
                    ),
                    Text(
                      'Shop',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              buildTogglePostOrientation(size),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: postOrientation == 'list'
                    ? ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (_, index) => FoodListTile(
                          key: ValueKey(index),
                          size: size,
                          productImageAsset: products[index]['image'],
                          product: products[index]['product'],
                          quantity: products[index]['quantity'],
                          pricePerKg: products[index]['price'],
                        ),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.all(
                          8.0,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 225,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0),
                        itemCount: products.length,
                        itemBuilder: (_, index) => FoodGridTile(
                          key: ValueKey(index),
                          size: size,
                          productImageAsset: products[index]['image'],
                          product: products[index]['product'],
                          quantity: products[index]['quantity'],
                          pricePerKg: products[index]['price'],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodListTile extends StatelessWidget {
  const FoodListTile({
    Key key,
    @required this.size,
    this.productImageAsset,
    this.pricePerKg,
    this.product,
    this.quantity,
  }) : super(key: key);

  final Size size;
  final productImageAsset;
  final product;
  final quantity;
  final pricePerKg;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Product(
              productImageAsset,
              price: pricePerKg,
              quantity: quantity,
              product: product,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
        elevation: 5,
        child: Container(
          height: 125,
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: (size.width - 40) / 3,
                    height: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          15.0,
                        ),
                        topLeft: Radius.circular(
                          15.0,
                        ),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          productImageAsset,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                        width: (size.width - 40) * 2 / 3 * 0.5,
                        height: 125,
                        color: Colors.white,
                        padding: EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                              ),
                              child: Text(
                                '$product',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                              ),
                              child: Text(
                                'Quantity',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color(0xff26C485),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                              ),
                              child: Text(
                                '$quantity',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'tonne(s)',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 125,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            ),
                          ),
                          padding: EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8.0,
                                ),
                                child: Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8.0,
                                ),
                                child: Text(
                                  'Price',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color(0xff26C485),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8.0,
                                ),
                                child: Text(
                                  '₹ $pricePerKg',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                'per kg',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
              Positioned(
                right: 12.0,
                top: 8.0,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        8.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff26C485),
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: Text(
                        'Buy',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(
                        8.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff26C485),
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: Text(
                        'Sell',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodGridTile extends StatelessWidget {
  const FoodGridTile({
    Key key,
    @required this.size,
    this.productImageAsset,
    this.pricePerKg,
    this.product,
    this.quantity,
  }) : super(key: key);

  final Size size;
  final productImageAsset;
  final product;
  final quantity;
  final pricePerKg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Product(
              productImageAsset,
              price: pricePerKg,
              quantity: quantity,
              product: product,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
        elevation: 5,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        productImageAsset,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$product',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Quantity',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff26C485),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              '$quantity',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'tonne(s)',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff26C485),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              '₹ $pricePerKg',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'per kg',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              right: 12.0,
              top: 8.0,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(
                      8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff26C485),
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Text(
                      'Buy',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff26C485),
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Text(
                      'Sell',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
