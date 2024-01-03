import 'package:flutter/material.dart';
import 'package:Project_UAS_Cateringg/widgets/profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCateringCount = 0;

  void signIn(String username, String fullName, int favoriteCateringCount) {
    setState(() {
      isSignedIn = true;
      userName = username;
      this.fullName = fullName;
      this.favoriteCateringCount = favoriteCateringCount;
    });
    Navigator.pushNamed(context, '/signin');
  }

  void signOut() {
    setState(() {
      isSignedIn = false;
      userName = '';
      fullName = '';
      favoriteCateringCount = 0;
    });
    Navigator.pushNamed(context, '/signin');
  }

  void editFullName() {
    showDialog(
      context: context,
      builder: (context) {
        String editedName = fullName;
        return AlertDialog(
          title: const Text('Edit Nama'),
          content: TextField(
            onChanged: (value) {
              editedName = value;
            },
            controller: TextEditingController(text: fullName),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                setState(() {
                  fullName = editedName;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.pinkAccent,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.pinkAccent, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                            AssetImage('images/placeholder.jpg'),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.pinkAccent[50],
                            ),
                          ),
                        if (!isSignedIn) // Tambahkan kondisi jika pengguna tidak masuk
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(color: Colors.pinkAccent[100]),
                const SizedBox(height: 4),
                ProfileInfoItem(
                  icon: Icons.lock,
                  label: 'Pengguna',
                  value: userName,
                  iconColor: Colors.amber,
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.pinkAccent[100]),
                const SizedBox(height: 4),
                ProfileInfoItem(
                  icon: Icons.person,
                  label: 'Nama',
                  value: fullName,
                  showEditIcon: isSignedIn,
                  onEditPressed: editFullName,
                  iconColor: Colors.blue,
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.pinkAccent[100]),
                const SizedBox(height: 4),
                ProfileInfoItem(
                  icon: Icons.favorite,
                  label: 'Favorit',
                  value: favoriteCateringCount > 0 ? '$favoriteCateringCount' : '',
                  iconColor: Colors.red,
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.pinkAccent[100]),
                const SizedBox(height: 20),
                isSignedIn
                    ? TextButton(
                  onPressed: signOut,
                  child: const Text('Sign Out'),
                )
                    : TextButton(
                  onPressed: () {
                    signIn('agindanoorfadhillah', 'aginda noor fadhillah', 1); // Ganti dengan informasi sebenarnya saat implementasi otentikasi
                  },
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}