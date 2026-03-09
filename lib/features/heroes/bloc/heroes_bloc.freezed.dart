// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heroes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HeroesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeroesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HeroesEvent()';
}


}

/// @nodoc
class $HeroesEventCopyWith<$Res>  {
$HeroesEventCopyWith(HeroesEvent _, $Res Function(HeroesEvent) __);
}


/// Adds pattern-matching-related methods to [HeroesEvent].
extension HeroesEventPatterns on HeroesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadHeroes value)?  loadHeroes,TResult Function( _LoadHeroDetail value)?  loadHeroDetail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadHeroes() when loadHeroes != null:
return loadHeroes(_that);case _LoadHeroDetail() when loadHeroDetail != null:
return loadHeroDetail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadHeroes value)  loadHeroes,required TResult Function( _LoadHeroDetail value)  loadHeroDetail,}){
final _that = this;
switch (_that) {
case _LoadHeroes():
return loadHeroes(_that);case _LoadHeroDetail():
return loadHeroDetail(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadHeroes value)?  loadHeroes,TResult? Function( _LoadHeroDetail value)?  loadHeroDetail,}){
final _that = this;
switch (_that) {
case _LoadHeroes() when loadHeroes != null:
return loadHeroes(_that);case _LoadHeroDetail() when loadHeroDetail != null:
return loadHeroDetail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadHeroes,TResult Function( int heroId)?  loadHeroDetail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadHeroes() when loadHeroes != null:
return loadHeroes();case _LoadHeroDetail() when loadHeroDetail != null:
return loadHeroDetail(_that.heroId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadHeroes,required TResult Function( int heroId)  loadHeroDetail,}) {final _that = this;
switch (_that) {
case _LoadHeroes():
return loadHeroes();case _LoadHeroDetail():
return loadHeroDetail(_that.heroId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadHeroes,TResult? Function( int heroId)?  loadHeroDetail,}) {final _that = this;
switch (_that) {
case _LoadHeroes() when loadHeroes != null:
return loadHeroes();case _LoadHeroDetail() when loadHeroDetail != null:
return loadHeroDetail(_that.heroId);case _:
  return null;

}
}

}

/// @nodoc


class _LoadHeroes implements HeroesEvent {
  const _LoadHeroes();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadHeroes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HeroesEvent.loadHeroes()';
}


}




/// @nodoc


class _LoadHeroDetail implements HeroesEvent {
  const _LoadHeroDetail(this.heroId);
  

 final  int heroId;

/// Create a copy of HeroesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadHeroDetailCopyWith<_LoadHeroDetail> get copyWith => __$LoadHeroDetailCopyWithImpl<_LoadHeroDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadHeroDetail&&(identical(other.heroId, heroId) || other.heroId == heroId));
}


@override
int get hashCode => Object.hash(runtimeType,heroId);

@override
String toString() {
  return 'HeroesEvent.loadHeroDetail(heroId: $heroId)';
}


}

/// @nodoc
abstract mixin class _$LoadHeroDetailCopyWith<$Res> implements $HeroesEventCopyWith<$Res> {
  factory _$LoadHeroDetailCopyWith(_LoadHeroDetail value, $Res Function(_LoadHeroDetail) _then) = __$LoadHeroDetailCopyWithImpl;
@useResult
$Res call({
 int heroId
});




}
/// @nodoc
class __$LoadHeroDetailCopyWithImpl<$Res>
    implements _$LoadHeroDetailCopyWith<$Res> {
  __$LoadHeroDetailCopyWithImpl(this._self, this._then);

  final _LoadHeroDetail _self;
  final $Res Function(_LoadHeroDetail) _then;

/// Create a copy of HeroesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? heroId = null,}) {
  return _then(_LoadHeroDetail(
null == heroId ? _self.heroId : heroId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$HeroesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeroesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HeroesState()';
}


}

/// @nodoc
class $HeroesStateCopyWith<$Res>  {
$HeroesStateCopyWith(HeroesState _, $Res Function(HeroesState) __);
}


/// Adds pattern-matching-related methods to [HeroesState].
extension HeroesStatePatterns on HeroesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<HeroModel> heroes,  HeroModel? selectedHero,  List<HistoryEventModel> relatedEvents)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.heroes,_that.selectedHero,_that.relatedEvents);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<HeroModel> heroes,  HeroModel? selectedHero,  List<HistoryEventModel> relatedEvents)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.heroes,_that.selectedHero,_that.relatedEvents);case _Error():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<HeroModel> heroes,  HeroModel? selectedHero,  List<HistoryEventModel> relatedEvents)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.heroes,_that.selectedHero,_that.relatedEvents);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements HeroesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HeroesState.initial()';
}


}




/// @nodoc


class _Loading implements HeroesState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HeroesState.loading()';
}


}




/// @nodoc


class _Loaded implements HeroesState {
  const _Loaded({required final  List<HeroModel> heroes, this.selectedHero, final  List<HistoryEventModel> relatedEvents = const []}): _heroes = heroes,_relatedEvents = relatedEvents;
  

 final  List<HeroModel> _heroes;
 List<HeroModel> get heroes {
  if (_heroes is EqualUnmodifiableListView) return _heroes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_heroes);
}

 final  HeroModel? selectedHero;
 final  List<HistoryEventModel> _relatedEvents;
@JsonKey() List<HistoryEventModel> get relatedEvents {
  if (_relatedEvents is EqualUnmodifiableListView) return _relatedEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_relatedEvents);
}


/// Create a copy of HeroesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._heroes, _heroes)&&(identical(other.selectedHero, selectedHero) || other.selectedHero == selectedHero)&&const DeepCollectionEquality().equals(other._relatedEvents, _relatedEvents));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_heroes),selectedHero,const DeepCollectionEquality().hash(_relatedEvents));

@override
String toString() {
  return 'HeroesState.loaded(heroes: $heroes, selectedHero: $selectedHero, relatedEvents: $relatedEvents)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $HeroesStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<HeroModel> heroes, HeroModel? selectedHero, List<HistoryEventModel> relatedEvents
});


$HeroModelCopyWith<$Res>? get selectedHero;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of HeroesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? heroes = null,Object? selectedHero = freezed,Object? relatedEvents = null,}) {
  return _then(_Loaded(
heroes: null == heroes ? _self._heroes : heroes // ignore: cast_nullable_to_non_nullable
as List<HeroModel>,selectedHero: freezed == selectedHero ? _self.selectedHero : selectedHero // ignore: cast_nullable_to_non_nullable
as HeroModel?,relatedEvents: null == relatedEvents ? _self._relatedEvents : relatedEvents // ignore: cast_nullable_to_non_nullable
as List<HistoryEventModel>,
  ));
}

/// Create a copy of HeroesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeroModelCopyWith<$Res>? get selectedHero {
    if (_self.selectedHero == null) {
    return null;
  }

  return $HeroModelCopyWith<$Res>(_self.selectedHero!, (value) {
    return _then(_self.copyWith(selectedHero: value));
  });
}
}

/// @nodoc


class _Error implements HeroesState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of HeroesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HeroesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $HeroesStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of HeroesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
