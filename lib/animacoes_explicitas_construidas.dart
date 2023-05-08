import 'package:flutter/material.dart';

class AnimacoesExplicitasConstruidas extends StatefulWidget {
  const AnimacoesExplicitasConstruidas({super.key});

  @override
  State<AnimacoesExplicitasConstruidas> createState() =>
      _AnimacoesExplicitasConstruidasState();
}

class _AnimacoesExplicitasConstruidasState
    extends State<AnimacoesExplicitasConstruidas>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  AnimationStatus? _animationStatus;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..repeat()
          ..addStatusListener((status) {
            _animationStatus = status;
          });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: 300,
            height: 400,
            child: RotationTransition(
              alignment: Alignment.center,
              turns: _animationController ?? const AlwaysStoppedAnimation(0),
              child: Image.asset("imagens/logo.png"),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_animationStatus == AnimationStatus.dismissed) {
                  _animationController?.repeat();
                } else {
                  _animationController?.reverse();
                }

                // if (_animationController.isAnimating) {
                //   _animationController.stop();
                // } else {
                //   _animationController.repeat();
                // }
              },
              child: const Text("Pressione"))
        ],
      ),
    );
  }
}
