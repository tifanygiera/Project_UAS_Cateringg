import 'package:flutter/material.dart';
import 'package:Project_UAS_Cateringg/data/catering_data.dart';
import 'package:Project_UAS_Cateringg/screens/detail_screen.dart';
import 'package:Project_UAS_Cateringg/screens/favorite_screen.dart';
import 'package:Project_UAS_Cateringg/screens/home_screen.dart';
import 'package:Project_UAS_Cateringg/screens/profil_screens.dart';
import 'package:Project_UAS_Cateringg/screens/search_screen.dart';
import 'package:Project_UAS_Cateringg/screens/signIn_screen.dart';
import 'package:Project_UAS_Cateringg/screens/signUp_screen.dart';


void main() {
  runApp(const MyApp());
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State createState() => _MainScreenState();

}

class _MainScreenState extends State {
// TODO: 1. Deklarasikan variable
  int _currentIndex = 0;
  final List _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfilScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// TODO: 2. Buat properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
// TODO: 3. Buat properti bottomNavigationBar dengan nilai Theme
      bottomNavigationBar: Theme(data: Theme.of(context).copyWith(
          canvasColor: Colors.pinkAccent[50]),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.pinkAccent,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.pinkAccent,),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.pinkAccent,),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.pinkAccent,),
              label: 'Person',
            ),
          ],
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.pinkAccent[100],
          showUnselectedLabels: true,
        ),),
// TODO: 4. Buat data dan child dari Theme

    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Catering',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.pinkAccent),
              titleTextStyle: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
          ),
          colorScheme:
          ColorScheme.fromSeed(seedColor: Colors.pinkAccent).copyWith(
            primary: Colors.pinkAccent,
            surface: Colors.pinkAccent[50],
          ),
          useMaterial3: true,
        ),
        //home: SignUpScreen()
      //home: SignInScreen()
      //home: SearchScreen(),
      //home: ProfilScreen(),
      home: HomeScreen(),
      //home: FavoriteScreen(),
      //home: DetailScreen(catering: catringList[6]),
    );
  }
}