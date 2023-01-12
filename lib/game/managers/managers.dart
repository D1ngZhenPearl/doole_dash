// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// 状态管理

// lib/game/managers目录包含三个处理Doodle Dash状态管理的文件：game_manager.dart、object_manager.dart和 level_manager.dart。

// GameManager类（在game_manager.dart中）跟踪整体游戏状态和记分。

// ObjectManager类（在object_manager.dart中）管理平台生成和删除的位置和时间。你稍后会加入这个班级。

// 最后，LevelManager类（在vel_manager.dart中）管理游戏的难度级别以及玩家升级时的任何相关游戏配置。游戏提供了五个难度级别——玩家在达到得分里程碑之一时进入下一个关卡。级别的每次增加都会增加难度，进一步的Dash必须跳跃。由于整个游戏中的重力是恒定的，跳跃速度会逐渐提高，以解释更远的距离。

// 每当玩家通过平台时，玩家的分数就会增加。当玩家达到一定的积分阈值时，游戏会提高水平并解锁新的特殊平台，使游戏更有趣和更具挑战性。
export 'game_manager.dart';
export 'level_manager.dart';
export 'object_manager.dart';
