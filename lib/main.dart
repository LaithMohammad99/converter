import 'package:flutter/material.dart';
import 'package:taske_bloc_converte/injection_container.dart';
import 'package:taske_bloc_converte/ui/screens/converter/Bloc/bloc.dart';
import 'package:taske_bloc_converte/ui/screens/converter/Bloc/events.dart';
import 'package:taske_bloc_converte/ui/screens/converter/view/converte_screen.dart';
import 'package:taske_bloc_converte/ui/screens/counter/data/api.dart';
import 'package:taske_bloc_converte/ui/screens/counter/view/counter_screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  setupLocator("");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => ConverterBloc()..add(GetCurrencyEvent()),
        ),
      ], child: RootPage()),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const ConverterPage(),
    const CounterScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Convert Currency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Page Two',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
