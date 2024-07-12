import 'package:flutter/material.dart';
import 'package:movie_app_machine_test/domain/model/movie_model.dart';
import 'package:movie_app_machine_test/infrastructure/services/api_services/api_services.dart';
import 'package:movie_app_machine_test/presentation/widgets/movie_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieResponse> movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      ApiService apiService = ApiService();
      List<MovieResponse> response = await apiService.fetchMovies();
      setState(() {
        movies = response;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showCompanyInfo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Company Info'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Company: Geeksynergy Technologies Pvt Ltd'),
                Text('Address: Sanjayanagar, Bengaluru-56'),
                Text('Phone: XXXXXXXXX09'),
                Text('Email: XXXXXX@gmail.com'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'Company Info') {
                _showCompanyInfo();
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Company Info'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                var movie = movies[index];
                return MovieTile(movie: movie);
              },
            ),
    );
  }
}
