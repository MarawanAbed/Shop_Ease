import 'package:flutter/material.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Marwan Ehab Mohamed Abed',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Software Engineer (Flutter Developer)',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[700],
            ),
          ),
          const Divider(color: Colors.deepPurple, thickness: 2),
          const SizedBox(height: 16.0),
          const Text(
            'About Me',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'I am a software engineer with a passion for mobile application development. I have experience in developing mobile applications using Flutter and Dart. I am also experienced in developing web applications using React and Node.js. I am a quick learner and a team player. I am always eager to learn new technologies and improve my skills. I am looking for a challenging position in a company that will allow me to grow and develop my skills. I am a hardworking and dedicated individual who is always willing to go the extra mile to achieve the best results. I am confident that I can make a positive contribution to any team that I am a part of. I am looking forward to working with you. Thank you for your time and consideration. I look forward to hearing from you soon.',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[700],
            ),
          ),
          const Divider(color: Colors.deepPurple, thickness: 2),
          const SizedBox(height: 16.0),
          const Text(
            'My Skills',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Flutter, Dart, Front End ',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}