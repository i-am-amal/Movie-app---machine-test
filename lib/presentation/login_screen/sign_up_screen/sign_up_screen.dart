import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_machine_test/domain/model/db_model.dart';
import 'package:movie_app_machine_test/presentation/login_screen/login_screen/login_screen.dart';
import 'package:movie_app_machine_test/presentation/widgets/custom_textformfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  String _profession = 'Student';

  final List<String> _professions = [
    "Student",
    "Developer",
    "Designer",
    "Manager",
    "Doctor",
    "Teacher",
    "Other"
  ];

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
                  'Sign up',
                  style: TextStyle(fontSize: 25),
                )),
                const SizedBox(height: 30),
                CustomTextFormField(
                    controller: _nameController,
                    labelText: 'Name',
                    errorText: 'Please enter your name'),
                CustomTextFormField(
                  controller: _passwordController,
                  labelText: 'Password',
                  errorText: 'Please enter your password',
                  obscureText: true,
                ),
                CustomTextFormField(
                    controller: _emailController,
                    labelText: 'Email',
                    errorText: 'Please enter your email'),
                CustomTextFormField(
                    controller: _phoneNumberController,
                    labelText: 'Phone Number',
                    errorText: 'Please nter your phone Number'),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _profession,
                  onChanged: (String? newValue) {
                    setState(() {
                      _profession = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Profession',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        width: 1.0,
                      ),
                    ),
                  ),
                  items: _professions.map((String profession) {
                    return DropdownMenuItem<String>(
                      value: profession,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 8.0),
                        child: Text(profession),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _signup(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.teal),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    elevation: WidgetStateProperty.all<double>(4.0),
                  ),
                  child: const Text(
                    'Create Account',
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

  void _signup(context) async {
    if (_formKey.currentState!.validate()) {
      final user = User(
        name: _nameController.text,
        password: _passwordController.text,
        email: _emailController.text,
        phoneNumber: _phoneNumberController.text,
        profession: _profession,
      );

      final box = Hive.box<User>('usersBox');
      await box.put(user.name, user);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account Created please Login..')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }
}
