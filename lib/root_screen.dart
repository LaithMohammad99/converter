import 'package:flutter/material.dart';
import 'package:taske_bloc_converte/modules/converter/view/converte_screen.dart';
import 'package:taske_bloc_converte/modules/historical/view/history_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;
  int index=0;
  final List<Widget> _pages = [
    const ConverterPage(),
    const HistoricalView(),
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
            label: 'Histrocal ',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}