// ignore_for_file: prefer_const_constructors

import 'package:apiproject1demo/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<ProductDataModel>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Image(
                              image: NetworkImage(
                                  items[index].productImg.toString()),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                        items[index].productName.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                          items[index].productBrand.toString()),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].quantity.toString()),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].createdAt.toString()),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      child:
                                      Text(items[index].updatedAt.toString()),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
  Future<List<ProductDataModel>> ReadJsonData() async {
    final response = await http.get(Uri.parse('https://api.sakkhar.com/api/product'));
    if (response.statusCode == 200) {
      List responseList = json.decode(response.body);
      return responseList
          .map((data) => ProductDataModel.fromJson(data))
          .toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }

    //http.Response response=await http.get("https://api.sakkhar.com/api/product");
//    final jsondata =
//        await rootBundle.rootBundle.loadString('jsonfile/productlist.json');

//    final list = json.decode(response.body) as List<dynamic>;
//
//    return list.map((e) {
//      return ProductDataModel.fromJson(e);
//    }).toList();
  }
}
