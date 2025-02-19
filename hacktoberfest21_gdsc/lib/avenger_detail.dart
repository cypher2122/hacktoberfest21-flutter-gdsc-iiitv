import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'avengers.dart';

class AvengerDetail extends StatelessWidget {
  final Data data;

  const AvengerDetail({required this.data});

  bodyWidget(BuildContext context) => Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height / 1.6,
            width: MediaQuery.of(context).size.width - 20.0,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.12,
            child: Container(
              color: Colors.transparent.withOpacity(0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  Text(
                    data.name!,
                    style: const TextStyle(
                        fontSize: 32.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Text(data.batch!,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            launch(data.githubURL!);
                            debugPrint("${data.githubURL}");
                          },
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset('assets/icon/GitHub.png')),
                        ),
                        InkWell(
                          onTap: () {
                            launch(data.linkedinURL!);
                            debugPrint("${data.linkedinURL}");
                          },
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset('assets/icon/Linkedin.png')),
                        )
                      ]),
                ],
              ),
            ),
          ),
          Positioned(
            height: MediaQuery.of(context).size.height - 20,
            width: MediaQuery.of(context).size.width - 20.0,
            left: 10.0,
            top: 10.0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Hero(
                  tag: data.imgURL!,
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(data.imgURL!),
                    )),
                  )),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.9),
      appBar: AppBar(
        centerTitle: true,
        title: Text(data.name!),
      ),
      body: Container(
          child: bodyWidget(context),
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/icon/Badge.png')))),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          child: InkWell(
            child: Container(
              color: Colors.teal,
              height: MediaQuery.of(context).size.height / 20,
              // ng: EdgeInsets.all(8.0),paddi
              child: const Center(
                child: Text(
                  "</> by GDSC",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            onTap: () => launch(
                'https://iiitv.github.io/hacktoberfest21-flutter-gdsc-iiitv/'),
          ),
        ),
      ),
    );
  }
}
