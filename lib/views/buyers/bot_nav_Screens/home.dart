import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multivendorapp/ui_helper/functions.dart';
import 'package:multivendorapp/ui_helper/widgets/app_name.dart';
import 'package:multivendorapp/ui_helper/widgets/home_categoy_stream.dart';
import 'package:multivendorapp/ui_helper/widgets/product_stream.dart';
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
              child: StreamBuilder(
                  stream: homeController.getBanners(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  // BoxShadow(
                                  //     color: Colors.grey.withOpacity(0.5),
                                  //     spreadRadius: 2,
                                  //     blurRadius: 5,
                                  //     offset: const Offset(
                                  //         0, 3) // changes position of shadow
                                  //     ),
                                ],
                              ),
                              child: Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width - 20,
                                decoration: BoxDecoration(
                                  // color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Image.network(
                                    snapshot.data![index].banner_image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            setHorizontalHeight15(),
                          ],
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    );
                  }),
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
            home_category_stream(context),
            // setVerticalHeight15(),
            const Text(
              'Products',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            setVerticalHeight15(),
            ProductStream(),
          ],
        ),
      ),
    );
  }
}
