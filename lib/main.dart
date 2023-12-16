import 'package:chipapp/bloc/Categorybloc/category_bloc.dart';
import 'package:chipapp/bloc/Categorybloc/category_event.dart';
import 'package:chipapp/bloc/cartbloc/cartbloc.dart';
import 'package:chipapp/bloc/cartbloc/cartevent.dart';
import 'package:chipapp/bloc/loginbloc/LoginCubit.dart';
import 'package:chipapp/bloc/productbloc/product_bloc.dart';
import 'package:chipapp/bloc/productbloc/productevent.dart';
import 'package:chipapp/hive/cart.dart';
import 'package:chipapp/hive/product.dart';
import 'package:chipapp/page/Loginpage.dart';
import 'package:chipapp/page/onboarding.dart';
import 'package:chipapp/service_locator.dart';
import 'package:chipapp/themes/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await serviceLocatorInit();
  await Hive.initFlutter();
  Hive.registerAdapter<Product>(ProductAdapter());
  Hive.registerAdapter<Cart>(CartAdapter());
  await Hive.openBox<Cart>('carts');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
            create: (_) => sl<ProductBloc>()
              ..add(
                FetchProductEvent(),
              )),
        BlocProvider(
            create: (_) => sl<CategoryBloc>()..add(FetchcategoryEvent())),
        BlocProvider(create: (_) => sl<CartBloc>()..add(FetchCartEvent())),
      ],
      child: MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: CustomColors.onbroadingbackground.withOpacity(1)),
          useMaterial3: true,
        ),
        home: onboarding(),
      ),
    );
  }
}
