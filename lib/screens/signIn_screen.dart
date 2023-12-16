import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen ({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen> {
  // TODO : 1. Deklarasi Variabel
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignedIn = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // TODO : 2. Pasang Appbar
      appBar: AppBar(title: Text('Sign In'),),
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
                // TODO : 5. Pasang TextFormField Nama Pengguna
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
                      _passwordController.value.text.contains(_usernameController.value.text)
                      ){
                        _errorText = 'Password harus berisi nama pengguna anda';
                      } else {
                        _errorText = '';
                      }

                    },
                    child: Text('Sign In')),
                // TODO : 8. Pasang TextButton Sign Up
                SizedBox(height: 10),
                TextButton(
                    onPressed: (){},
                    child: Text('Belum punya akun? Daftar di sini.')),
                RichText(
                    text: TextSpan(
                        text: 'Belum punya akun?',
                        style: TextStyle(fontSize: 16, color: Colors.pinkAccent),
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