import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Me')),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildSectionHeader('Educational Background'),
          _buildInfoTile(
            title: 'Bachelor of Technology (B.Tech)',
            subtitle: 'Vellore Institute of Technology (VIT)',
            icon: Icons.school,
          ),
          const Divider(),
          _buildSectionHeader('Professional Experience'),
          _buildInfoTile(
            title: 'Python Development Intern',
            subtitle: 'Sysslan IT Solution (Feb 2026 - Mar 2026)',
            icon: Icons.work_outline,
          ),
          const Divider(),
          _buildSectionHeader('Interests & Focus Areas'),
          const SizedBox(height: 8),
          _buildInterestItem(
            title: 'Artificial Intelligence & Machine Learning',
            details: 'Exploring intelligent systems, predictive modeling, and developing AI-driven solutions.',
          ),
          _buildInterestItem(
            title: 'Software & Application Development',
            details: 'Designing scalable backend architectures and building robust cross-platform applications.',
          ),
          _buildInterestItem(
            title: 'Cybersecurity & Fraud Detection',
            details: 'Implementing data encryption, secure APIs, and systems for authenticity verification.',
          ),
          _buildInterestItem(
            title: 'Developer Operations (DevOps) & Cloud',
            details: 'Streamlining deployment processes and working with distributed cloud environments.',
          ),
          const SizedBox(height: 20), // Extra padding at the bottom
        ],
      ),
    );
  }

  // --- HELPER METHODS ---

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),
      ),
    );
  }

  Widget _buildInfoTile({required String title, required String subtitle, required IconData icon}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.blueGrey[100],
        child: Icon(icon, color: Colors.blueGrey[800]),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }

  // The missing method has been added here
  Widget _buildInterestItem({required String title, required String details}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4.0, right: 12.0),
            child: Icon(Icons.check_circle_outline, size: 20, color: Colors.teal),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  details,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}