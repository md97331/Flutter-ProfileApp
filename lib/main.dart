//import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ProjectInfo {
  final String name;
  final String picture;
  final String date;

  ProjectInfo(this.name, this.picture, this.date);
}

class UserInfo {
  final String name;
  final String position;
  final String company;
  final String phone;
  final String email;
  final String address1;
  final String address2;
  final String picture;

  // each entry is a record with named fields that describe a degree
  final List<({String logo, String name, double gpa})> education;

  // each entry is an instance of `ProjectInfo` that contains project details
  final List<ProjectInfo> projects;

  UserInfo(
      {required this.name,
      required this.position,
      required this.company,
      required this.phone,
      required this.email,
      required this.address1,
      required this.address2,
      required this.picture})
      : education = [],
        projects = [];

  void addEducation(
      {required String logo, required String name, required double gpa}) {
    education.add((logo: logo, name: name, gpa: gpa));
  }

  void addProject(ProjectInfo project) {
    projects.add(project);
  }
}

void main() {
  //Personal Information
  UserInfo userInfo = UserInfo(
      name: 'Steve Jobs',
      position: 'Software Engineer',
      company: 'Apple Inc.',
      phone: '(999) 555-1212',
      email: 'steve.jobs@apple.com',
      address1: '10 W 31st St.',
      address2: 'San Francisco, CA',
      picture: 'assets/images/sjobs.jpg');
  //Education
  userInfo.addEducation(
      logo: 'assets/images/illinois-tech-logo.png',
      name: 'Illinois Tech',
      gpa: 3.8);
  userInfo.addEducation(
      logo: 'assets/images/yale-university-logo.png',
      name: 'Yale University',
      gpa: 3.3);
  userInfo.addEducation(
      logo: 'assets/images/harvard-university.jpeg',
      name: 'Harvard University',
      gpa: 3.4);
  //Projects
  userInfo.addProject(ProjectInfo(
      "Scientific Research", "assets/images/stfResearch.jpeg", "12/2020"));
  userInfo.addProject(ProjectInfo("Deep Learning and Predictive Models",
      "assets/images/dLearPredMod.jpeg", "10/2020"));
  userInfo.addProject(ProjectInfo(
      "Robotics and Electronics", "assets/images/robAndElec.jpeg", "05/2020"));
  userInfo.addProject(ProjectInfo(
      "Personal Website", "assets/images/personalWeb.jpeg", "10/2019"));
  userInfo.addProject(
      ProjectInfo("Iphone 15", "assets/images/iphone.jpeg", "09/2023"));

  runApp(MaterialApp(
    home: UserInfoPage(userInfo: userInfo),
    theme: ThemeData(primarySwatch: Colors.grey),
  ));
}

class UserInfoPage extends StatelessWidget {
  final UserInfo userInfo;

  const UserInfoPage({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Information")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GeneralInfo(userInfo: userInfo),
            ContactInfo(userInfo: userInfo),
            UsrEducation(userInfo: userInfo),
            UsrProject(userInfo: userInfo)
          ],
        ),
      ),
    );
  }
}

class GeneralInfo extends StatelessWidget {
  final UserInfo userInfo;

  const GeneralInfo({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color.fromARGB(255, 220, 220, 220)),
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: Image.asset(
                userInfo.picture,
                fit: BoxFit.cover,
              )),
              const SizedBox(width: 25, height: 1),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userInfo.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.5,
                        fontSize: 20,
                      ),
                    ),
                    Text("Position: ${userInfo.position}"),
                    Text("Company: ${userInfo.company}"),
                  ],
                ),
              )
            ],
          )
        ]));
  }
}

class ContactInfo extends StatelessWidget {
  final UserInfo userInfo;

  const ContactInfo({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle, color: Color.fromARGB(255, 220, 220, 220)),
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.smartphone),
          const SizedBox(width: 10),
          Text(
            userInfo.phone,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 15,
            ),
          )
        ]),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.email),
          const SizedBox(width: 10),
          Text(
            userInfo.email,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 15,
            ),
          )
        ]),
        Row(children: [
          const Icon(Icons.location_on),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              userInfo.address1,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 15,
              ),
            ),
            Text(
              userInfo.address2,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 15,
              ),
            )
          ]),
        ]),
      ]),
    );
  }
}

class UsrEducation extends StatelessWidget {
  final UserInfo userInfo;

  const UsrEducation({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: userInfo.education.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 220, 220, 220),
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
              padding: const EdgeInsets.all(10),
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: Image.asset(userInfo.education[index].logo,
                            fit: BoxFit.contain)),
                    const SizedBox(width: 30),
                    Expanded(
                        child: Text(
                      'Institution: ${userInfo.education[index].name} ',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.5,
                        fontSize: 15,
                      ),
                    )),
                    const SizedBox(width: 30),
                    Expanded(
                        child: Text(
                      'GPA: ${userInfo.education[index].gpa}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.5,
                        fontSize: 14,
                      ),
                    ))
                  ]));
        });
  }
}

class UsrProject extends StatelessWidget {
  final UserInfo userInfo;
  const UsrProject({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 220, 220, 220),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: userInfo.projects.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                right: index % 3 != 2
                    ? const BorderSide(color: Colors.grey, width: 0.5)
                    : BorderSide.none,
                bottom: const BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: Image.asset(
                    userInfo.projects[index].picture,
                    height: 140,
                    fit: BoxFit.fitHeight,
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Name: ${userInfo.projects[index].name}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Date: ${userInfo.projects[index].date}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
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
//