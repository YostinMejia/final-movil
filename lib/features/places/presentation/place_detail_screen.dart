
import "package:chiva_exp/features/home/widgets/custom_app_bar.dart";
import "package:chiva_exp/features/places/domain/model/place.dart";
import "package:chiva_exp/features/places/presentation/widgets/place_image_slide.dart";
import "package:flutter/material.dart";

class PlaceDetailScreen extends StatelessWidget {
  final Place place;
  const PlaceDetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            Text(
              place.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            PlaceImagesSlide(
              imagesUrls: [
                place.principalImageUrl,
                ...place.secondaryImagesUrls,
              ],
            ),
            const Expanded(child: TabOptions()),
          ],
        ),
      ),
    );
  }
}

class TabOptions extends StatefulWidget {
  const TabOptions({super.key});

  @override
  State<TabOptions> createState() => _TabOptionsState();
}

class _TabOptionsState extends State<TabOptions> {
  Secciones seccionActiva = Secciones.descripcion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSectionButton(
                context,
                Secciones.descripcion,
                "Descripción",
              ),
              _buildSectionButton(context, Secciones.detalles, "Detalles"),
              _buildSectionButton(context, Secciones.opiniones, "Opiniones"),
            ],
          ),
        ),

        // Contenido dinámico
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildSectionContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionButton(
    BuildContext context,
    Secciones seccion,
    String text,
  ) {
    final bool isActive = seccionActiva == seccion;
    return TextButton(
      onPressed: () => setState(() => seccionActiva = seccion),
      style: TextButton.styleFrom(
        foregroundColor:
            isActive ? Theme.of(context).primaryColor : Colors.grey,
        textStyle: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildSectionContent() {
    switch (seccionActiva) {
      case Secciones.descripcion:
        return const DescripcionWidget();
      case Secciones.detalles:
        return const DetallesWidget();
      case Secciones.opiniones:
        return const OpinionesWidget();
    }
  }
}

enum Secciones { descripcion, detalles, opiniones }

class DescripcionWidget extends StatelessWidget {
  const DescripcionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Text(
        "Descripción detallada del lugar...",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class DetallesWidget extends StatelessWidget {
  const DetallesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.access_time),
          title: Text("Horario de atención"),
          subtitle: Text("9:00 AM - 6:00 PM"),
        ),
        ListTile(
          leading: Icon(Icons.attach_money),
          title: Text("Precio promedio"),
          subtitle: Text("\$25,000 COP"),
        ),
      ],
    );
  }
}

class OpinionesWidget extends StatelessWidget {
  const OpinionesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(
                    5,
                    (i) => Icon(
                      Icons.star,
                      color: i < 4 ? Colors.amber : Colors.grey,
                      size: 16,
                    ),
                  ),
                ),
                const Text("Usuario"),
                const Text("Comentario de ejemplo sobre el lugar..."),
              ],
            ),
          ),
        );
      },
    );
  }
}