import 'package:flutter/material.dart';
import 'package:proyek1/second_page.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff881736),
                Color.fromARGB(255, 63, 39, 45),
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 05.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Image.asset(
                  'assets/images/image.png',
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome To Danau Toba",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman kedua saat tombol ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage()),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'View More',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rotua Eka Wati",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.facebook,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.wallet,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.snapchat,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
