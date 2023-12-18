import 'package:Project_UAS_Cateringg/models/catering.dart';
import 'package:flutter/material.dart';

import 'package:Project_UAS_Cateringg/data/catering_data.dart';


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key});

  // Buat daftar untuk menyimpan item favorit
  static List<Catering> favoriteList = [];

  // Metode untuk menambahkan item favorit
  static void addFavorite(Catering catering) {
    favoriteList.add(catering);
    // Perbarui tampilan ketika item favorit ditambahkan
    if (onListUpdated != null) {
      onListUpdated!();
    }
  }

  // Metode untuk menghapus item favorit
  static void removeFavorite(Catering catering) {
    favoriteList.remove(catering);
    // Perbarui tampilan ketika item favorit dihapus
    if (onListUpdated != null) {
      onListUpdated!();
    }
  }

  // Callback untuk memperbarui tampilan
  static void Function()? onListUpdated;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    // Dapatkan daftar wisata yang sudah difavoritkan
    List<Catering> favoriteMenu = FavoriteScreen.favoriteList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Zoo'),
      ),
      body: favoriteMenu.isEmpty
          ? Center(
        child: Text(
          'Belum ada wisata yang difavoritkan.',
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        itemCount: favoriteMenu.length,
        itemBuilder: (context, index) {
          final zoo = favoriteMenu[index];
          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(zoo.imageAsset),
              ),

            ),
          );
        },
      ),
    );
  }
}