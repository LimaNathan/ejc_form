import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';

class SkillsSelector extends StatefulWidget {
  final List<String> selectedSkills;
  final Function(List<String>) onSkillsChanged;

  const SkillsSelector({
    required this.selectedSkills,
    required this.onSkillsChanged,
    super.key,
  });

  @override
  State<SkillsSelector> createState() => _SkillsSelectorState();
}

class _SkillsSelectorState extends State<SkillsSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Aptidões', style: Theme.of(context).textTheme.titleMedium),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: AppConstants.skills.map((skill) {
            final isSelected = widget.selectedSkills.contains(skill);
            return FilterChip(
              selected: isSelected,
              label: Text(skill),
              onSelected: (selected) {
                final newSkills = List<String>.from(widget.selectedSkills);
                if (selected) {
                  newSkills.add(skill);
                } else {
                  newSkills.remove(skill);
                }
                widget.onSkillsChanged(newSkills);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
