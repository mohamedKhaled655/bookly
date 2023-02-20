import 'package:bookly/features/home/data/models/books.dart';
import 'package:bookly/features/home/presentation/views/book_view_details.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_screen.dart';

abstract class AppRouter{

 static const homeView="/homeView";
 static const bookViewDetails="/bookViewDetails";
  static const searchView="/searchView";


 static final router=GoRouter(
  
  routes: [
    GoRoute(
      path: "/",
      builder: (context,state)=>const SplashView(),
      
    ),
     GoRoute(
      path: "/homeView",
      builder: (context,state)=>const HomeView(),
      
    ),
    GoRoute(
      path: bookViewDetails,
      builder: (context,state)=> BookViewDetails(books: state.extra as Books,),
      
      
    ),
    GoRoute(
      path: searchView,
      builder: (context,state)=>const SearchView(),
      
    ),
  ],
  
);
}