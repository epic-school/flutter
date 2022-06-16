import 'package:flutter/material.dart';
import '../models/review_model.dart';
import '../enums.dart';

class ReviewDetailScreen extends StatefulWidget {
  final ReviewDocs review;
  const ReviewDetailScreen({Key? key, required this.review}) : super(key: key);

  @override
  State<ReviewDetailScreen> createState() =>  _ReviewDetailScreenState();
}

class _ReviewDetailScreenState extends State<ReviewDetailScreen> {



  var state = ReviewState.initial;
  late ReviewDocs reviews;
  Future<void> load() async {
    setState(() {
      state = ReviewState.loading;
    });
    reviews=widget.review;
    // изменить

      setState(() {
        state = ReviewState.success;
      }
      );
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Подробная информация по отзыву'),
      ),
      body: _ReviewDetailView(
        state: state,
        review: reviews,
      ),
    );
  }
}

class _ReviewDetailView extends StatelessWidget {
  final ReviewState state;
  final ReviewDocs review;

  const _ReviewDetailView({
    Key? key,
    required this.state,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ReviewState.success:
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 1,
          itemBuilder: (context, i) => ListTile(

            title: Row( children: [

              const SizedBox(width: 40,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.author??'',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(review.date??'',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 30,),
                    Text(review.title??'',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(review.review??'',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),

                  ],
                ),
              ),
            ],
            ),

          ),
        );
      case ReviewState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ReviewState.empty:
        return  Center(
          child: Text('Пустой список отзывов',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        );
      case ReviewState.failure:
        return  Center(
          child: Text(
            'Ууупс, что-то пошло не так',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        );
      default:
        return  Center(
          child: Text('Отзыв не загружен',style: Theme.of(context).textTheme.subtitle1,),
        );
    }
  }
}
