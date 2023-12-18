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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catering',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => MainScreen());
          case '/home':
            return MaterialPageRoute(builder: (context) => HomeScreen());
          case '/sign_up':
            return MaterialPageRoute(builder: (context) => SignUpScreen());
          case '/sign_in':
            return MaterialPageRoute(builder: (context) => SignInScreen());
          case '/search':
            return MaterialPageRoute(builder: (context) => SearchScreen());
          case '/detail':
            return MaterialPageRoute(
                builder: (context) =>  DetailScreen(catering: catringList[0]));
          default:
            return null;
        }
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.pinkAccent[50],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.pinkAccent),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.pinkAccent),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.pinkAccent),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.pinkAccent),
              label: 'Person',
            ),
          ],
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.pinkAccent[100],
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}

// Kelas layar lainnya di sini

// Tambahkan kelas layar lainnya di sini
