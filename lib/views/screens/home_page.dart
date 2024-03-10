import 'package:flutter/material.dart';
import 'package:to_do_app/views/screens/add_todo.dart';
import 'package:to_do_app/views/screens/complete_page.dart';
import '../../utils/all_data.dart';
import '../../utils/calender.dart';
import '../components/3_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To-Do App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.indigo,
                Colors.indigoAccent,
                Colors.deepPurple,
                Colors.purple,
              ],
            ),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Stay organized and productive!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.indigo,
                    Colors.indigoAccent,
                    Colors.deepPurple,
                    Colors.purple,
                  ],
                ),
              ),
              child: Text(
                'To-Do App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Calendar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CalendarPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                // Implement logout functionality
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Weekly Task",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TaskContainer(
                    size: size,
                    color: Colors.green,
                    icon: Icons.assignment,
                    title: "Task 1",
                    description: "Meeting in office at 9 P.M",
                  ),
                  const SizedBox(width: 10),
                  TaskContainer(
                    size: size,
                    color: Colors.lightBlueAccent,
                    icon: Icons.assignment,
                    title: "Task 2",
                    description: "Make widget Diary",
                  ),
                  const SizedBox(width: 10),
                  TaskContainer(
                    size: size,
                    color: Colors.amber,
                    icon: Icons.assignment,
                    title: "Task 3",
                    description: "Daily Practice",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Remaining Todo",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: allTodos.any((todo) => todo['completed'] == false)
                  ? ListView.builder(
                itemCount: allTodos.length,
                itemBuilder: (context, index) {
                  if (allTodos[index]['completed'] == false) {
                    return todoCard(
                      size: size,
                      index: index,
                      context: context,
                    );
                  } else {
                    return Container();
                  }
                },
              )
                  : Container(),
            ),

            const SizedBox(height: 20),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.home_outlined,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      width: 50, // Add width here
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(
                        Icons.add,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CalendarPage(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      width: 50, // Add width here
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(
                        Icons.access_alarm,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  CompletedTodoPage(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
