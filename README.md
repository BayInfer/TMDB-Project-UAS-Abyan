# VORFILM

Berikut Merupakan Project UAS Teori/Praktikum Mobile Abyan Makarim

## Deskripsi
Aplikasi VORFILM merupakan aplikasi infomarsi Film berbasis Flutter, user dapat mendapakatkan informasi Film terbaru lewat aplikasi ini baik dalam hal Film yang akan segera rilis, Film dengan rating terbaik, dan film yang sedang tayang di bioskop. User juga dapat melihat detail informasi tiap film


## Builder
![Screenshot 2024-12-01 141724](https://github.com/user-attachments/assets/9e41e014-5701-43f9-b4a6-3ed4ac7f3538)
Dalam Pembuatannya Aplikasi ini berisi 3 hal penting yaitu Component, Model, Pages, dan Provider untuk penjelasan tiap bagiannya akan dijelaskan dibawah

### Component
Component berisi kodingan tiap widget yang ada pada halaman pada aplikasi ini, saya memisahkan Komponen tiap kategori sehingga terdapat 3 File yaitu Discover sebagai Komponen yang berisi Film yang akan segera rilis, Top Rated sebagai komponen yang berisi film dengan rating tertinggi sepanjang masssa, dan now playing sebagai komponen yang berisi Film yang sedang tayang di bioskop

### Models
Models berisi model tiap film, Untuk Model terdapat 2 bagian yaitu Model Film sebagai model untuk tiap widget film biasa, kemudian Model_Detail_Film sebagai model untuk menunjukkan detail pada film. 2 bagian ini dipisahkan karena pada Detail Film Variabel dan data yang ditampikkan lebih banyak

### Provider
Provider berfungsu untuk Fetching Data Ke Api, terdapat 4 Bagian yaitu 3 Bagian untuk tiap komponen (Film yang akan segera rilis (Discover), Film dengan rating tertinggi (Top Rated), dan Film yang sedang tayang (Now Plating) , dan 1 bagian terakhir untuk Detail Film 




## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
