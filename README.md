Mohammad Fauzan Aditya
2206827831
PBP E

<h1>Tugas 8</h1>

<h3>1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut 
yang tepat!</h3>
<p>
Navigator.push() adalah metode untuk menambahkan layar baru ke stack navigasi di posisi paling atas. Pada tugas kali ini, saya menggunakan Navigator.push() di bagian 
left_drawer.dartdan menu.dart pada bagian ListTile dan container "Tambah Item". Ketika pengguna mengklik "Tambah Item", akan terjadi penambahan layar baru di bagian
paling atas stack navigasi. Sehingga tampilan yang akan muncul adalah tampilan untuk menambah item dan jumlah layer di dalam stack navigasi ada dua layar. Berikut
kodenya,

```
//left_drawer.dart
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
 
//menu.dart
// Navigate ke route yang sesuai (tergantung jenis tombol)
if (item.name == "Tambah Item") {
     Navigator.push(
        context,
        MaterialPageRoute(
             builder: (context) => InventoriFormPage(),
        )
     );
}
```
Sedangkan Navigator.pushReplacement() adalah metode untuk mengganti layar yang paling atas di stack navigasi menjadi layarnya. Pada tugas kali ini, saya menggunakan 
Navigator.pushReplacement() di bagian left_drawer.dart pada bagian ListTile "Halaman Utama". Ketika pengguna mengklik "Halaman Utama" di drawer, akan terjadi 
pergantian layar yang paling atas di stack navigasi menjadi layar untuk halaman utama. Sehingga tampilan yang akan muncul adalah tampilan untuk halaman utama dan 
jumlah layer di dalam stack navigasi tidak akan bertambah seperti pada Navigator.push(). Berikut kodenya,

```
//left_drawer.dart
ListTile(
    leading: const Icon(Icons.home_outlined),
    title: const Text('Halaman Utama'),
    // Bagian redirection ke MyHomePage
    onTap: () {
          Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                     builder: (context) => MyHomePage(),
                )
          );
    },
),
```
</p>

<h3>2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing</h3>
<p>
1. Container : Widget untuk membungkus elemen-elemen supaya dapat diubah dimensi, padding, margin, dan dekorasi widget turunannya
2. Center : Widget untuk memusatkan widget turunannya di dalam widget itu sendiri
3. Expanded : Widget untuk memperluas widget turunannya mengisi ruang yang tersedia
4. AspectRatio : Widget untuk mencoba menyesuaikan widget turunannya dengan tetap mempertahankan rasio aspek tertentu
5. Row : Widget untuk menyusun widget turunannya secara horizontal
6. Column : Widget untuk menyusun widget turunannya secara vertikal
7. Stack : Widget untuk menempatkan widget turunannya di atas satu sama lain
8. Wrap : Widget untuk menyusun widget turunannya secara horizontal atau vertikal dengan membungkusnya ke baris berikutnya jika perlu
9. Flow : Widget untuk mengatur widget turunannya dalam tata letak flow, yang mirip dengan wrap tetapi dengan kontrol lebih besar 
terhadap algoritme tata letak
</p>

<h3>3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!</h3>
<p>
Elemen input pada form yang saya pakai adalah TextFormField untuk input nama item, amount, dan deskripsi item. TextFormField ini saya pakai untuk menerima input string
untuk nama item dan deskripsi item dan konversi dari input string ke integer untuk amount. Selain itu, saya juga menggunakannya karena elemen input tersebut memberikan
kemudahan dalam melakukan validasi input. Tidak hanya itu, saya juga memakai elemen input EleveatedButton untuk validasi formulir sebelum menampilkan dialog berupa pop
up item 
</p>

<h3>4. Bagaimana penerapan clean architecture pada aplikasi Flutter?</h3>
<p>
Clean architecture pada aplikasi Flutter merupakan metode untuk memisahkan kode-kode menjadi suatu lapisan tertentu yang memiliki fungsinya masing-masing dan bersifat
independen. Di dalam flutter terdapat 3 lapisan utama, yaitu
1. Feature Layer
Berisikan UI, event handlers dari UI, dan widget. Dengan kata lain, pada bagian ini berfungsi untuk tampilan dari aplikasi dan tidak boleh mengandung logika bisnis
dan akses langsung ke data
2. Domain Layer
Berisikan entitas bisnis, logika bisnis, dan kontrak repositori. Pada bagian ini, logika bisnis sangat penting di tuliskan tanpa elemen flutter apapun karena tidak
mementingkan detail implementasi 
3. Data Layer
Berisikan implementasi repositori, pemanggilan API, dan akses ke data sources. Pada bagian ini, hal-hal yang bertujuan untuk mengakses data ataupun menuliskan data ke database
lokal diatur dan harus mengimplementasikan kontrak yang didefinisikan di lapisan domain.

