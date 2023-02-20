
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/view_models/future_book_cubits/future_book_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/app_router.dart';
import 'features/home/presentation/view_models/newset_cubit/newset_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
     
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => FeaturedBooksCubit(HomeRepoImplementation(ApiServices(Dio())))..fetchFeaturedBooks(),),
        BlocProvider(create:(context) => NewsetBooksCubit(HomeRepoImplementation(ApiServices(Dio())))..fetchNewestBooks(),),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.white,
          
            scaffoldBackgroundColor:kPrimaryColor ,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ), routeInformationParser: AppRouter.router.routeInformationParser, 
        routerDelegate: AppRouter.router.routerDelegate,
        
       // home:const SplashView(),
      ),
    );
  }
}


