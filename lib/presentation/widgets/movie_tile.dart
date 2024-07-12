import 'package:flutter/material.dart';
import 'package:movie_app_machine_test/domain/model/movie_model.dart';

class MovieTile extends StatelessWidget {
  final MovieResponse movie;

  const MovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Icon(Icons.arrow_drop_up, size: 42, color: Colors.grey[700]),
                Text(
                  '${movie.voting ?? 0}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_drop_down, size: 42, color: Colors.grey[700]),
                const Text('Votes', style: TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                const SizedBox(height: 20),
                Image.network(
                  movie.poster ?? '',
                  width: 85,
                  height: 140,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 120,
                      color: Colors.grey,
                      child: const Icon(Icons.image, color: Colors.white),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? '',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Genre: ${movie.genre ?? ''}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Text(
                    'Director: ${movie.director?.join(', ') ?? ''}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Text(
                    'Starring: ${movie.stars?.join(', ') ?? ''}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${movie.runTime ?? 0} mins | ${movie.language ?? ''} | ${movie.releasedDate ?? ''}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${movie.pageViews ?? 0} views | Voted by ${movie.totalVoted ?? 0} People',
                    style: const TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 36),
                      ),
                      child: const Text('Watch Trailer'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
