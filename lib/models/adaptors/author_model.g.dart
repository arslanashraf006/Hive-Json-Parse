// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../author_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AutherAdapter extends TypeAdapter<Auther> {
  @override
  final int typeId = 1;

  @override
  Auther read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Auther(
      firstname: fields[0] as String,
      lastname: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Auther obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.firstname)
      ..writeByte(1)
      ..write(obj.lastname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AutherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
