import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multivendorapp/view_controllers/home_controller.dart';
import 'package:provider/provider.dart';

class ProductStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Provider.of<HomeController>(context);
    return SizedBox(
      // height: MediaQuery.of(context).size.height,
      child: StreamBuilder(
          stream: homeController.getProducsts(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const CircularProgressIndicator();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Material(
                  child: GestureDetector(
                    onDoubleTap: () {
                      homeController.navigateToDetailScreen(
                          snapshot.data![index], context);
                    },
                    child: Container(
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
                                fit: BoxFit.fill,
                                imageUrl: snapshot.data![index].image,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        const SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              // Placeholder color
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                snapshot.data![index].name,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Text(
                              '\$${snapshot.data![index].price.toString()}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
