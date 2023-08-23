import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/bloc/addFavoriteCart/bloc/add_favorite_cart_bloc.dart';
import 'package:shoppingapp/bloc/authBloc/auth_cart_bloc.dart';
import 'package:shoppingapp/screens/all_screens.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCartBloc(),
        ),
        BlocProvider(create: (contect) => AddFavoriteCartBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: AllScreens(),
      ),
    );
  }
}
