import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF2F3336),
        appBar: AppBar(
          title: Text('Botões de Redes Sociais'),
          backgroundColor: Color(0xFF2F3336),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMediaButton(
                icon: FontAwesomeIcons.facebook,
                url: 'https://www.facebook.com',
              ),
              SocialMediaButton(
                icon: FontAwesomeIcons.twitter,
                url: 'https://www.twitter.com',
              ),
              SocialMediaButton(
                icon: FontAwesomeIcons.instagram,
                url: 'https://www.instagram.com',
              ),
              SocialMediaButton(
                icon: FontAwesomeIcons.youtube,
                url: 'https://www.youtube.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final String url;

  SocialMediaButton({required this.icon, required this.url});

  void _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon, color: Colors.white),
      onPressed: _launchURL,
    );
  }
}

