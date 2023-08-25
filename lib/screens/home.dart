import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              SizedBox(width: 8),
              Text('Book Clubs'),
              Spacer(),
              Icon(Icons.search),
            ],
          ),
          bottom: TabBar(tabs: [
            Tab(
              text: 'Find Clubs',
            ),
            Tab(
              text: 'Your Clubs',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            // Contenido de la primera pestaña
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Spacer(),
                      SortMenu(text: 'Sort'),
                      Spacer(),
                      SortMenu(text: 'Generes'),
                      Spacer(),
                      SortMenu(text: 'Free Ebook'),
                      Spacer(),
                      SortMenu(text: 'Premium'),
                      Spacer(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomCard(text: 'Libro 1', smallText: 'Autor 1'),
                      CustomCard(text: 'Libro 2', smallText: 'Autor 2'),
                      CustomCard(text: 'Libro 3', smallText: 'Autor 3'),
                      CustomCard(text: 'Libro 4', smallText: 'Autor 4'),
                    ],
                  ),
                  Divider(),

                  // Fila de 5 iconos en la parte inferior

                  // Menú en la parte inferior
                  BottomNavigationBar(
                    type: BottomNavigationBarType
                        .fixed, // Asegura que todas las etiquetas se muestren
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.view_compact_alt, color: Colors.black),
                        label: 'Book clubs',
                        backgroundColor: Colors.black,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.store, color: Colors.black),
                        label: 'Book Store',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.bookmark, color: Colors.black),
                        label: 'BookShelf',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.schedule, color: Colors.black),
                        label: 'Activity',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle, color: Colors.black),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Contenido de la segunda pestaña
            Center(child: Text('Contenido de la Pestaña 2')),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String text;
  final String smallText;

  CustomCard({required this.text, required this.smallText});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.grey, // Color de fondo simulando una imagen
                child: Center(
                  child: Text('Imagen'), // Texto que simula la imagen
                ),
              ),
              SizedBox(width: 10), // Espacio entre la imagen y los textos
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(smallText, style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 220), // Espacio a ajustar según tus preferencias
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey, // Color de fondo simulando una imagen
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 0,
            left: 115,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('4.5k', style: TextStyle(fontSize: 12)),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 140,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.group,
                size: 16,
              ), // Icono en la esquina inferior izquierda
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Abajo Derecha', style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}

class SortMenu extends StatelessWidget {
  final String text;

  SortMenu({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(
            color: Colors.grey,
            width: 1.0), // Agregamos el borde alrededor del menú
      ),
      child: PopupMenuButton<String>(
        icon: Row(
          children: [
            Text(text, style: TextStyle(fontSize: 12)),
            Icon(Icons.expand_more),
          ],
        ),
        onSelected: (value) {},
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(value: 'Opción 1', child: Text('Opción 1')),
          PopupMenuItem(value: 'Opción 2', child: Text('Opción 2')),
          PopupMenuItem(value: 'Opción 3', child: Text('Opción 3')),
        ],
      ),
    );
  }
}
