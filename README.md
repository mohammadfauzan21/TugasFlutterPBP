Mohammad Fauzan Aditya
2206827831
PBP E

<h1>Tugas 7</h1>

<h3>1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?</h3>
<p>Perbedaan utama dari stateless dan stateful widget terletak pada kondisi akhir dari suatu widget ketika dikenai events 
atau adanya perubahan data. Dari sisi stateless widget, saat ada events dari user atau perubahan data, maka tampilan widget tidak akan berubah karena
sifatnya yang statis. Sedangkan, dari sisi stateful widget, saat ada events dari user atau perubahan data, maka tampilan widget akan berubah karena
sifatnya yang dinamis. Perubahan data ini akan memicu sebuah state untuk melakukan re-render atau merender ulang widget menjadi sebuah state yang baru</p>>

<h3>2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.</h3>
<p>
1. MaterialApp : Untuk mengatur konfigurasi aplikasi berbasis Material Design, seperti judul, theme yang digunakan pada aplikasi, dan widget yang akan 
menjadi halaman utama aplikasi
2. ThemeData : Untuk pengatur/memanipulasi tema seluruh aplikasi yang sedang dibangun
3. MyHomePage : Untuk menampilkan hommepage dari aplikasi
4. Scaffold : Untuk menyediakan struktur dasar pada halaman beranda aplikasi
5. AppBar : Sebagai 'Navbar' pada aplikasi yang memungkinkan untuk dipasang berbagai icon, text ataupun action lainnya
6. Text : Widget yang menampilkan teks
7. SingleChildScrollView : Untuk menyediakan ampilan yang dapat digulir untuk widget turunannya.
8. Padding : Untuk menambahkan padding ke widget turunannya
9. Column : Untuk menampilkan widget lainnya (turunannya) secara vertikal
10. GridView.count : Untuk membantu tata letak dari widget turunanya
11. ShopCard : Untuk menampilkan ikon dan teks dalam satu wadah
12. Material : Untuk menyediakan desain visual dari sebuah container
13. InkWell : Untuk menampilkan desain visual saat tersentuh / diberi events
14. Icon : Widget yang menampilkan ikon
15. Center : Widget yang memberi tata letak tengah pada widget turunanya
16. Container : Widget untuk menyimpan berbagai properti yang diperlukan pada aplikasi
17. SnackBar : Widget yang menampilkan pesan di bagian bawah layar
18. ShopItem : Untuk merepresentasikan nama dan item toko
</p>>

<h3>3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)</h3>
<p>
Pertama-tama saya mengenerate proyek flutter baru dengan nama inventori dan masuk ke path inventori melalui perintah berikut
```
flutter create inventori
cd inventori
```
Kemudian saya mencoba menjalankan proyek tersebut di chrome untuk mengeceknya melalui perintah
```flutter run```, ```flutter config --enable-web```, dan ```flutter run -d chrome```. 
Kemudian, saya membuat menu.dart yang diisi oleh ```import 'package:flutter/material.dart';``` dan kode dari main.dart dari baris ke 39 hingga akhir. Karena
kode di main.dart sudah dipindahkan ke menu.dart, maka saya harus mengimportnya dari menu ke main melalui ```import 'package:shopping_list/menu.dart';``` yang saya
taruh di bagian atas file main.dart. Saya juga mengubah tema aplikasi saya menjadi indigo di bagian Material Color pada main.dart dan mengubah ```MyHomePage(title: 'Flutter Demo Home Page')```
menjadi ```MyHomePage()```. 

Untuk menampilkan tiga tombol, yaitu Lihat Item, Tambah Item, dan Logout dan snackbar, pertama-tama saya mengubah class MyHomePage menjadi 
```
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.indigo),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.deepPurple),
    ShopItem("Logout", Icons.logout, Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Fauzan Store',
          style: TextStyle(
            color: Colors.white, // Ganti warna teks judul
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Welcome', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
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
```
dan menambahkan class untuk memberikan tipe dari item yang akan ada di aplikasi melalui kode berikut di bagian bawah class MyHomePage
```
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}
```
Selain itu, karena di MyHomePage kita memanggil ShopCard, maka kita perlu membuat class ShopCard yang merupakan widget stateless untuk menampilkan card
melalui kode berikut
```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
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
```
</p>>
