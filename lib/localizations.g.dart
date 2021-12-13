// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizations.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

final localizedLabels = <Locale, AppLocalizationsData>{
  Locale.fromSubtags(languageCode: 'id'): const AppLocalizationsData(
    helloWorld: 'Hallo Dunia',
  ),
  Locale.fromSubtags(languageCode: 'en'): const AppLocalizationsData(
    helloWorld: 'Hello Wolrd',
  ),
};

class AppLocalizationsData {
  const AppLocalizationsData({
    required this.helloWorld,
  });

  final String helloWorld;
  factory AppLocalizationsData.fromJson(Map<String, Object?> map) =>
      AppLocalizationsData(
        helloWorld: map['helloWorld']! as String,
      );

  AppLocalizationsData copyWith({
    String? helloWorld,
  }) =>
      AppLocalizationsData(
        helloWorld: helloWorld ?? this.helloWorld,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsData && helloWorld == other.helloWorld);
  @override
  int get hashCode => runtimeType.hashCode ^ helloWorld.hashCode;
}
