import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  // TODO : 1. Deklarasi Variabel
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();

  String _errorText = '';
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // TODO : 2. Pasang Appbar
      appBar: AppBar(title: Text('Sign Up'),),
      // TODO : 3. Pasang body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              // TODO : 4. Atur mainAxisAligment dan CrossAxisAligment
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _fullnameController,
                  decoration: InputDecoration(
                    labelText: "Nama Lengkap",
                    border: OutlineInputBorder(),
                  ),
                ),
                // TODO : 5. Pasang TextFormField Nama Pengguna
                SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Nama Pengguna",
                    border: OutlineInputBorder(),
                  ),
                ),
                // TODO : 6. Pasang TextFormField Kata Sandi
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Kata Sandi",
                    errorText: _errorText.isNotEmpty ? _errorText : null,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState((){
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
                // TODO : 7. Pasang ElevatedButton Sign In
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: (){
                      if(_passwordController.value.text.length < 8){
                        _errorText = "Password harus lebih dari atau sama dengan 8 karakter";
                      } else if(!_passwordController.value.text.contains(RegExp(r'[A-z]'))){
                        _errorText = 'Password harus berisi uppercase';
                      }else if(!_passwordController.value.text.contains(RegExp(r'[a-z]'))){
                        _errorText = 'Password harus berisi lowercase';
                      }else if(!_passwordController.value.text.contains(RegExp(r'[0-9]'))){
                        _errorText = 'Password harus berisi angka';
                      }else if(!_passwordController.value.text.contains(RegExp(r'[/*.,]'))){
                        _errorText = 'Password harus berisi karakter spesial (/*.,)';
                      }else if(
                      _passwordController.value.text.contains(_fullnameController.value.text) ||
                          _passwordController.value.text.contains(_usernameController.value.text)
                      ){
                        _errorText = 'Password harus berisi nama atau nama pengguna anda';
                      } else {
                        _errorText = '';
                      }

                    },
                    child: Text('Sign Up')),
                // TODO : 8. Pasang TextButton Sign Up
                SizedBox(height: 10),
                RichText(
                    text: TextSpan(
                        text: 'Belum punya akun?',
                        style: TextStyle(fontSize: 16, color: Colors.pinkAccent
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Daftar di sini.',
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontSize: 16
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {},
                          )
                        ]
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}