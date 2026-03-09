// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryEventModel {

 String get id; String get date; int get year; String get title; String get description; String get image; String get country;
/// Create a copy of HistoryEventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryEventModelCopyWith<HistoryEventModel> get copyWith => _$HistoryEventModelCopyWithImpl<HistoryEventModel>(this as HistoryEventModel, _$identity);

  /// Serializes this HistoryEventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.year, year) || other.year == year)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,year,title,description,image,country);

@override
String toString() {
  return 'HistoryEventModel(id: $id, date: $date, year: $year, title: $title, description: $description, image: $image, country: $country)';
}


}

/// @nodoc
abstract mixin class $HistoryEventModelCopyWith<$Res>  {
  factory $HistoryEventModelCopyWith(HistoryEventModel value, $Res Function(HistoryEventModel) _then) = _$HistoryEventModelCopyWithImpl;
@useResult
$Res call({
 String id, String date, int year, String title, String description, String image, String country
});




}
/// @nodoc
class _$HistoryEventModelCopyWithImpl<$Res>
    implements $HistoryEventModelCopyWith<$Res> {
  _$HistoryEventModelCopyWithImpl(this._self, this._then);

  final HistoryEventModel _self;
  final $Res Function(HistoryEventModel) _then;

/// Create a copy of HistoryEventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? year = null,Object? title = null,Object? description = null,Object? image = null,Object? country = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryEventModel].
extension HistoryEventModelPatterns on HistoryEventModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryEventModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryEventModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryEventModel value)  $default,){
final _that = this;
switch (_that) {
case _HistoryEventModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryEventModel value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryEventModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String date,  int year,  String title,  String description,  String image,  String country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryEventModel() when $default != null:
return $default(_that.id,_that.date,_that.year,_that.title,_that.description,_that.image,_that.country);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String date,  int year,  String title,  String description,  String image,  String country)  $default,) {final _that = this;
switch (_that) {
case _HistoryEventModel():
return $default(_that.id,_that.date,_that.year,_that.title,_that.description,_that.image,_that.country);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String date,  int year,  String title,  String description,  String image,  String country)?  $default,) {final _that = this;
switch (_that) {
case _HistoryEventModel() when $default != null:
return $default(_that.id,_that.date,_that.year,_that.title,_that.description,_that.image,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryEventModel implements HistoryEventModel {
  const _HistoryEventModel({required this.id, required this.date, required this.year, required this.title, required this.description, required this.image, required this.country});
  factory _HistoryEventModel.fromJson(Map<String, dynamic> json) => _$HistoryEventModelFromJson(json);

@override final  String id;
@override final  String date;
@override final  int year;
@override final  String title;
@override final  String description;
@override final  String image;
@override final  String country;

/// Create a copy of HistoryEventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryEventModelCopyWith<_HistoryEventModel> get copyWith => __$HistoryEventModelCopyWithImpl<_HistoryEventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryEventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.year, year) || other.year == year)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,year,title,description,image,country);

@override
String toString() {
  return 'HistoryEventModel(id: $id, date: $date, year: $year, title: $title, description: $description, image: $image, country: $country)';
}


}

/// @nodoc
abstract mixin class _$HistoryEventModelCopyWith<$Res> implements $HistoryEventModelCopyWith<$Res> {
  factory _$HistoryEventModelCopyWith(_HistoryEventModel value, $Res Function(_HistoryEventModel) _then) = __$HistoryEventModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String date, int year, String title, String description, String image, String country
});




}
/// @nodoc
class __$HistoryEventModelCopyWithImpl<$Res>
    implements _$HistoryEventModelCopyWith<$Res> {
  __$HistoryEventModelCopyWithImpl(this._self, this._then);

  final _HistoryEventModel _self;
  final $Res Function(_HistoryEventModel) _then;

/// Create a copy of HistoryEventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? year = null,Object? title = null,Object? description = null,Object? image = null,Object? country = null,}) {
  return _then(_HistoryEventModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
