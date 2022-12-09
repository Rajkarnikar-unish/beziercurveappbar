import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            child: Container(
              width: size.width,
              height: 80,
              color: Colors.white,
              child: CustomPaint(
                size: Size(size.width, 80),
                painter: TryCustomPainter(),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.7,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.orange,
                      elevation: 0.1,
                      child: const Icon(
                        Icons.shopping_basket,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TryCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 10);

    // path.quadraticBezierTo(size.width * 0.05, y1, x2, y2)
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);

    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(
      Offset(size.width * 0.60, 20),
      radius: const Radius.circular(10),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
