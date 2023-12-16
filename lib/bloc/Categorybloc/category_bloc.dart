
import 'package:chipapp/api_reposirty/category_repositry.dart';

import 'package:chipapp/bloc/Categorybloc/category_event.dart';
import 'package:chipapp/bloc/Categorybloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

  
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryService categoryService;

  CategoryBloc(this.categoryService) : super(CategoryInitialState()) {
    on<FetchcategoryEvent>((event, emit) async {
      print("Category DATA BLOC CALLED!!");
      emit(CategoryInitialState());
      try {
        final Categorydata = await categoryService.fetchCategories();
        print("Category DATA FROM NETWORK $Categorydata");
        emit(CategoryLoadedState( Categorydata)); // Pass Categorydata.data
      } catch (e) {
        print("${e.toString()}");
        emit(CategoryErrorState(e.toString()));
      }
    });
  }
}

