import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multivendorapp/ui_helper/functions.dart';
import 'package:multivendorapp/view_controllers/search_controller.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProviderController>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'How are you today? ❤️',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                child: FaIcon(FontAwesomeIcons.magnifyingGlass),
              )
            ],
          ),
          setVerticalHeight15(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset:
                      const Offset(0, 2), // changes the position of the shadow
                ),
              ],
            ),
            child: TextField(
              // controller: searchProvider.searchKeyword,
              onChanged: (val) {
                searchProvider.onChang(val);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8.0),
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          setVerticalHeight15(),
          setVerticalHeight15(),
          setVerticalHeight15(),
          StreamBuilder(
            stream: searchProvider.getProductByNameFromProvider(),
            builder: (context, snapshot) {
              log(snapshot.data.toString());
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: snapshot.data![index].image!,
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
                            ),
                            setHorizontalHeight15(width: 8.0),
                            // const  ,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].name.toString(),
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    snapshot.data![index].category.toString(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  setVerticalHeight15(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Price: \$${snapshot.data![index].price.toString()}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // catProvider.navigateToDetailScreen(
                                          //     snapshot.data![index], context);
                                        },
                                        child: const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    snapshot.data![index].description
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const Divider(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
