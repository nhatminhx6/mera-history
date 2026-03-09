// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hero_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HeroModel {

 int get id; String get name; int get born; int get died; String get description; String get image; String get role; String get period;
/// Create a copy of HeroModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeroModelCopyWith<HeroModel> get copyWith => _$HeroModelCopyWithImpl<HeroModel>(this as HeroModel, _$identity);

  /// Serializes this HeroModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeroModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.born, born) || other.born == born)&&(identical(other.died, died) || other.died == died)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.role, role) || other.role == role)&&(identical(other.period, period) || other.period == period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,born,died,description,image,role,period);

@override
String toString() {
  return 'HeroModel(id: $id, name: $name, born: $born, died: $died, description: $description, image: $image, role: $role, period: $period)';
}


}

/// @nodoc
abstract mixin class $HeroModelCopyWith<$Res>  {
  factory $HeroModelCopyWith(HeroModel value, $Res Function(HeroModel) _then) = _$HeroModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, int born, int died, String description, String image, String role, String period
});




}
/// @nodoc
class _$HeroModelCopyWithImpl<$Res>
    implements $HeroModelCopyWith<$Res> {
  _$HeroModelCopyWithImpl(this._self, this._then);

  final HeroModel _self;
  final $Res Function(HeroModel) _then;

/// Create a copy of HeroModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? born = null,Object? died = null,Object? description = null,Object? image = null,Object? role = null,Object? period = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,born: null == born ? _self.born : born // ignore: cast_nullable_to_non_nullable
as int,died: null == died ? _self.died : died // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HeroModel].
extension HeroModelPatterns on HeroModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HeroModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HeroModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HeroModel value)  $default,){
final _that = this;
switch (_that) {
case _HeroModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HeroModel value)?  $default,){
final _that = this;
switch (_that) {
case _HeroModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int born,  int died,  String description,  String image,  String role,  String period)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HeroModel() when $default != null:
return $default(_that.id,_that.name,_that.born,_that.died,_that.description,_that.image,_that.role,_that.period);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int born,  int died,  String description,  String image,  String role,  String period)  $default,) {final _that = this;
switch (_that) {
case _HeroModel():
return $default(_that.id,_that.name,_that.born,_that.died,_that.description,_that.image,_that.role,_that.period);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int born,  int died,  String description,  String image,  String role,  String period)?  $default,) {final _that = this;
switch (_that) {
case _HeroModel() when $default != null:
return $default(_that.id,_that.name,_that.born,_that.died,_that.description,_that.image,_that.role,_that.period);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HeroModel implements HeroModel {
  const _HeroModel({required this.id, required this.name, required this.born, required this.died, required this.description, required this.image, required this.role, required this.period});
  factory _HeroModel.fromJson(Map<String, dynamic> json) => _$HeroModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  int born;
@override final  int died;
@override final  String description;
@override final  String image;
@override final  String role;
@override final  String period;

/// Create a copy of HeroModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeroModelCopyWith<_HeroModel> get copyWith => __$HeroModelCopyWithImpl<_HeroModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeroModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HeroModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.born, born) || other.born == born)&&(identical(other.died, died) || other.died == died)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.role, role) || other.role == role)&&(identical(other.period, period) || other.period == period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,born,died,description,image,role,period);

@override
String toString() {
  return 'HeroModel(id: $id, name: $name, born: $born, died: $died, description: $description, image: $image, role: $role, period: $period)';
}


}

/// @nodoc
abstract mixin class _$HeroModelCopyWith<$Res> implements $HeroModelCopyWith<$Res> {
  factory _$HeroModelCopyWith(_HeroModel value, $Res Function(_HeroModel) _then) = __$HeroModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int born, int died, String description, String image, String role, String period
});




}
/// @nodoc
class __$HeroModelCopyWithImpl<$Res>
    implements _$HeroModelCopyWith<$Res> {
  __$HeroModelCopyWithImpl(this._self, this._then);

  final _HeroModel _self;
  final $Res Function(_HeroModel) _then;

/// Create a copy of HeroModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? born = null,Object? died = null,Object? description = null,Object? image = null,Object? role = null,Object? period = null,}) {
  return _then(_HeroModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,born: null == born ? _self.born : born // ignore: cast_nullable_to_non_nullable
as int,died: null == died ? _self.died : died // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
