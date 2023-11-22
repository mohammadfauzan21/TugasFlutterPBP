import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inventori/models/product.dart';
import 'package:inventori/widgets/left_drawer.dart';

class DetailProduct extends StatefulWidget {
  final int id;
  const DetailProduct(this.id, {Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState(id);
}

class _ProductPageState extends State<DetailProduct> {
  final int id;
  _ProductPageState(this.id);
  Future<List<Product>> fetchProduct() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse('http://localhost:8000/json/$id/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Product> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Product.fromJson(d));
      }
    }
    return list_product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Item'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data produk.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name : ${snapshot.data![index].fields.name}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                    "Amount : ${snapshot.data![index].fields.amount}"),
                                const SizedBox(height: 10),
                                Text(
                                    "Description : ${snapshot.data![index].fields.description}"),
                                Text(
                                    "Price : ${snapshot.data![index].fields.price}"),
                                ListTile(
                                  leading: const Icon(Icons.backspace),
                                  title: const Text('Kembali'),
                                  onTap: () {
                                    // Route menu ke halaman produk
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}
