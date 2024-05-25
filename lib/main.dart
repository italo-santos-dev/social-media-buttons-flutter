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
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMediaButton(
                icon: FontAwesomeIcons.facebook,
                url: "https://www.facebook.com/italosantosdev/",
              ),
              SocialMediaButton(
                icon: FontAwesomeIcons.instagram,
                url: 'https://www.instagram.com/italo.santos.dev/',
              ),
              SocialMediaButton(
                icon: FontAwesomeIcons.youtube,
                url: 'https://www.youtube.com/@italosantosdev',
              ),
              SocialMediaButton(
                icon: FontAwesomeIcons.tiktok,
                url: 'https://www.tiktok.com/@italosantosdev',
              )
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

  void _launchURL(BuildContext context) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      final bool launched = await launchUrl(uri,
          mode: LaunchMode.externalApplication);
      if (!launched) {
        final snackBar = SnackBar(content: Text('Could not launch $url'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      final snackBar = SnackBar(content: Text('Could not launch $url'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => _launchURL(context),
        borderRadius: BorderRadius.circular(50),
        splashColor: Colors.white24,
        highlightColor: Colors.white10,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: FaIcon(icon, color: Colors.white,),
        ),
      ),
    );
  }
}