Prinsip-prinsip Clean Architecture pada Flutter
1. Dependency Rule
   Domain layer tidak boleh bergantung pada feature dan data layer. Akan tetapi, feature dan data layer bergantung pada domain layer.
2. Model Entities
   Model yang ada di domain layer mencerminkan entitas bisnis secara umum. Sedangkan, model di feature dan data layer menunjukkan representasi 
   yang spesifik untuk keperluan antarmuka pengguna atau manipulasi data.
3. Kontrak (Interfaces)
   Kontrak (interface) untuk repositori, use case, dan lainnya didefinisikan di domain layer. Di sisi lain, data layer mengimplementasikan kontrak yang telah ditetapkan oleh domain layer.
4. Tata Letak dan Logika Tampilan
   Penataan logika dan tata letak terletak di dalam feature layer. Presenter/BLoC menghubungkan antara tampilan dan logika bisnis yang ada di dalam domain layer.
</p>

<h3>5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)</h3>
<p>
Checklist 1
Saya membuat folder baru bernama screens untuk menaruh file baru bernama inventori_form.dart. file baru tersebut berfungsi hanya khusus sebagai form input. 
Selain itu, saya juga meletakkan file menu.dart di dalam folder screens sebagai bagian dari pemisahan kode-kode. Pada inventori.dart, saya membuat variable baru untuk masing masing input 
di bagian class yang meng extends FormPage tersebut, berikut kodenya,

```
    class _InventoriFormPageState extends State<InventoriFormPage> {
        final _formKey = GlobalKey<FormState>();
        String _name = "";
        int _amount = 0;
        String _description = "";
        ...
    }
```
Untuk membuat sebuah tombol save, saya memakai elemen ElevatedButton, berikut kodenya,
```
child: ElevatedButton(
    style: ButtonStyle(
         backgroundColor:
               MaterialStateProperty.all(Colors.indigo),
    ),
    onPressed: () {
         if (_formKey.currentState!.validate()) {
               showDialog(
                     context: context,
                     builder: (context) {
                            return AlertDialog(
                                  title: const Text('Item berhasil tersimpan'),
                                  content: SingleChildScrollView(
                                        child: Column(
                                             crossAxisAlignment:
                                             CrossAxisAlignment.start,
                                             children: [
                                                  Text('Nama: $_name'),
                                                  Text('Amount : $_amount'),
                                                  Text('Description : $_description'),
                                             ],
                                        ),
                                  ),
                                  actions: [
                                        TextButton(
                                             child: const Text('OK'),
                                             onPressed: () {
                                                 Navigator.pop(context);
                                             },
                                        ),
                                  ],
                            );
                     },
               );
         };
         _formKey.currentState!.reset();
    },
    child: const Text(
         "Save",
         style: TextStyle(color: Colors.white),
    ),
),
```
Saya juga melakukan validasi atas input user yang masuk di form dengan mencocokkan apakah input sesuai dengan tipe data atribut modelnya dan input tersebut kosong atau tidak.
Berikut kodenya,
```
...
children: [
      Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Item Name",
                      labelText: "Item Name",
                      border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(5.0),
                      ),
                  ),
                  onChanged: (String? value) {
                      setState(() {
                           _name = value!;
                      });
                  },
                  validator: (String? value) {
                      if (value == null || value.isEmpty) {
                          return "Item tidak boleh kosong!";
                      }
                      return null;
                  },
            ),
      ),
      Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                  decoration: InputDecoration(
                       hintText: "Amount",
                       labelText: "Amount",
                       border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                       ),
                  ),
                  onChanged: (String? value) {
                       setState(() {
                           _amount = int.parse(value!);
                       });
                  },
                  validator: (String? value) {
                       if (value == null || value.isEmpty) {
                           return "Amount tidak boleh kosong!";
                       }
                       else if (int.tryParse(value) == null) {
                           return "Amount harus berupa angka!";
                       }
                       return null;
                  },
            ),
      ),
      Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                  decoration: InputDecoration(
                       hintText: "Description",
                       labelText: "Description",
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(5.0),
                       ),
                  ),
            onChanged: (String? value) {
                  setState(() {
                       _description = value!;
                  });
            },
            validator: (String? value) {
                  if (value == null || value.isEmpty) {
                       return "Description tidak boleh kosong!";
                  }
                  return null;
            },
      ),
      ....
],
...
```
Untuk mengarahkan ke pengguna menuju ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama, saya menggunakan Navigator.push.
Saya menggunakan Navigator.push supaya ketika user menekan Tambah Item, user dapat kembali dengan menekan tombol back pada handphonenya sehingga akan kembali
ke tampilan sebelum user menekan Tambah Item. Berikut kodenya yang terdapat di menu.dart,
```
...
if (item.name == "Tambah Item") {
      Navigator.push(
            context,
            MaterialPageRoute(
                  builder: (context) => InventoriFormPage(),
      ));
}
...
```
Setelah user menekan tombol save, akan ada pop-up yang berisi data yang telah diinput oleh user di dalam form. Untuk implementasinya ke dalam code sebagai
berikut yang terdapat di file inventori_form.dart,
```
if (_formKey.currentState!.validate()) {
      showDialog(
            context: context,
            builder: (context) {
                    return AlertDialog(
                           title: const Text('Item berhasil tersimpan'),
                           content: SingleChildScrollView(
                                 child: Column(
                                       crossAxisAlignment:
                                       CrossAxisAlignment.start,
                                       children: [
                                             Text('Nama: $_name'),
                                             Text('Amount : $_amount'),
                                             Text('Description : $_description'),
                                       ],
                                ),
                           ),
                           actions: [
                                 TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                            Navigator.pop(context);
                                      },
                                 ),
                           ],
                    );
            },
      );
};
```
Kemudian, untuk membuat drawer yang berisi opsi "Halaman Utama" dan "Tambah Item", saya membuat file baru bernama left_drawer.dart pada folder widgets yang telah saya
buat sebelumnya. Pada left_drawer.dart, selain saya membuat opsi "Halaman Utama" dan "Tambah Item", saya juga membuat route untuk ketika user memilih salah satu opsi
tersebut, maka akan ditampilkan tampilan yang seharusnya. Berikut kodenya,
```
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
```
</p>

