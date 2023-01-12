// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flame/components.dart';

import '../doodle_dash.dart';

// It won't be a detailed section of the codelab, as its not Flame specific
/// 管理游戏的难度级别以及玩家升级时的任何相关游戏配置。
/// 游戏提供了五个难度级别——玩家在达到得分里程碑之一时进入下一个关卡。
/// 级别的每一次增加都会增加难度，进一步的Dash必须跳跃。
/// 由于整个游戏中的重力是恒定的，跳跃速度会逐渐提高，以解释更远的距离。
/// 每当玩家通过平台时，玩家的分数就会增加。
/// 当玩家达到一定的积分阈值时，游戏会提高水平并解锁新的特殊平台，使游戏更有趣和更具挑战性。
class LevelManager extends Component with HasGameRef<DoodleDash> {
  LevelManager({this.selectedLevel = 1, this.level = 1});

  int selectedLevel; // level that the player selects at the beginning
  int level; // current level
  // Configurations for different levels of difficulty,
  //the higher level the further away Dash may need to jump. Since
  // gravity is constant, jumpSpeed needs to accomodate for further distance.
  // Score indicates the score needed to be acheived to "level up"
  final Map<int, Difficulty> levelsConfig = {
    1: const Difficulty(
        minDistance: 200, maxDistance: 300, jumpSpeed: 600, score: 0),
    2: const Difficulty(
        minDistance: 200, maxDistance: 400, jumpSpeed: 650, score: 20),
    3: const Difficulty(
        minDistance: 200, maxDistance: 500, jumpSpeed: 700, score: 40),
    4: const Difficulty(
        minDistance: 200, maxDistance: 600, jumpSpeed: 750, score: 80),
    5: const Difficulty(
        minDistance: 200, maxDistance: 700, jumpSpeed: 800, score: 100),
  };

  double get minDistance {
    return levelsConfig[level]!.minDistance;
  }

  double get maxDistance {
    return levelsConfig[level]!.maxDistance;
  }

  double get startingJumpSpeed {
    return levelsConfig[selectedLevel]!.jumpSpeed;
  }

  double get jumpSpeed {
    return levelsConfig[level]!.jumpSpeed;
  }

  Difficulty get difficulty {
    return levelsConfig[level]!;
  }

  bool shouldLevelUp(int score) {
    int nextLevel = level + 1;

    if (levelsConfig.containsKey(nextLevel)) {
      return levelsConfig[nextLevel]!.score == score;
    }

    return false;
  }

  List<int> get levels {
    return levelsConfig.keys.toList();
  }

  void increaseLevel() {
    if (level < levelsConfig.keys.length) {
      level++;
    }
  }

  void setLevel(int newLevel) {
    if (levelsConfig.containsKey(newLevel)) {
      level = newLevel;
    }
  }

  void selectLevel(int selectLevel) {
    if (levelsConfig.containsKey(selectLevel)) {
      selectedLevel = selectLevel;
    }
  }

  void reset() {
    level = selectedLevel;
  }
}

class Difficulty {
  final double minDistance;
  final double maxDistance;
  final double jumpSpeed;
  final int score;

  const Difficulty(
      {required this.minDistance,
      required this.maxDistance,
      required this.jumpSpeed,
      required this.score});
}
