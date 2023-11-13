import 'package:flutter/material.dart';
import 'package:inventori/screens/menu.dart';
import 'package:inventori/screens/inventori_form.dart';
import 'package:inventori/screens/inventori_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(
                children: [
                  Text(
                    'Inventori List',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("Catat seluruh inventori stok produk di sini!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal, // Weight biasa
                    ),
                  ),
                ],
              )
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Lihat Item'),
            // Bagian redirection ke InventoriFormPage
            onTap: () {
              // Routing ke InventoriFormPage,
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InventoriListPage(),
                  )
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke InventoriFormPage
            onTap: () {
              // Routing ke InventoriFormPage,
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InventoriFormPage(),
                  )
              );
            },
          ),
        ],
      ),
    );
  }
}