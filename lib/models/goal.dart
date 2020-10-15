import 'dart:ui';

import 'package:flutter/material.dart';

class Goal {
  Goal({this.name, this.emoji, this.progress, this.target, this.color});

  final String name;
  final String emoji;
  final double progress;
  final double target;
  final Color color;

  get completed {
    return this.target == this.progress;
  }

  get icon {

    return Text(
      this.emoji,
      style: TextStyle(fontSize: 20),
    );
  }

  get completedPercentage {
    return (progress / target) * 100;
  }
}

