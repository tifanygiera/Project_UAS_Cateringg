import 'package:flutter/material.dart';
import 'package:project_uas_ketering/data/catering_data.dart';
import 'package:project_uas_ketering/widgets/item_card.dart';

import '../models/catering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : 1. Buat appBar dengan judul wisata candi
      appBar: AppBar(title: Text('Catering'),),
      // TODO : 2. Body dengan gridview.builder
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
          ),
          padding: EdgeInsets.all(8.0),
          itemCount: catringList.length,
          // TODO : 3. Buat Itemcard sebagai return dari gridview.builder
          itemBuilder: (context, index){
            Catering candi = catringList[index];
            return ItemCard(catering:candi);
          }),

    );
  }
}
