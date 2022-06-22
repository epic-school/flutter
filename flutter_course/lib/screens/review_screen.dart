import 'package:MovieReview/screens/review_detail_screen.dart';
import 'package:flutter/material.dart';
import '../models/review_model.dart';
import '../api_service.dart';
import '../enums.dart';
import '../theme/theme.dart';

class ReviewScreen extends StatefulWidget {
  final int movieId;
  const ReviewScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<ReviewScreen> createState() =>  _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {


  final ApiService service = ApiServiceDio.instance;
  var state = ReviewState.initial;
  final reviews = <ReviewDocs>[];


  Future<void> load() async {
    setState(() {
      state = ReviewState.loading;
    });
    // изменить
    final response = await service.getReviews(widget.movieId);
    if (response.hasError) {
      setState(() {
        state = ReviewState.failure;
        reviews.clear();
      });
    } else {
      setState(() {
        state = response.result!.isNotEmpty
            ? ReviewState.success
            : ReviewState.empty;
        reviews
          ..clear()
          ..addAll(response.result!);
      });
    }
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
        iconTheme: Theme.of(context).primaryIconTheme,
        title: const Text('Отзывы на фильм'),
      ),
      body: _ReviewView(
        state: state,
        reviews: reviews,
      ),
    );
  }
}

class _ReviewView extends StatelessWidget {
  final ReviewState state;
  final List<ReviewDocs>? reviews;

  const _ReviewView({
    Key? key,
    required this.state,
    this.reviews = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ReviewState.success:
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: reviews?.length,
          itemBuilder: (context, i) => ListTile(

              title: Row( children: [
                ((reviews?[i].type??"Нейтральный".compareTo("Позитивный"))==0  ) ?
              const Icon(Icons.arrow_upward, color: Colors.green):
             ((reviews?[i].type??"Нейтральный".compareTo("Негативный"))==0 ) ?
              const Icon(Icons.arrow_downward, color: Colors.red):
              const SizedBox(width: 40,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(reviews?[i].author??'',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(reviews?[i].date??'',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 30,),
                    Text(reviews?[i].title??'',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(reviews?[i].review??'',
                      style: Theme.of(context).textTheme.subtitle1,
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                    ),
                     Divider(color: Theme.of(context).dividerTheme.color,),
                  ],
                ),
              ),
            ],
            ),
            onTap:  () {
              navKey.currentState!.push(
                MaterialPageRoute(
                  builder: (context) =>   ReviewDetailScreen(review: reviews![i]),
                ),
              );
            },
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
          child: Text('Отзывы не загружены',style: Theme.of(context).textTheme.subtitle1,),
        );
    }
  }
}
