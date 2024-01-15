import 'package:flutter/material.dart';
import 'package:Project_UAS_Cateringg/screens/signIn_screen.dart';
import 'package:Project_UAS_Cateringg/widgets/profile_info_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCateringCount = 0;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera, // Ganti dengan ImageSource.gallery jika ingin memilih dari galeri
    );

    if (image != null) {
      // Lakukan sesuatu dengan gambar yang dipilih, misalnya menyimpannya atau menampilkan di UI
      // Tambahkan logika sesuai kebutuhan
    }
  }

  @override
  void initState() {
    super.initState();
    // Mengambil dan menetapkan data pengguna saat layar pertama kali diinisialisasi
    retrieveUserData();
  }

  void retrieveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Periksa apakah pengguna sudah masuk
    bool signedIn = prefs.getBool('isSignedIn') ?? false;

    setState(() {
      isSignedIn = signedIn;
    });

    if (signedIn) {
      // Mengambil dan mendekripsi data pengguna
      String encryptedFullName = prefs.getString('fullname') ?? '';
      String encryptedUserName = prefs.getString('username') ?? '';

      String keyString = prefs.getString('key') ?? '';
      String ivString = prefs.getString('iv') ?? '';

      encrypt.Key key = encrypt.Key.fromBase64(keyString);
      encrypt.IV iv = encrypt.IV.fromBase64(ivString);

      encrypt.Encrypter encrypter = encrypt.Encrypter(encrypt.AES(key));

      // Mendekripsi dan menetapkan data pengguna
      String decryptedFullName = encrypter.decrypt64(encryptedFullName, iv: iv);
      String decryptedUserName = encrypter.decrypt64(encryptedUserName, iv: iv);

      setState(() {
        fullName = decryptedFullName;
        userName = decryptedUserName;
      });
      
      List<String>? favoriteCateringNames =
          prefs.getStringList('favoriteCateringNames') ?? [];
      
      setState(() {
        favoriteCateringCount = favoriteCateringNames.length;
      });
    }
  }

  void signIn() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  void signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Menghapus data pengguna saat keluar
    prefs.clear();
    setState(() {
      isSignedIn = false;
      fullName = '';
      userName = '';
      favoriteCateringCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200, width: double.infinity, color: Colors.pinkAccent,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // TODO: 2. Buat bagian ProfileHeader yang berisi gambar profil
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if(isSignedIn)
                          IconButton(
                            onPressed: _pickImage,
                            icon: Icon(Icons.camera_alt, color: Colors.pinkAccent[50],),),
                      ],
                    ),
                  ),
                ),
                // TODO: 3. Buat bagian ProfileInfo yang berisi info profil
                const SizedBox(height: 20),
                Divider(color: Colors.pinkAccent[100]),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(Icons.lock, color: Colors.amber),
                          SizedBox(width: 8),
                          Text('Pengguna', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),),
                    Expanded(
                      child: Text(': $userName', style: const TextStyle(
                          fontSize: 18),),),
                  ],
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.pinkAccent[100]),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(Icons.person, color: Colors.pinkAccent),
                          SizedBox(width: 8),
                          Text('Nama', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),),
                    Expanded(
                      child: Text(': $fullName', style: const TextStyle(
                          fontSize: 18),),),
                    if(isSignedIn) const Icon(Icons.edit),
                  ],
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.pinkAccent[100]),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Favorit', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),),
                    Expanded(
                      child: favoriteCateringCount > 0
                          ? Text(': $favoriteCateringCount', style: const TextStyle(fontSize: 18),)
                          : const Text(':', style: TextStyle(fontSize: 18),),),
                  ],
                ),
                // TODO: 4. Buat ProfileActions yang berisi TextButton sign in/out
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 20),
                isSignedIn ? TextButton(
                    onPressed: signOut,
                    child: const Text('Sign Out'))
                    : TextButton(
                    onPressed: signIn,
                    child: const Text('Sign In')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
     