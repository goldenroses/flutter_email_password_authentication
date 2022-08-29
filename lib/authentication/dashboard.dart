import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Stream timeListener = getCurrentTime();
    timeListener.listen((receiveDate) {
      setState(() {
        time = receiveDate;
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Welcome to Alpha App",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "The time is:",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${time.hour}: ${time.minute}: ${time.second}",
                style: const TextStyle(
                  fontSize: 60,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, "/");
                },
                child: const Text(
                  "Back to Login",
                  style: TextStyle(
                      decoration:
                      TextDecoration
                          .underline,
                      fontSize: 15),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Stream<DateTime> getCurrentTime() async* {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    await Future.delayed(const Duration(seconds: 1));
    print("Time: $now");
    yield now;
  }
}
