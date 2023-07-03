import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multivendorapp/view_controllers/home_controller.dart';
import 'package:provider/provider.dart';

SizedBox home_category_stream(context) {
  var homeController = Provider.of<HomeController>(context);

  return SizedBox(
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
                    CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: snapshot.data![i].image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => const SizedBox(
                        height: 50,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Text(
                      snapshot.data![i].category.toString(),
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
