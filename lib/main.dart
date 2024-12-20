import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black, // Dark background color
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Text(
                  "Case Studies",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White for dark mode
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Solving user & business problems since last 15+ years.\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do\n"
                      "eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  style: GoogleFonts.ibmPlexMono(
                    fontSize: 16,
                    color: const Color(0xFF9C9C9C),
                  ),
                ),
                const SizedBox(height: 24),
                _buildCaseStudy(
                  category: "Fintech",
                  title: "Work name here",
                  description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  imagePath: 'assets/image 2.png',
                  buttonColor: Colors.orange,
                  imageFirst: false,
                ),
                const SizedBox(height: 16),
                _buildCaseStudy(
                  category: "EdTech",
                  title: "Work name here",
                  description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  imagePath: 'assets/image 1.png',
                  buttonColor: const Color(0xFF000AFF),
                  imageFirst: true,
                ),
                const SizedBox(height: 16),
                _buildCaseStudy(
                  category: "Pharma",
                  title: "Work name here",
                  description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  imagePath: 'assets/image 3.png',
                  buttonColor: const Color(0xFF2AB090),
                  imageFirst: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildCaseStudy({
  required String category,
  required String title,
  required String description,
  required String imagePath,
  required Color buttonColor,
  required bool imageFirst,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (imageFirst)
        _buildImage(imagePath)
      else
        _buildText(category, title, description, buttonColor),
      const SizedBox(width: 16),
      if (!imageFirst)
        _buildImage(imagePath)
      else
        _buildText(category, title, description, buttonColor),
    ],
  );
}

Widget _buildImage(String imagePath) {
  return Expanded(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _buildText(String category, String title, String description, Color buttonColor) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            category,
            style: GoogleFonts.ibmPlexMono(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.raleway(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: GoogleFonts.ibmPlexMono(
            color: Colors.white70, // Subtle grey text for dark mode
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shadowColor: buttonColor.withOpacity(0.5),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "View case study",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward,
                size: 16,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

