import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Project_UAS_Cateringg/data/catering_data.dart';
import 'package:Project_UAS_Cateringg/models/catering.dart';
import 'package:Project_UAS_Cateringg/widgets/item_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FavoriteScreen(),
    );
  }
}

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key});
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Catering> favoriteCaterings = [];

  @override
  void initState() {
    super.initState();
    loadFavoriteCaterings();
  }

  Future<void> loadFavoriteCaterings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? favoriteCateringNames =
        prefs.getStringList('favoriteCateringNames') ?? [];

    // Menyimpan kembali daftar favorit yang sudah diupdate
    prefs.setStringList('favoriteCateringNames', favoriteCateringNames);

    List<Catering> favorites = catringList
        .where((catering) => favoriteCateringNames.contains(catering.name))
        .toList();

    setState(() {
      favoriteCaterings = favorites;
    });
  }

  Future<void> _removeFromFavorites(Catering catering) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? favoriteCateringNames =
        prefs.getStringList('favoriteCateringNames') ?? [];

    favoriteCateringNames.remove(catering.name);

    prefs.setStringList('favoriteCateringNames', favoriteCateringNames);

    await loadFavoriteCaterings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catering Favorit'),
      ),
      body: favoriteCaterings.isEmpty
          ? Center(
        child: Text('Tidak ada Menu Catering favorit.'),
      )
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        padding: EdgeInsets.all(8.0),
        itemCount: favoriteCaterings.length,
        itemBuilder: (context, index) {
          Catering catering = favoriteCaterings[index];
          return GestureDetector(
            onTap: () {
            },
            onLongPress: () {
              _removeFromFavorites(catering);
            },
            child: ItemCard(catering: catering),
          );
        },
      ),
    );
  }
}