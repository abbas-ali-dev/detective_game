import 'dart:convert';

import 'package:detective_game/models/room_model.dart';
import 'package:detective_game/models/witness_chat_model.dart';
import 'package:flutter/services.dart';

class MyMockupData {
  static final MyMockupData _instance = MyMockupData._internal();

  static MyMockupData get instance => _instance;

  factory MyMockupData() {
    return _instance;
  }

  MyMockupData._internal();

  final List<WitnessChatModel> witnessChats = [];
  final List<RoomModel> rooms = [];

  Future<void> init() async {
    await _readWitnessChatsJson();
    await _readRoomsJson();
  }

  Future<void> _readWitnessChatsJson() async {
    final String response =
        await rootBundle.loadString('assets/data/witness_chats.json');
    final List<dynamic> data = await json.decode(response);

    final chats = data.map<WitnessChatModel>((e) {
      final chat = WitnessChatModel.fromJson(e);
      return chat;
    }).toList();

    witnessChats.addAll(chats);
  }

  Future<void> _readRoomsJson() async {
    final String response =
        await rootBundle.loadString('assets/data/rooms.json');
    final List<dynamic> data = await json.decode(response);

    final allRooms = data.map<RoomModel>((e) {
      final room = RoomModel.fromJson(e);
      return room;
    }).toList();

    rooms.addAll(allRooms);
  }
}
