## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement
Navigator.push untuk menambahkan route baru ke stack navigasi 
Navigator.pushReplacement untuk mengganti route yang ada di stack navigasi dengan route baru

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya
Container: widget untuk menampung widget lainnya
Column: widget untuk menampung widget lainnya vertically
ListTile: menampung teks sebagai leading dan trailing
Drawer: widget untuk membuat drawer di sisi kiri layar 

## Sebutkan jenis-jenis event yang ada pada Flutter
onTap: event yang terjadi saat widget di tap
onPressed: event yang terjadi saat widget di tekan    
onChanged: event yang terjadi saat widget diubah
onSaved: event yang terjadi saat widget disimpan

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter
Dengan mengatur stack of route dan juga menyediakan dua cara untuk mengatur stack of route, declarative dan imperative. Declarative menggunakan Navigator.pages, sedangkan imperative mengunakan Navigator.push dan Navigator.pop

## Implementasi Checklist
1. Membuat file menu, input_budget, show_budget, list dan menambahkan drawer di main.
2. Membuat form dengan input String judul, int nominal, String tipeBudget dan tanggal.
3. Membuat class budget di input_budget
4. Membuat list yang akan diisi object budget untuk menyimpan data2 budget
5. Menampilan data dari list di show_budget

