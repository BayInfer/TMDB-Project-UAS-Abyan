![Circle](https://github.com/user-attachments/assets/48acdb58-523d-4e1c-b685-33b0404ce0a1)

# VORFILM

Berikut Merupakan Project UAS Teori/Praktikum Mobile Abyan Makarim

## Deskripsi
Aplikasi VORFILM merupakan aplikasi infomarsi Film berbasis Flutter, user dapat mendapakatkan informasi Film terbaru lewat aplikasi ini baik dalam hal Film yang akan segera rilis, Film dengan rating terbaik, dan film yang sedang tayang di bioskop. User juga dapat melihat detail informasi tiap film


## Builder
![Screenshot 2024-12-01 141724](https://github.com/user-attachments/assets/9e41e014-5701-43f9-b4a6-3ed4ac7f3538)
-
Dalam Pembuatannya Aplikasi ini berisi 3 hal penting yaitu Component, Model, Pages, dan Provider untuk penjelasan tiap bagiannya akan dijelaskan dibawah

### Component
Component berisi kodingan tiap widget yang ada pada halaman pada aplikasi ini, saya memisahkan Komponen tiap kategori sehingga terdapat 3 File yaitu Discover sebagai Komponen yang berisi Film yang akan segera rilis, Top Rated sebagai komponen yang berisi film dengan rating tertinggi sepanjang masssa, dan now playing sebagai komponen yang berisi Film yang sedang tayang di bioskop

### Models
Models berisi model tiap film, Untuk Model terdapat 2 bagian yaitu Model Film sebagai model untuk tiap widget film biasa, kemudian Model_Detail_Film sebagai model untuk menunjukkan detail pada film. 2 bagian ini dipisahkan karena pada Detail Film Variabel dan data yang ditampikkan lebih banyak

### Pages
Pages berisi kodingan tiap halaman dan terdapat 3 bagian yaitu Halaman Utama (Page), Halaman List Film (Pagination), dan Halaman Detail (Detail_Page), kodingan Page hanya berisi kodingan page secara umum dan tidak untuk widget, kodingan widget berada di bagian component

### Provider
Provider berfungsu untuk Fetching Data Ke Api, terdapat 4 Bagian yaitu 3 Bagian untuk tiap komponen (Film yang akan segera rilis (Discover), Film dengan rating tertinggi (Top Rated), dan Film yang sedang tayang (Now Plating) , dan 1 bagian terakhir untuk Detail Film 

## User Interface
Berikut merupakan tampilan gambar Tiap Halaman

### Home
![Screenshot 2024-11-29 092436](https://github.com/user-attachments/assets/6f8d90f0-8b13-4739-ac4b-78d5fb40077f)

### Pagination / List Film

![Screenshot 2024-11-29 101204](https://github.com/user-attachments/assets/0d05fa2a-ace9-4773-8fe2-3110e0f245c5)

![Screenshot 2024-11-29 101308](https://github.com/user-attachments/assets/c8188307-e323-425e-9c54-c8f3854d9c1c)

![Screenshot 2024-11-29 101500](https://github.com/user-attachments/assets/43ad50e4-1e77-4eb2-a1ef-9f448151a756)

### Detail Film

![Screenshot 2024-11-29 102600](https://github.com/user-attachments/assets/ca319fc0-0838-46b1-b83f-537a3ef57c3d)

### Package yang digunakan
  cupertino_icons: ^1.0.8 // Icon
  flutter_native_splash: ^2.4.2 // Splash Screen
  dio: ^5.7.0 // Http
  provider: ^6.1.2 // Provider
  dartz: ^0.10.1 // Dartz
  carousel_slider: ^5.0.0 // Slider 
  infinite_scroll_pagination: ^4.1.0 // List Tak Terbatas
  get_it: ^8.0.2



