import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kanthi_async_exercises/models/album.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Albums API calling',
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orangeAccent,
          brightness: Brightness.dark,
        ),
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orangeAccent,
          brightness: Brightness.light,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MainAlbumsApi(),
    ),
  );
}

class MainAlbumsApi extends StatefulWidget {
  const MainAlbumsApi({super.key});

  @override
  State<MainAlbumsApi> createState() => _MainAlbumsApiState();
}

class _MainAlbumsApiState extends State<MainAlbumsApi> {
  List<Album> albums = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchAlbums();
  }

  Future<void> fetchAlbums() async {
    try {
      final baseUrl = dotenv.env['BASE_URL'] ?? '';
      final albumsPath = dotenv.env['ALBUMS_PATH'] ?? '';
      final url = '$baseUrl$albumsPath';

      print("CALL API: $url");

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'User-Agent': 'Mozilla/5.0',
          'Accept': 'application/json, text/plain, */*',
          'Accept-Language': 'en-US,en;q=0.9',
          'Connection': 'keep-alive',
        },
      );

      print("STATUS: ${response.statusCode}");
      print("BODY LENGTH: ${response.body.length}");

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        setState(() {
          albums = data.map((e) => Album.fromJson(e)).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage =
              "API error ${response.statusCode} ${response.reasonPhrase}";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Exception: $e";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (errorMessage.isNotEmpty) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(errorMessage),
          ),
        ),
      );
    }

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Fetch Albums')),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Text(
              "${album.id}. ${album.title}",
              style: textTheme.titleLarge,
            ),
          );
        },
      ),
    );
  }
}
