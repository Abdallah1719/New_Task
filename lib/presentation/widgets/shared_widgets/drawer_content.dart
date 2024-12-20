import 'package:flutter/material.dart';
import 'package:notes/presentation/screens/to_do_screen.dart';
import 'package:notes/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        // ElevatedButton(
        //   child: Row(
        //     children: [
        //       Icon(Icons.fork_right),
        //       Text('ToDo'),
        //     ],
        //   ),
        //   iconAlignment: IconAlignment.start,
        //   style: ButtonStyle(),
        //   onPressed: null,
        // ),
        ElevatedButton.icon(
          icon: const Icon(
            Icons.add_circle,
            color: beige,
          ),
          onHover: (value) {},
          onPressed: () {
            // log('${ModalRoute.of(context)?.settings.name}');
            if (ModalRoute.of(context)?.settings.name == null) {
              Navigator.popUntil(context, (predicate) {
                return predicate.settings.name == '/';
              });
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
            }
          },
          label: const Text(
            "Notes",
            style: TextStyle(fontSize: 16, color: beige),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: darkBlue,
            fixedSize: const Size(208, 43),
            overlayColor: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          icon: const Icon(
            Icons.add_circle,
            color: beige,
          ),
          onHover: (value) {},
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TodoScreen()),
            );
          },
          label: const Text(
            "TO Do",
            style: TextStyle(fontSize: 16, color: beige),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: darkBlue,
            fixedSize: const Size(208, 43),
            overlayColor: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          icon: const Icon(
            Icons.link,
            color: beige,
          ),
          onHover: (value) {},
          onPressed: () {
            _launchUrl();
          },
          label: const Text(
            "Privacy Policy",
            style: TextStyle(fontSize: 16, color: beige),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: darkBlue,
            fixedSize: const Size(208, 43),
            overlayColor: Colors.white,
          ),
        )
      ],
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(
        'https://www.termsfeed.com/live/a1e18794-fae7-4bd5-8442-fafd16578812'))) {
      throw Exception(
          'Could not launch https://www.termsfeed.com/live/a1e18794-fae7-4bd5-8442-fafd16578812');
    }
  }
}
