import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of your actual projects
    final List<Project> myProjects = [
      Project(
        title: 'AI Guard: Secure Voice Detection',
        description: 'A security API designed to distinguish between human and synthetic voices for fraud detection.',
        technologies: 'Python, APIs, Machine Learning concepts',
      ),
      Project(
        title: 'Secure Expense Vault',
        description: 'A command-line interface application that uses XOR encryption for local data privacy.',
        technologies: 'Java, Core OOP, File I/O',
      ),
      Project(
        title: 'Quiz API',
        description: 'A robust backend service designed to serve dynamic quiz questions, manage user sessions, and evaluate answers.',
        technologies: 'dart, REST APIs', // Update these with your actual tech stack
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: myProjects.length,
        itemBuilder: (context, index) {
          final project = myProjects[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(project.description, style: const TextStyle(fontSize: 15)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.code, size: 16, color: Colors.blueGrey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          project.technologies,
                          style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}