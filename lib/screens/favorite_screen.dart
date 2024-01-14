import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Project_UAS_Cateringg/data/catering_data.dart';
import 'package:Project_UAS_Cateringg/models/catering.dart';
import 'detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> favorite = [];

  GlobalKey<AnimatedListState> listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _loadFavoriteStatus = prefs.getStringList('favorite') ?? [];
    setState(() {
      favorite = _loadFavoriteStatus;
    });
  }

  void _navigateToDetailScreen(String cateringName) {

    Catering catering = catringList.firstWhere((catering) => catering.name == cateringName);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(catering: catering),
      ),
    );
  }

  void removeCateringFromList(String cateringName) {
    int index = favorite.indexOf(cateringName);
    if (index != -1) {
      setState(() {
        favorite.removeAt(index);
        listKey.currentState?.removeItem(
          index,
              (context, animation) => buildItem(context, index, animation),
        );
      });
    }
  }

  Widget buildItem(BuildContext context, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(favorite[index]),
        // Other ListTile properties
      ),
    );
  }

  Widget _buildCateringCard(String cateringName) {
    Catering catering = catringList.firstWhere((catering) => catering.name == cateringName);

    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        title: Text(catering.name),
        subtitle: Text(catering.harga),
        onTap: () {
          // Navigate to DetailScreen when tapped
          _navigateToDetailScreen(cateringName);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favorite.length,
        itemBuilder: (context, index) {
          return _buildCateringCard(favorite[index]);
        },
      ),
    );
  }
}

