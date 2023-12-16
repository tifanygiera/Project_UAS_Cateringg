import 'package:flutter/material.dart';
import 'package:Project_UAS_Cateringg/data/catering_data.dart';
import 'package:Project_UAS_Cateringg/models/catering.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TODO : 1. Deklarasikan variabel yang dibutuhkan
  List<Catering> _filteredCatering = catringList;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : 2. Buat appBar dengal judul pencarian catering
      appBar: AppBar(title: Text('Pencarian Menu'),),
      // TODO : 3. Buat body berupa column
      body: Column(
        children: [
          // TODO : 4. Buat Textfield pencarian sebagai anak dari column
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.pinkAccent[50],
              ),
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Cari Menu...',
                  prefixIcon: Icon(Icons.search),
                  border : InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color : Colors.pinkAccent),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12),
                ),
              ),
            ),
          ),
          // TODO : 5. Buat listview hasil pencarian sebagai anak dari column
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCatering.length,
              itemBuilder: (context, index){
                final catering = _filteredCatering[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding : EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                            borderRadius : BorderRadius.circular(10),
                            child: Image.asset(catering.imageAsset, fit: BoxFit.cover,)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(catering.name, style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height : 4),
                          Text(catering.harga),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),


    );
  }
}