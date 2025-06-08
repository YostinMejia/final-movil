import 'package:chiva_exp/features/places/domain/model/place.dart';
import 'package:chiva_exp/features/places/presentation/widgets/details/place_description.dart';
import 'package:chiva_exp/features/places/presentation/widgets/details/place_details.dart';
import 'package:chiva_exp/features/places/presentation/widgets/details/place_opinions.dart';
import 'package:chiva_exp/features/places/presentation/widgets/details/section_option.dart';
import 'package:flutter/material.dart';

enum Sections { description, details, comments }

class TabOptions extends StatefulWidget {
  final Place place;
  const TabOptions({super.key, required this.place});

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
              SectionOption(
                isActive: currentSection == Sections.description,
                text: "Descripción",
                onPressed:
                    () => setState(() => currentSection = Sections.description),
              ),
              SectionOption(
                isActive: currentSection == Sections.details,
                text: "Detalles",
                onPressed:
                    () => setState(() => currentSection = Sections.details),
              ),
              SectionOption(
                isActive: currentSection == Sections.comments,
                text: "Comentarios",
                onPressed:
                    () => setState(() => currentSection = Sections.comments),
              ),
            ],
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: () {
              switch (currentSection) {
                case Sections.description:
                  return  PlaceDescription(description: widget.place.description,);
                case Sections.details:
                  return  PlaceDetails(details: widget.place.details,);
                case Sections.comments:
                  return  PlaceOpinions(comments: widget.place.comments,);
              }
            }(),
          ),
        ),
      ],
    );
  }
}
