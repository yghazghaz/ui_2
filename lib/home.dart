import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_2/model.dart';
import 'package:ui_2/widget.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> banner = [
    "assets/images/banner/Slider 1.png",
    "assets/images/banner/Slider 2.png",
    "assets/images/banner/Slider 3.png",
  ];

  List<CategoryModel> category = [
    CategoryModel(
      image: "assets/images/category/beverages.png",
      name: "beverages",
    ),
    CategoryModel(image: "assets/images/category/fruits.png", name: "fruits"),
    CategoryModel(image: "assets/images/category/milk.png", name: "milk & egg"),
    CategoryModel(
      image: "assets/images/category/vegetables.png",
      name: "vegetables",
    ),
    CategoryModel(image: "assets/images/category/laundry.png", name: "lundry"),
  ];

  List<ProductModel> products = [
    ProductModel(
      image: "assets/images/fruits/banana.png",
      name: "banana",
      prics: "\$3.39",
      rate: "4.8",
      countRate: "287",
    ),
    ProductModel(
      image: "assets/images/fruits/orange.png",
      name: "orange",
      prics: "\$3.39",
      rate: "4.8",
      countRate: "287",
    ),
    ProductModel(
      image: "assets/images/fruits/papper.png",
      name: "Paper",
      prics: "\$3.39",
      rate: "4.8",
      countRate: "287",
    ),
    ProductModel(
      image: "assets/images/fruits/prsiel.png",
      name: "persiel",
      prics: "\$3.39",
      rate: "4.8",
      countRate: "287",
    ),
  ];

  List<ProductModel> basketList = [];
  int countBasket = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset("assets/images/icons/delivery.svg"),
            SizedBox(width: 10),
            Text(
              "61 Hopper street..",
              style: TextStyle(fontSize: 16, fontWeight: .w500),
            ),
            SizedBox(width: 10),
            Icon(Icons.keyboard_arrow_down_outlined),
            Spacer(),
            SvgPicture.asset("assets/images/icons/basket.svg"),
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: banner.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.asset(banner[itemIndex]),
            options: CarouselOptions(
              height: 220,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(category.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: .circle,
                          color: Color(0xffF6F6F6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(category[index].image),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(category[index].name),
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "Fruits",
                  style: TextStyle(fontSize: 16, fontWeight: .w600),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    color: Color(0xff0CA201),
                    fontSize: 14,
                    fontWeight: .w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(products.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomCard(
                    onTapdelete: () {
                      countBasket -= products[index].count;
                      products[index].count = 0;

                      basketList.remove(products[index]);
                      setState(() {});
                    },
                    countRate: products[index].countRate,
                    image: products[index].image,
                    name: products[index].name,
                    prics: products[index].prics,
                    rate: products[index].rate,
                    onTap: () {
                      if (products[index].count == 0) {
                        basketList.add(products[index]);
                        products[index].count++;
                        print(products[index].count);
                      } else {
                        products[index].count++;
                        print(products[index].count);
                      }
                      countBasket++;
                      setState(() {});
                    },
                    count: products[index].count,
                  ),
                );
              }),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xff0CA201),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 180,
                    child: ListView.builder(
                      itemCount: basketList.length,
                      scrollDirection: .horizontal,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 4.0,
                                top: 13,
                              ),
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.asset(basketList[index].image),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                width: 15,
                                height: 15,
                                child: Center(
                                  child: Text(
                                    "${basketList[index].count}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: .w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(width: 1, height: 50, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "View Basket",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: .w600,
                    ),
                  ),
                  SizedBox(width: 10),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/images/icons/basket.svg",
                          color: Colors.white,
                        ),
                      ),

                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          width: 15,
                          height: 15,
                          child: Center(
                            child: Text(
                              "$countBasket",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: .w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
