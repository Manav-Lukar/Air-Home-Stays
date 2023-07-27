import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'product_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _numPages = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return _buildPage(index);
            },
            itemCount: _numPages,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildNavigationText(),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {

    List<String> titles = [
      "Welcome to Air Home Stay",
      "Discover Amazing Stays",
      "Start Booking Now!",
    ];

    List<String> descriptions = [
      "Find the perfect place to stay for your next trip.",
      "Explore unique homes and experience the local culture.",
      "Book your next home stay and make unforgettable memories.",
    ];

    List<String> images = [
      "assets/first.jpg",
      "assets/second.jpg",
      "assets/third.jpg",
    ];

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            images[index],
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              margin: EdgeInsets.only(bottom: 200.0),
              color: Colors.black54,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    titles[index],
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    descriptions[index],
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationText() {
    return GestureDetector(
      onTap: () {
        if (_currentPage < _numPages - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 1),
            curve: Curves.ease,
          );
        } else {
          // Navigate to the SignUp/Login Screen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  SignUpScreen(),
            ),
          );
        }
      },
      onDoubleTap: () {
        if (_currentPage > 0) {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 1),
            curve: Curves.ease,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentPage > 0)
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 28.0,
              ),
            SizedBox(width: 20.0),
            Text(
              _currentPage == _numPages - 1 ? "Tap to Get Started" : "Tap to Continue",
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 20.0),
            if (_currentPage < _numPages - 1)
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 28.0,
              ),
          ],
        ),
      ),
    );
  }
}
