import 'package:flutter/foundation.dart';

enum Character {
  colonel,
  artist,
  cook,
  nurse,
  policeman,
  doctor,
  nun,
}

extension CharacterExtension on Character {
  String get value => describeEnum(this);
}
