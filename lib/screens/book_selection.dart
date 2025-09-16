import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookSelectionScreen extends StatelessWidget {
  const BookSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _roundButton(
                        "lib/assets/icons/back_btn1.png",

                        onTap: () {},
                      ),
                      _roundButton(
                        "lib/assets/images/book.png",
                        onTap: () {
                          context.go('/story');
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 54),

                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: [
                      _bookCard(
                        color: Colors.yellow.shade200,
                        image: "lib/assets/images/tobyadd.png",
                      ),
                      _bookCard(
                        color: Colors.lightBlue.shade200,
                        image: "lib/assets/images/tulipadd.png",
                      ),
                      _bookCard(
                        color: Colors.green.shade200,
                        image: "lib/assets/images/kosmoadd.png",
                      ),
                      _bookCard(
                        color: Colors.yellow.shade200,
                        image: "lib/assets/images/tobyadd.png",
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [
                      _roundButton(
                        "lib/assets/icons/arrow_down.png",

                        onTap: () {},
                      ),
                      const SizedBox(height: 26),
                      _roundButton(
                        "lib/assets/icons/home_btn.png",

                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bookCard({required Color color, required String image}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 160, fit: BoxFit.contain),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _roundButton(String asset, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        padding: const EdgeInsets.all(12),

        child: Image.asset(asset, height: 68, width: 68, fit: BoxFit.contain),
      ),
    );
  }
}
