import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_machine_test/domain/model/db_model.dart';
import 'package:movie_app_machine_test/presentation/home_screen/home_screen.dart';
import 'package:movie_app_machine_test/presentation/login_screen/sign_up_screen/sign_up_screen.dart';
import 'package:movie_app_machine_test/presentation/widgets/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                const Center(
                    child: Text(
                  'Login',
                  style: TextStyle(fontSize: 25),
                )),
                const SizedBox(height: 50),
                CustomTextFormField(
                    controller: _nameController,
                    labelText: 'Name',
                    errorText: 'Please enter your name'),
                CustomTextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    labelText: 'Password',
                    errorText: 'Please enter your password'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.teal),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 44.0),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    elevation: WidgetStateProperty.all<double>(4.0),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                    foregroundColor: WidgetStateProperty.all<Color>(
                        Colors.black), // Text color
                  ),
                  child: const Text(
                    "Don't have an account? Create Account",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      final box = Hive.box<User>('usersBox');
      final user = box.get(_nameController.text);

      if (user != null && user.password == _passwordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Successfull')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid Credentials')),
        );
      }
    }
  }
}
