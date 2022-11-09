# counter_7

##  Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless widget adalah properti yang bersifat statis, konfigurasi yang dimuat didalamnya telah diinisiasi sejak awal. Hanya dapat berubah ketika kita mengatur instance baru untuk widget tertentu. 

Stateful widget propertis adalah properti yang bersifat dinamis, artinya properti dapat diperbaharui kapanpun dibutuhkan berdasarkan user actions atau ketika terjadinya perubahan data selama runtime. 

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

Scaffold = Berfungsi sebagai layout utama dari aplikasi
Appbar = Berperan sebagai header aplikasi
Center = Berfungsi sebagai layout yang membuat child widget berada di tengah-tengah
Text = Digunakan untuk menampilkan teks ganjil, genap, dan angka counter
Visibility = Digunakan untuk mengatur visibilitas widget, tombol decrement jika counter=0 tidak ditunjukkan
FloatingActionButton = Berfungsi untuk menambahkan tombol yang dapat di klik, tombol increment dan decrement
Padding = Memberikan jarak antar widget

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut
Untuk memberitahukan framework Flutter bahwa sesuatu telah berubah di State ini, nantinya akan dilakukan kembali proses build.

## Jelaskan perbedaan antara const dengan final
Cons adalah nilai yang tidak dapat diubah saat runtime namun bisa diubah saat compile time, inisiasi dilakukan saat compile time dan sudah diassign saat runtime.

Final adalah nilai yang tidak dapat diubah sama sekali, inisiasinya dilakukan saat runtime dan hanya dapat diassign sekali saja

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas
1. Menambahkan fungsi _decrementCounter() di _MyHomePageState yang fungsinya mengurangi int counter. (line 64)
2. Menambahkan Method Text untuk mewarnai text dengan warna merah jika angka counter angka genap dan biru jika angka counter angka ganjil. (line 109) 
3.Memodifikasi bagian FloatingActionButton membuat sebuah tombol increment dan decrement, saat tombol dipencet akan memanggil fungsi sesuai dengan tujuan tombol. (line 122)
4. (Bonus) Mengatur visibility tombol decrement dengan melihat int counter. Jika int counter = 0 akan dijadikan invinsible tombolnya


