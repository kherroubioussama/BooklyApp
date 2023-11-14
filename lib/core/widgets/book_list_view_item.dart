import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../constants.dart';
import '../utils/styles.dart';
import '../../Features/home/presentation/views/widgets/book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? 'https://thebookwithnopictures.com/wp-content/uploads/2014/08/BookWithNoPictures_3D.png'),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                      book.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: KGtSectraFineFont)),
                ),
                const SizedBox(
                  height: 3,
                ),
                 Text(
                  book.volumeInfo.authors![0],
                  style: Styles.textStyle14,
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(children: [
                  Text(
                    'Free',
                    style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                   BookingRating(
                    count: book.volumeInfo.averageRating?.round() ?? 0,
                    rating: book.volumeInfo.ratingsCount ?? 0,
                  ),
                ])
              ]),
            )
          ],
        ),
      ),
    );
  }
}

