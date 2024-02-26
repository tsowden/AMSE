import 'package:flutter/material.dart';

class Exo2bScreen extends StatefulWidget {
  const Exo2bScreen({super.key});

  @override
  _Exo2bScreenState createState() => _Exo2bScreenState();
}

class _Exo2bScreenState extends State<Exo2bScreen> {
  bool _mirrorEffect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exo 2 : Transformer une image'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(0.78),
                      child: Image.network(
                        'https://picsum.photos/512/1024',
                        key: UniqueKey(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    CustomPaint(
                      painter: AxesPainter(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Effet miroir'),
                  Checkbox(
                    value: _mirrorEffect,
                    onChanged: (value) {
                      setState(() {
                        _mirrorEffect = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AxesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    canvas.drawLine(Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);

    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
