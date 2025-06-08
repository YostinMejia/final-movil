import 'package:chiva_exp/features/places/presentation/widgets/details/place_description.dart';
import 'package:chiva_exp/features/places/presentation/widgets/details/place_details.dart';
import 'package:chiva_exp/features/places/presentation/widgets/details/place_options.dart';
import 'package:flutter/material.dart';

enum Sections { description, details, comments }

class TabOptions extends StatefulWidget {
  const TabOptions({super.key});

  @override
  State<TabOptions> createState() => _TabOptionsState();
}

class _TabOptionsState extends State<TabOptions> {
  Sections currentSection = Sections.description;

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
              _buildSectionButton(context, Sections.description, "Descripción"),
              _buildSectionButton(context, Sections.details, "details"),
              _buildSectionButton(context, Sections.comments, "comments"),
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
    Sections section,
    String text,
  ) {
    final bool isActive = currentSection == section;
    return TextButton(
      onPressed: () => setState(() => currentSection = section),
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
    switch (currentSection) {
      case Sections.description:
        return const PlaceDescription();
      case Sections.details:
        return const PlaceDetails();
      case Sections.comments:
        return const PlaceOptions();
    }
  }
}
