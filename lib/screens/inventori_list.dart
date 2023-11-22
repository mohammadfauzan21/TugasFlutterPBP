import 'package:flutter/material.dart';
import 'package:inventori/widgets/left_drawer.dart';
import 'package:inventori/models/items.dart';

class InventoriListPage extends StatelessWidget {
  const InventoriListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Item'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        primary: true,
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        itemCount: Item.listitems.length,
        itemBuilder: (context, index) {
          Item item = Item.listitems[index];
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Detail Item'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nama: ${item.itemname}'),
                          Text('Jumlah Item: ${item.amount}'),
                          Text('Deskripsi: ${item.description}'),
                          Text('Price: ${item.price}'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Tutup'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.indigo),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama: ${item.itemname}'),
                    Text('Jumlah: ${item.amount}'),
                    Text('Deskripsi: ${item.description}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
