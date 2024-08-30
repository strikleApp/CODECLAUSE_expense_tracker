import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    return 'Please enter a valid password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _email,
                        password: _password,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        _showSnackBar('User not found');
                      } else if (e.code == 'wrong-password') {
                        _showSnackBar('Wrong password');
                      } else if (e.code == 'invalid-email') {
                        _showSnackBar('Invalid email');
                      } else {
                        _showSnackBar('There was an error!');
                      }
                    } on FirebaseException catch (_) {
                      _showSnackBar('There was an error!');
                    } catch (e) {
                      _showSnackBar('There was an error!');
                    }
                  }
                },
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: _email,
                        password: _password,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        _showSnackBar('Weak password');
                      } else if (e.code == 'email-already-in-use') {
                        _showSnackBar('Email already in use');
                      } else if (e.code == 'invalid-email') {
                        _showSnackBar('Invalid email');
                      } else {
                        _showSnackBar('There was an error!');
                      }
                    } on FirebaseException catch (_) {
                      _showSnackBar('There was an error!');
                    } catch (e) {
                      _showSnackBar('There was an error!');
                    }
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
