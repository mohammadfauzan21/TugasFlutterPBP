import 'package:flutter/material.dart';
// Impor drawer widget
import 'package:inventori/widgets/left_drawer.dart';
import 'package:inventori/screens/inventori_form.dart';
import 'package:inventori/screens/list_product.dart';
import 'package:inventori/screens/product_list.dart';
import 'package:inventori/models/product.dart';

class ListCard extends StatelessWidget {
  final Product item;

  const ListCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          // Navigate ke route yang sesuai (tergantung jenis tombol)
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailProduct(item.pk),
              ));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.visibility_off,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.fields.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
