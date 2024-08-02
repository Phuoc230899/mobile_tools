import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  Widget _buidInitialLoginWidget() {
    return AutofillGroup(
        child: Column(
      children: [
        Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _usernameController,
                  autofillHints: const [AutofillHints.username],
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    filled: true,
                  ),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextFormField(
                  controller: _passwordController,
                  autofillHints: const [AutofillHints.newPassword],
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    filled: true,
                  ),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                FilledButton.icon(
                  onPressed: () {},
                  label: const Text('Login'),
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Don\'t have an account? Register'))
              ],
            ))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 70.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.h),
            ),
            SizedBox(
              height: 24.h,
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 48.h),
                decoration: BoxDecoration(
                  border: Border.all(),
                    color: Colors.transparent, borderRadius: BorderRadius.circular(24)),
                child: _buidInitialLoginWidget(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
