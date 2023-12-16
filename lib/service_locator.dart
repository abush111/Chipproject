import 'package:chipapp/api_reposirty/category_repositry.dart';
import 'package:chipapp/api_reposirty/product_repository.dart';
import 'package:chipapp/bloc/Categorybloc/category_bloc.dart';
import 'package:chipapp/bloc/cartbloc/cartbloc.dart';

import 'package:chipapp/bloc/productbloc/product_bloc.dart';
import 'package:chipapp/hive/cart.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

final sl = GetIt.instance;

Future<void> serviceLocatorInit() async {
  sl.registerFactory<ProductBloc>(
    () => ProductBloc(sl()),
  );
  sl.registerFactory<Productrepo>(
    () => Productrepo(),
  );
  sl.registerFactory<CategoryBloc>(
    () => CategoryBloc(sl()),
  );
  sl.registerFactory<CategoryService>(
    () => CategoryService(),
  );

  // sl.registerFactory<CartRepo>(
  //   () => CartRepo(sl()),
  // );
  sl.registerLazySingleton<Box<Cart>>(() => Hive.box<Cart>('carts'));

  sl.registerFactory<CartBloc>(
    () => CartBloc(),
  );
}
