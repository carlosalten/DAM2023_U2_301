import 'package:flutter/material.dart';
import 'package:u2_clase2/pages/calendario_page.dart';
import 'package:u2_clase2/pages/circuitos_page.dart';
import 'package:u2_clase2/pages/constructores_page.dart';
import 'package:u2_clase2/pages/pilotos_page.dart';
import 'package:u2_clase2/widgets/logo_f1.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: LogoF1(),
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
