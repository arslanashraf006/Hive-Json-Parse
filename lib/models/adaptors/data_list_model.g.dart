// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../data_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataListAdapter extends TypeAdapter<DataList> {
  @override
  final int typeId = 2;

  @override
  DataList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataList(
      dataList: (fields[0] as List).cast<Data>(),
    );
  }

  @override
  void write(BinaryWriter writer, DataList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.dataList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
