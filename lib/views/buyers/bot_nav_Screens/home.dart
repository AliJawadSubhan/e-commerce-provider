import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multivendorapp/ui_helper/functions.dart';
import 'package:multivendorapp/ui_helper/widgets/app_name.dart';
import 'package:multivendorapp/view_controllers/home_controller.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppMainText(
              fontsize: 20,
            ),
            setVerticalHeight15(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 170,
              child: ListView(
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
                      child: const Center(
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
                          offset:
                              const Offset(0, 3), // changes position of shadow
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
                      child: const Center(
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
              height: 150,
              child: StreamBuilder(
                  stream: homeController.getCategoriesFiresotre(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.data == null) {
                      return const CircularProgressIndicator();
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (c, i) {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            height: 75,
                            width: 100,
                            // color: Colors.blueGrey,
                            child: Center(
                              child: Column(
                                // alignment: Alignment.center,
                                children: [
                                  Image.network(
                                    snapshot.data![i].image,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  Text(
                                    snapshot.data![i].category.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            ),
            // setVerticalHeight15(),
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
              child: StreamBuilder(
                  stream: homeController.getProducsts(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    return SizedBox(
                      height: MediaQuery.of(context)
                          .size
                          .height, // Adjust the height as needed

                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            // Adjust the height as needed
                            color: Colors.indigo[50],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    height: 120, // Adjust the height as needed
                                    width: double.infinity,
                                    color: Colors.grey[300],
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data![index].image,
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          SizedBox(
                                              height: 50,
                                              child: Center(
                                                  child:
                                                      const CircularProgressIndicator())),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
// Placeholder color
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data![index].name,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
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
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
