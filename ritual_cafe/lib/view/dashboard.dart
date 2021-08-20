import 'package:flutter/material.dart';
import 'package:ritual_cafe/themes/color.dart';

import 'detail_screen.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  static var screenHeight;
  static var screenWidth;

  //BottomNavBarWidget
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOption = <Widget>[
    DashBoard(),
    Text(
      "Page2",
      style: optionStyle,
    ),
    Text(
      "Page3",
      style: optionStyle,
    ),
    Text(
      "Page4",
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildCoffeeCategory({categoryName, isSelected}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Text(
            categoryName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Color(0xffd17842) : Color(0xff52555a),
            ),
          ),
          isSelected
              ? Text(
                  '⬤',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffd17842),
                  ),
                )
              : Text(""),
        ],
      ),
    );
  }

  Widget buildSingleItem({
    images,
    title,
    subTitle,
    price,
    context,
    rating,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailScreen()));
      },
      child: Container(
        width: screenWidth * 0.4 + 10,
        height: screenHeight * 0.3,
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xff17191f),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                          spreadRadius: 1.0,
                          color: Color(0xff30221f),
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(images),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                          color: Color(0xffaeaeae),
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "$price ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  " F.CFA",
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Color(0xffd17842)),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffd17842),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    _widgetOption.elementAt(_selectedIndex);
    return Scaffold(
      backgroundColor: Color(0xff0c0f14),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff141921),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(
                        Icons.grid_view_rounded,
                        color: Color(0xff4d4f52),
                        size: 20,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Ritual Café",
                        style: TextStyle(
                            color: Palette.primaryColor,
                            fontFamily: 'Poppins',
                            fontSize: 28,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color(0xff141921),
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage("assets/images/profile.jpg"),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Consommez le meilleur",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "café du Cameroun",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xff52555a),
                      ),
                      hintText: "Trouvez votre plaisir",
                      hintStyle: TextStyle(
                        color: Color(0xff52555a),
                      ),
                      fillColor: Color(0xff141921),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildCoffeeCategory(
                      categoryName: "Cappuccino",
                      isSelected: true,
                    ),
                    buildCoffeeCategory(
                      categoryName: "Espresso",
                      isSelected: false,
                    ),
                    buildCoffeeCategory(
                      categoryName: "Late",
                      isSelected: false,
                    ),
                    buildCoffeeCategory(
                      categoryName: "Ristretto",
                      isSelected: false,
                    ),
                    buildCoffeeCategory(
                      categoryName: "Dopio",
                      isSelected: false,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildSingleItem(
                      context: context,
                      images: "assets/images/coffee1.jpeg",
                      title: "Cappuccino",
                      subTitle: "Avec du lait de chèvre",
                      price: 800,
                    ),
                    buildSingleItem(
                      context: context,
                      images: "assets/images/coffee2.jpeg",
                      title: "Cappuccino",
                      subTitle: "Avec du Chocolat",
                      price: 1.200,
                    ),
                    buildSingleItem(
                      context: context,
                      images: "assets/images/coffee1.jpeg",
                      title: "Expresso",
                      subTitle: "Avec du lait de chèvre",
                      price: 500,
                    ),
                    buildSingleItem(
                      images: "assets/images/coffee2.jpeg",
                      title: "Expresso",
                      subTitle: "Avec du lait de chèvre",
                      price: 1.000,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ListTile(
                  leading: Text(
                    "Spécialement pour vous",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.0),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: screenHeight * 0.2 - 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff171b22),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  color: Color(0xff30221f),
                                ),
                              ],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "images/coffee2.jpeg",
                                ),
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "3 recettes de café que vous\n devez absolument essayer",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "En savoir plus",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Icon(Icons.arrow_forward_outlined,
                                        size: 30, color: Color(0xffd17842)),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Color(0xff0c0f14),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
                size: 30,
              ),
              label: "Business",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              label: "Notifications",
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Color(0xff4e5053),
          selectedItemColor: Color(0xffd17842),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
