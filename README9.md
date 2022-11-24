# Assignment 9: Web Service Integration in Flutter

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Hal tersebut mungkin untuk dilakukan yang mana kita membuat dynamic map dari JSON dan mengakses nilainya seperti dictionary dengan python ('data[key]'). Hal tersebut tidak disarankan dikarenakan ada kemungkinan fields yang hilang atau field yang tidak digunakan maupun diharapkan sehingga ada kemungkinan sulitnya dalam pengelolaan dan timbulnya kesalahan. Akan tetapi, hal itu tidak lebih baik daripada membuat model terlebih dahulu.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- ListTile: Berfungsi menampung teks sebagai leading dan trailing dalam bentuk row
- Checkbox: berfungsi untuk membuat checkbox
- TextButton: berfungsi untuk membuat button
- FutureBuilder: berfungsi untuk menampilkan data yang diambil dari API

##  Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
Fungsi fetchWatchlist() mengambil data menggunakan HTTP dan pemanggilan fungsi get dengan instance HTTP.  Fungsi mengembalikan daftar objek 'Mywatchlist'. Pemanggilan fungsi dan penungguan respon oleh FutureBuilder dan ketika pengambilan data telah dilakukan FutureBuilder' mengembalikan 'ListView.builder' yang membangun 'ListTiles' yang mana berisi data yang dipetakan dengan didapatkan dari fungsi 'fetchWatchlist'


## Implementation
1. Buat 'mywatchlist.dart' dan buat kelas 'Mywatchlist'.
2. Buat 'fetch.dart' dan buat fungsi seperti ini untuk mengambil data dari API.
   ```dart
   // fetch.dart
	Future<List<Mywatchlist>> fetchWatchlist() async {
		var url = Uri.parse('https://mocki.io/v1/9c50014e-7061-4f35-9852-d50a9a640dc6');
		var response = await http.get(
				url,
				headers: {
					"Access-Control-Allow-Origin": "*",
					"Content-Type": "application/json",
			},
		);

		// decode response menjadi bentuk json
		var data = jsonDecode(utf8.decode(response.bodyBytes));

		// konversi data json menjadi object MyWatchlist
		List<Mywatchlist> listMyWatchlist = [];

		for (var d in data) {
			if (d != null) {
				listMyWatchlist.add(Mywatchlist.fromJson(d));
			}
		}

		return listMyWatchlist;
	}
	```
3. Buat 'watchlist.dart' dan buat 'MyWatchlistPage StatefulWidget' yang berisi 'FutureBuilder' yang berfungsi untuk pengambilan data menggunakan fungsi 'fetchWatchlist'.

4. Buat 'detail.dart' dan buat 'MyWatchlistDetailPage StatelessWidget' yang berfungsi untuk penampilan data yang akan diteruskan dari 'MyWatchlistPage'.

5. Penerusan data dari 'MyWatchlistPage' ke 'MyWatchlistDetailPage' menggunakan 'Navigator.push'.
    ```dart
	Navigator.push(
		context,
		MaterialPageRoute(
		  builder: (context) =>
			  MyWatchlistDetailPage(
			movie: snapshot.data![index],
		  ),
		));
	```
6. Buat widget 'CheckBox' dan fungsi 'onChanged' untuk Bonus.
    ```dart
	Checkbox(
		activeColor: Colors.limeAccent,
		checkColor: Colors.black,
		focusColor: Colors.lightGreenAccent,
		value: snapshot.data![index].fields.watched,
		onChanged: (bool? value) {
		  setState(() {
			snapshot.data![index].fields.watched =
				value!;
		  });
		},
	)
	```