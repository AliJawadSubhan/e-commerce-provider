import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multivendorapp/ui_helper/functions.dart';
import 'package:multivendorapp/view_controllers/home_controller.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppMainText(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'How are you today? ❤️',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  child: FaIcon(FontAwesomeIcons.shoppingCart),
                )
              ],
            ),
            setVerticalHeight15(),
            SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            setVerticalHeight15(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 170,
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text('E-commerce App \n banner'),
                      ),
                    ),
                  ),
                  setHorizontalHeight15(),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text('E-commerce App \n banner'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            setVerticalHeight15(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'see all',
                ),
              ],
            ),
            SizedBox(
                height: 70,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        Provider.of<HomeController>(context).cateogories.length,
                    itemBuilder: (c, i) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        height: 50,
                        width: 100,
                        color: Colors.blueGrey,
                        child: Center(
                          child: Text(Provider.of<HomeController>(context)
                              .cateogories[i]),
                        ),
                      );
                    })),
            setVerticalHeight15(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Products',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'see all',
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    height: 2000, // Adjust the height as needed
                    color: Colors.indigo[50],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 120, // Adjust the height as needed
                            width: double.infinity,
                            color: Colors.grey[300], // Placeholder color
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 8.0),
                          child: Text(
                            '\$19.99',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
