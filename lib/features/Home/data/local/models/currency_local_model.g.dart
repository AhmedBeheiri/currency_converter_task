// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyLocalModelAdapter extends TypeAdapter<CurrencyLocalModel> {
  @override
  final int typeId = 0;

  @override
  CurrencyLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyLocalModel(
      code: fields[0] as String,
      name: fields[1] as String,
      symbol: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyLocalModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.symbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
