import 'package:flutter/material.dart';
import 'package:inputdecoration_theme/validator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter app'),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              TextFormField(
                controller: _nameController,
                validator: Validator.validateName,
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                controller: _passwordController,
                validator: Validator.validatePassword,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                child: const Text("Login"),
                onPressed: () {
                  if (_key.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
