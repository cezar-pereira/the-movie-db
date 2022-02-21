import 'package:flutter/material.dart';
import 'package:the_movie_db/app/modules/home/domain/entities/movie_genre_entity.dart';

class ListGenresComponent extends StatefulWidget {
  const ListGenresComponent(
      {Key? key, required this.onTap, required this.genres})
      : super(key: key);

  final List<MovieGenreEntity> genres;
  final ValueChanged onTap;

  @override
  _ListGenresComponentState createState() => _ListGenresComponentState();
}

class _ListGenresComponentState extends State<ListGenresComponent> {
  int currentGenre = 28;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.genres.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentGenre = widget.genres[index].id;
                widget.onTap(currentGenre);
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: currentGenre == widget.genres[index].id
                      ? Border.all(color: const Color(0xFF00384C), width: 2)
                      : Border.all(color: const Color(0xFFF1F3F5), width: 2),
                  borderRadius: BorderRadius.circular(26),
                  color: currentGenre == widget.genres[index].id
                      ? const Color(0xFF00384C)
                      : Colors.transparent),
              child: Text(
                widget.genres[index].name,
                style: TextStyle(
                  color: currentGenre == widget.genres[index].id
                      ? Colors.white
                      : const Color(0xFF00384C),
                  fontSize: 12,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 12),
      ),
    );
  }
}
