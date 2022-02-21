import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/app/core/api/api.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_entity.dart';

class PostFilmComponent extends StatelessWidget {
  const PostFilmComponent({Key? key, required this.movie}) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: movie.posterPath.isEmpty ? movie.id.toString() : movie.posterPath,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 56, 76, 0.2),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.65,
        width: double.maxFinite,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                  imageUrl: baseUrlImage + movie.posterPath,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fill),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(0, 0, 0, 0.0001),
                    Color.fromRGBO(0, 0, 0, 0.633084)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    Text(
                        movie.genres
                            .map((e) => e.name)
                            .toString()
                            .replaceAll(',', ' -')
                            .replaceAll('(', '')
                            .replaceAll(')', ''),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
