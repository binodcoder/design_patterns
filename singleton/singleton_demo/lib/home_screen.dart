import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'auth_screen.dart';
import 'firestore_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  void _addUser() async {
    if (_nameController.text.isNotEmpty && _ageController.text.isNotEmpty) {
      await FirestoreService().addUser(_nameController.text, int.parse(_ageController.text));
      _nameController.clear();
      _ageController.clear();
    }
  }

  void _logout() async {
    await AuthService().signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore Singleton Example"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Age"),
            ),
          ),
          ElevatedButton(
            onPressed: _addUser,
            child: Text("Add User"),
          ),
          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: FirestoreService().getUsers(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                var users = snapshot.data!;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(users[index]['name']),
                      subtitle: Text("Age: ${users[index]['age']}"),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
