import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Import the new splash screen
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/skills_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shikha Singh Portfolio',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, // Automatically switches between Light and Dark
      
      // Light Mode Colors
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
        ),
      ),
      
      // Dark Mode Colors
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFF121212), // Deep hacker dark
        cardColor: const Color(0xFF1E1E1E),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFF1E1E1E),
          foregroundColor: Colors.tealAccent,
        ),
      ),
      
      home: const SplashScreen(),
    );
  }
}

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _currentIndex = 0;
  bool _isLoading = false; // Tracks if we should show the loading animation

  final List<Widget> _screens = [
    const HomeScreen(),
    const AboutScreen(),
    const SkillsScreen(),
    const ProjectsScreen(),
    const ContactScreen(),
  ];

  final List<String> _consoleLogs = [
    '> [INFO] User authenticated. Loading profile...',
    '> [SYS] Fetching background_data.json... OK',
    '> [FETCH] Compiling skill matrix... Success.',
    '> [WARN] High volume of awesome detected in projects.',
    '> [NET] Establishing secure connection...',
  ];

  void _onTabTapped(int index) async {
    // If we tap the tab we are already on, do nothing
    if (_currentIndex == index) return;

    // Start the loading state
    setState(() {
      _currentIndex = index;
      _isLoading = true;
    });

    // CHANGE 2: The micro-delay (400 milliseconds)
    await Future.delayed(const Duration(milliseconds: 400));

    // End the loading state
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            // If _isLoading is true, show a spinner. Otherwise, show the screen.
            child: _isLoading 
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.blueGrey[800],
                    ),
                  )
                : _screens[_currentIndex],
          ),
          
          // THE LIVE CONSOLE LOG FOOTER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: Colors.black,
            child: Text(
              // Show "PROCESSING..." while loading, then show the actual log message
              _isLoading ? '> [SYS] PROCESSING REQUEST...' : _consoleLogs[_currentIndex],
              style: const TextStyle(
                color: Colors.greenAccent,
                fontFamily: 'Courier',
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueGrey[800],
        unselectedItemColor: Colors.grey,
        onTap: _onTabTapped, // Call our new method with the delay
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Skills'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Projects'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Contact'),
        ],
      ),
    );
  }
}