import 'package:flutter/material.dart';

void main() {
  runApp(ImplicitAnimation());
}

class ImplicitAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double _width = 50;
  double rotation = 0;
  int page = 1;
  @override
  Widget build(BuildContext context) {
    if(page == 1)
    {
      return Scaffold(
        body: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 1200),
              height: MediaQuery.of(context).size.width * .3,
              width: _width,
              child: const FlutterLogo(),
              transform: Matrix4.rotationZ(rotation),
              curve: Curves.easeInOutCubicEmphasized,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _width = 50;
                      });
                    },
                    child: const Text('Diminuir')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _width = 300;
                      });
                    },
                    child: const Text('Aumentar')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        page++;
                      });
                    },
                    child: const Text('Próximo')),
              ],
            ),
          ],
        ),
      );
    }
    else
    {
      return Scaffold(
        body: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 1200),
              height: MediaQuery.of(context).size.width * .3,
              width: _width,
              child: const FlutterLogo(),
              curve: Curves.easeInOutCubicEmphasized,
              transform: Matrix4.rotationZ(rotation),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        rotation = 0;
                      });
                    },
                    child: const Text('Normalizar')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        rotation = 360;
                      });
                    },
                    child: const Text('Inverter')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        page--;
                      });
                    },
                    child: const Text('Próximo')),
              ],
            ),
          ],
        ),
      );
    }
  }
}