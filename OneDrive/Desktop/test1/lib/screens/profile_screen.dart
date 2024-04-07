import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Profile',
      routes: {
        '/': (context) => const ProfilePage(),
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          NavigationPanel(),
          Expanded(
            child: ProfileScreen(), // Change here
          ),
        ],
      ),
    );
  }
}

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: const Color(0xFF3B4948),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 30.0,
            ),
            child: Image.asset(
              'images/explorer.png',
              width: 100,
              height: 100,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.place, color: Colors.white),
            title: Text('Destinations', style: TextStyle(color: Colors.white)),
          ),
          const ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
          ),
          const ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.white),
            title: Text('Log Out', style: TextStyle(color: Colors.white)),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.account_circle, color: Colors.white, size: 24.0),
                SizedBox(width: 8.0),
                Text('User username', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainPanel extends StatelessWidget {
  const MainPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      color: Colors.white,
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSection(),
            SizedBox(height: 35),
            FavoriteDestinations(),
            SizedBox(height: 60),
            TripsSection(),
            SizedBox(height: 80),
            FeedbackForm(),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 40,
            ),
            SizedBox(height: 10),
            Text(
              '@Username',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteDestinations extends StatelessWidget {
  const FavoriteDestinations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.grey,
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(7.0),
              child: Text(
                'Favorite Destinations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('path/to/your/image.png'),
                radius: 30,
              ),
              title: Text('Destination name'),
              subtitle: Text('Destination description'),
            ),
          ],
        ),
      ),
    );
  }
}

class TripsSection extends StatelessWidget {
  const TripsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'My Trips',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Icon(
                  Icons.card_travel,
                  size: 48,
                  color: Colors.grey,
                ),
                Text('No Trips Yet'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeedbackForm extends StatelessWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Feedback',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Enter your feedback...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          CheckboxListTile(
            value: false,
            onChanged: (bool? newValue) {},
            title: const Text('Enjoyable'),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
            ),
            child: const Text('CREATE FEEDBACK'),
          ),
        ],
      ),
    );
  }
}
