import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: {'savedUsername', 'savedPassword'},
    ),
  );
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  // Store the pref instance as a class filed //
  final SharedPreferencesWithCache prefs;
  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: MyLoginPage(prefs: prefs),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyLoginPage extends StatefulWidget {
  final SharedPreferencesWithCache prefs;
  const MyLoginPage({super.key, required this.prefs});

  @override
  MyLoginPageState createState() => MyLoginPageState();
}

class MyLoginPageState extends State<MyLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _username = '';
  String _password = '';

  @override
  void initState() {
    super.initState();

    _username = widget.prefs.getString('savedUsername') ?? '';
    _password = widget.prefs.getString('savedPassword') ?? '';

    _usernameController.text = _username;
    _passwordController.text = _password;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _saveUsername(String username) async {
    // Writing the new value to storage (still async, needs await)
    await widget.prefs.setString('savedUsername', username);
    // update the UI to show the newly saved username
    setState(() => _username = username);
  }

  _savePassword(String password) async {
    // Writing the new value to storage (still async, needs await)
    await widget.prefs.setString('savedPassword', password);
    // update the UI to show the newly saved username
    setState(() => _password = password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Using Shared Preferences With Cache')),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _saveUsername(_usernameController.text);
                  _savePassword(_passwordController.text);

                  final username = _usernameController.text;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Saved -> username: $username'),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