==================================================================================================================================================================

<h1>Tugas 7</h1>

<h3>1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?</h3>
<p>Perbedaan utama dari stateless dan stateful widget terletak pada kondisi akhir dari suatu widget ketika dikenai events 
atau adanya perubahan data. Dari sisi stateless widget, saat ada events dari user atau perubahan data, maka tampilan widget tidak akan berubah karena
sifatnya yang statis. Sedangkan, dari sisi stateful widget, saat ada events dari user atau perubahan data, maka tampilan widget akan berubah karena
sifatnya yang dinamis. Perubahan data ini akan memicu sebuah state untuk melakukan re-render atau merender ulang widget menjadi sebuah state yang baru</p>

<h3>2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.</h3>
<p>
  <ul>
    <li>
      1. MaterialApp : Untuk mengatur konfigurasi aplikasi berbasis Material Design, seperti judul, theme yang digunakan pada aplikasi, dan widget yang akan 
menjadi halaman utama aplikasi
    </li>
    <li>
      2. ThemeData : Untuk pengatur/memanipulasi tema seluruh aplikasi yang sedang dibangun
    </li>
    <li>
      3. MyHomePage : Untuk menampilkan hommepage dari aplikasi
    </li>
    <li>
      4. Scaffold : Untuk menyediakan struktur dasar pada halaman beranda aplikasi
    </li>
    <li>
      5. AppBar : Sebagai 'Navbar' pada aplikasi yang memungkinkan untuk dipasang berbagai icon, text ataupun action lainnya
    </li>
    <li>
      6. Text : Widget yang menampilkan teks
    </li>
    <li>
      7. SingleChildScrollView : Untuk menyediakan ampilan yang dapat digulir untuk widget turunannya.
    </li>
    <li>
      8. Padding : Untuk menambahkan padding ke widget turunannya
    </li>
    <li>
      9. Column : Untuk menampilkan widget lainnya (turunannya) secara vertikal
    </li>
    <li>
      10. GridView.count : Untuk membantu tata letak dari widget turunanya
    </li>
    <li>
      11. ShopCard : Untuk menampilkan ikon dan teks dalam satu wadah
    </li>
    <li>
      12. Material : Untuk menyediakan desain visual dari sebuah container
    </li>
    <li>
      13. InkWell : Untuk menampilkan desain visual saat tersentuh / diberi events
    </li>
    <li>
      14. Icon : Widget yang menampilkan ikon
    </li>
    <li>
      15. Center : Widget yang memberi tata letak tengah pada widget turunanya
    </li>
    <li>
      16. Container : Widget untuk menyimpan berbagai properti yang diperlukan pada aplikasi
    </li>
    <li>
      17. SnackBar : Widget yang menampilkan pesan di bagian bawah layar
    </li>
    <li>
      18. ShopItem : Untuk merepresentasikan nama dan item toko
    </li>
  </ul>
</p>

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
</p>
