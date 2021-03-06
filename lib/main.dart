import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/news_layout.dart';
import 'package:news_app/shared/network/local/cache_helpers.dart';
import 'package:news_app/shared/components/bloc_observer.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'layout/news_app/cubit/states.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
   await CacheHelper.init();
  bool? isDark= CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp( isDark));
}
class MyApp extends StatelessWidget{
   final bool? isDark;
  MyApp( this.isDark);

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
        create:(BuildContext context)=> NewsCubit()
          ..changeModeApp(fromShared:isDark)
      ..getBusiness()
      ..getScience()
      ..getSports(),
    child: BlocConsumer <NewsCubit, NewsStates>(
    listener: (context, state){},
    builder: (context, state){
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
            titleSpacing: 20.0,
          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
      color: Colors.black,
      ),
      ),
      textTheme: TextTheme(
      bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      elevation: 20.0,
      ),
      ),
      darkTheme: ThemeData(
      scaffoldBackgroundColor:  HexColor('333739'),
      appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      titleSpacing: 20.0,
      systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor:  HexColor('333739'),
      elevation: 0.0,
      titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
      color:Colors.white,
      ),
      ),
      textTheme: TextTheme(
      bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: HexColor('333739'),
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
      ),
      ),
      themeMode: NewsCubit.get(context).isDark ? ThemeMode.light: ThemeMode.dark,
      home: NewsLayout(),
      );

    },

    ),
    );


  }
}

