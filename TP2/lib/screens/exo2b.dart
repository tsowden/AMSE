import 'package:flutter/material.dart';


class Exo2bScreen extends StatefulWidget {
  const Exo2bScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Exo2bScreenState createState() => _Exo2bScreenState();
}

class _Exo2bScreenState extends State<Exo2bScreen> {
  double _rotationAngle = 0.0;
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
                      transform: Matrix4.identity()
                        ..rotateZ(_mirrorEffect ? -_rotationAngle : _rotationAngle)
                        ..scale(_mirrorEffect ? -1.0 : 1.0),
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
                  const Text(
                    'Rotation',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    value: _rotationAngle,
                    min: 0.0,
                    max: 360.0,
                    onChanged: (value) {
                      setState(() {
                        _rotationAngle = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Mirror Effect',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
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
