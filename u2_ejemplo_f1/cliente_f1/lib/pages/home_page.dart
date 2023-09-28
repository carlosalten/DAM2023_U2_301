import 'package:flutter/material.dart';
import 'package:u2_clase2/pages/calendario_page.dart';
import 'package:u2_clase2/pages/circuitos_page.dart';
import 'package:u2_clase2/pages/constructores_page.dart';
import 'package:u2_clase2/pages/pilotos_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE10600),
          centerTitle: true,
          title: Container(
            height: 40,
            child: Image.asset(
              'assets/images/f1.png',
              fit: BoxFit.contain,
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Pilotos'),
              Tab(text: 'Constructores'),
              Tab(text: 'Calendario'),
              Tab(text: 'Circuitos'),
            ],
          ),
        ),
        body: TabBarView(
          children: [PilotosPage(), ConstructoresPage(), CalendarioPage(), CircuitosPage()],
        ),
      ),
    );
  }
}
