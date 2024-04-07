import 'package:flutter/material.dart';
import 'package:rolo_app/screens/destination_details_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Dream Destination Awaits',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Dream Destination Awaits'),
      ),
      drawer: const NavigationPanel(), // Drawer with navigation options
      body: ListView(
        // Main content of the HomeScreen
        children: const [
          HeaderSection(),
          FeaturedDestinationsSection(),
          AllDestinationsSection(),
        ],
      ),
    );
  }
}

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          // Your existing drawer header and other content...
          ListTile(
            leading: const Icon(Icons.place, color: Colors.white),
            title: const Text('Destinations',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              // Close the drawer
              Navigator.pop(context);
              // Navigate to the destination details screen
              Navigator.pushNamed(context, '/details');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title:
                const Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              // Replace '/settings' with the actual route name for your settings screen
              Navigator.pushNamed(context, '/settings');
            },
          ),
          // Add more ListTile widgets for navigation as needed...
        ],
      ),
    );
  }
}

class AboveSection extends StatelessWidget {
  const AboveSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Dream Destination Awaits',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DestinationPage(),
    );
  }
}

class DestinationPage extends StatelessWidget {
  const DestinationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Dream Destination Awaits',
          textAlign: TextAlign.left, // Align the text in the center
          style: TextStyle(
            fontWeight: FontWeight.bold, // Custom font weight
            fontSize: 24, // Custom font size
          ),
        ),
        centerTitle: true,
      ),
      drawer: const Drawer(
        child: NavigationPanel(),
      ),
      body: ListView(
        children: const [
          HeaderSection(),
          FeaturedDestinationsSection(),
          AllDestinationsSection(),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Are you ready for your next adventure?',
            textAlign: TextAlign.center, // Align the text in the center
            style: TextStyle(
              fontSize: 16.0, // Set the font size
              fontStyle: FontStyle.italic, // Set the font style to italic
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedDestinationsSection extends StatelessWidget {
  const FeaturedDestinationsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          3,
          (index) => DestinationCard(
                isFeatured: true,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DestinationDetailsScreen(),
                    )),
              )),
    );
  }
}

class AllDestinationsSection extends StatelessWidget {
  const AllDestinationsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment
          .center, // Align children in the center horizontally
      children: [
        const Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(
            'All Destinations',
            textAlign:
                TextAlign.center, // Align the text in the center horizontally
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: List.generate(
            4,
            (index) => DestinationCard(
              isFeatured: false,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DestinationDetailsScreen(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DestinationCard extends StatelessWidget {
  final bool isFeatured;
  final VoidCallback onTap; // Add this line

  const DestinationCard(
      {super.key, required this.isFeatured, required this.onTap});

  @override
  Widget build(BuildContext context) {
    IconData iconData = isFeatured ? Icons.star : Icons.place;
    Color iconColor = isFeatured ? Colors.grey : Colors.grey;

    return Card(
      elevation: 4.0,
      color: const Color(0xFF3B4948),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage:
              AssetImage('welcome.jpg'), // Replace with your image path
          radius: 26, // Adjust size as needed
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(iconData, color: iconColor),
            const SizedBox(height: 4.0),
            const Text('Name'),
            const Text('Description'),
          ],
        ),
        trailing: const Icon(Icons.more_vert),
        onTap: onTap, // Use the callback function here
      ),
    );
  }
}
