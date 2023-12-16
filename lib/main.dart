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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Catering',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.pinkAccent),
          titleTextStyle: TextStyle(
            color: Colors.pinkAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent).copyWith(
          primary: Colors.pinkAccent,
          surface: Colors.pinkAccent[50],
        ),
        useMaterial3: true,
      ),
     home : ProfilScreen(),
      //home: DetailScreen(catering:catringList[0]),
      //home: SignInScreen(),
       //home : SearchScreen(),
    );
  }
}
// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   // TODO : 1. Deklerasikan variabel
//   int _currentIndex = 0;
//   final List<Widget> _children = [
//     HomeScreen(),
//     SearchScreen(),
//     FavoriteScreen(),
//     ProfilScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // TODO : 2. Buat Properti body berupa widget yang ditampilkan
//       body: _children[_currentIndex],
//       // TODO : 3. Buat properti bottomNavigationBar dengan nilai theme
//       bottomNavigationBar: Theme(
//         data: Theme.of(context).copyWith(
//             canvasColor: Colors.deepPurple[50]
//         ),
//         child: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home, color: Colors.deepPurple,),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search, color: Colors.deepPurple,),
//               label: 'Search',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite, color: Colors.deepPurple,),
//               label: 'Favorite',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person, color: Colors.deepPurple,),
//               label: 'Profile',
//             ),
//           ],
//           onTap: (index){
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//           selectedItemColor: Colors.deepPurple,
//           unselectedItemColor: Colors.deepPurple[100],
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//         ),
//       ),
//       // TODO : 4. Buat data dan child dari theme
//     );
//
//   }
// }
//
// // class ScreenArguments {
// //   final String title;
// //   final String message;
// //
// //   ScreenArguments(this.title, this.message);
// // }
//
