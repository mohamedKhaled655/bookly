import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(HomeRepoImplementation(ApiServices(Dio())))..have_data,
      child: const Scaffold(
        body: SafeArea(child: SearchViewBody()),
      ),
    );
  }
}