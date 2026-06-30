import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Skills')),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          // --- TECH SKILLS SECTION ---
          const Text(
            'Tech Skills', 
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey)
          ),
          const SizedBox(height: 16),
          // Advanced skills mapped to 90%
          _buildSkillBar('Python (Advanced)', 0.9),
          _buildSkillBar('JAVA (Advanced)', 0.9),
          // Strong proficiencies mapped to 80-85%
          _buildSkillBar('AI & Machine Learning', 0.85),
          _buildSkillBar('Data Science', 0.8),
          _buildSkillBar('Data Structures & Algorithms', 0.8),
          _buildSkillBar('Dart and Flutter UI', 0.75),
          // Intermediate mapped to 60%
          _buildSkillBar('C++ (Intermediate)', 0.6),
          // Basic mapped to 30%
          _buildSkillBar('R (Basic)', 0.3),
          
          const SizedBox(height: 30),

          // --- SOFT SKILLS SECTION ---
          const Text(
            'Soft Skills', 
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey)
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            runSpacing: 12.0,
            children: [
              _buildSkillChip('Teamwork'),
              _buildSkillChip('Time Management'),
              _buildSkillChip('Logistics and Planning'),
              _buildSkillChip('Effective Communication'),
              _buildSkillChip('Critical Thinking'),
              _buildSkillChip('Adaptability'),
            ],
          ),

          const SizedBox(height: 30),

          // --- LANGUAGES SECTION ---
          const Text(
            'Languages', 
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey)
          ),
          const SizedBox(height: 16),
          _buildLanguageTile('English', 'Fluent'),
          _buildLanguageTile('Hindi', 'Fluent'),
          _buildLanguageTile('French', 'Intermediate'),
          
          const SizedBox(height: 20), // Padding at the bottom
        ],
      ),
    );
  }

  // --- HELPER METHODS ---

  Widget _buildSkillBar(String skillName, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skillName, 
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            color: Colors.teal, // Premium accent color
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blueGrey[50],
      side: BorderSide(color: Colors.blueGrey[200]!),
      labelStyle: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    );
  }

  Widget _buildLanguageTile(String language, String proficiency) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.language, size: 20, color: Colors.blueGrey),
              const SizedBox(width: 12),
              Text(language, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
          Text(
            proficiency, 
            style: const TextStyle(fontSize: 14, color: Colors.teal, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600)
          ),
        ],
      ),
    );
  }
}