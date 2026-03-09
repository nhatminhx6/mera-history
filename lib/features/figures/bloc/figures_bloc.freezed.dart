// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'figures_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FiguresEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FiguresEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FiguresEvent()';
}


}

/// @nodoc
class $FiguresEventCopyWith<$Res>  {
$FiguresEventCopyWith(FiguresEvent _, $Res Function(FiguresEvent) __);
}


/// Adds pattern-matching-related methods to [FiguresEvent].
extension FiguresEventPatterns on FiguresEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FeedLoaded value)?  feedLoaded,TResult Function( _QueryChanged value)?  queryChanged,TResult Function( _FilterChanged value)?  filterChanged,TResult Function( _DetailLoaded value)?  detailLoaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedLoaded() when feedLoaded != null:
return feedLoaded(_that);case _QueryChanged() when queryChanged != null:
return queryChanged(_that);case _FilterChanged() when filterChanged != null:
return filterChanged(_that);case _DetailLoaded() when detailLoaded != null:
return detailLoaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FeedLoaded value)  feedLoaded,required TResult Function( _QueryChanged value)  queryChanged,required TResult Function( _FilterChanged value)  filterChanged,required TResult Function( _DetailLoaded value)  detailLoaded,}){
final _that = this;
switch (_that) {
case _FeedLoaded():
return feedLoaded(_that);case _QueryChanged():
return queryChanged(_that);case _FilterChanged():
return filterChanged(_that);case _DetailLoaded():
return detailLoaded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FeedLoaded value)?  feedLoaded,TResult? Function( _QueryChanged value)?  queryChanged,TResult? Function( _FilterChanged value)?  filterChanged,TResult? Function( _DetailLoaded value)?  detailLoaded,}){
final _that = this;
switch (_that) {
case _FeedLoaded() when feedLoaded != null:
return feedLoaded(_that);case _QueryChanged() when queryChanged != null:
return queryChanged(_that);case _FilterChanged() when filterChanged != null:
return filterChanged(_that);case _DetailLoaded() when detailLoaded != null:
return detailLoaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  feedLoaded,TResult Function( String query)?  queryChanged,TResult Function( FigureFilter filter)?  filterChanged,TResult Function( int figureId)?  detailLoaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedLoaded() when feedLoaded != null:
return feedLoaded();case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _FilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case _DetailLoaded() when detailLoaded != null:
return detailLoaded(_that.figureId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  feedLoaded,required TResult Function( String query)  queryChanged,required TResult Function( FigureFilter filter)  filterChanged,required TResult Function( int figureId)  detailLoaded,}) {final _that = this;
switch (_that) {
case _FeedLoaded():
return feedLoaded();case _QueryChanged():
return queryChanged(_that.query);case _FilterChanged():
return filterChanged(_that.filter);case _DetailLoaded():
return detailLoaded(_that.figureId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  feedLoaded,TResult? Function( String query)?  queryChanged,TResult? Function( FigureFilter filter)?  filterChanged,TResult? Function( int figureId)?  detailLoaded,}) {final _that = this;
switch (_that) {
case _FeedLoaded() when feedLoaded != null:
return feedLoaded();case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _FilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case _DetailLoaded() when detailLoaded != null:
return detailLoaded(_that.figureId);case _:
  return null;

}
}

}

/// @nodoc


class _FeedLoaded implements FiguresEvent {
  const _FeedLoaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedLoaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FiguresEvent.feedLoaded()';
}


}




/// @nodoc


class _QueryChanged implements FiguresEvent {
  const _QueryChanged(this.query);
  

 final  String query;

/// Create a copy of FiguresEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueryChangedCopyWith<_QueryChanged> get copyWith => __$QueryChangedCopyWithImpl<_QueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'FiguresEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class _$QueryChangedCopyWith<$Res> implements $FiguresEventCopyWith<$Res> {
  factory _$QueryChangedCopyWith(_QueryChanged value, $Res Function(_QueryChanged) _then) = __$QueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$QueryChangedCopyWithImpl<$Res>
    implements _$QueryChangedCopyWith<$Res> {
  __$QueryChangedCopyWithImpl(this._self, this._then);

  final _QueryChanged _self;
  final $Res Function(_QueryChanged) _then;

/// Create a copy of FiguresEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_QueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _FilterChanged implements FiguresEvent {
  const _FilterChanged(this.filter);
  

 final  FigureFilter filter;

/// Create a copy of FiguresEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterChangedCopyWith<_FilterChanged> get copyWith => __$FilterChangedCopyWithImpl<_FilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterChanged&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'FiguresEvent.filterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$FilterChangedCopyWith<$Res> implements $FiguresEventCopyWith<$Res> {
  factory _$FilterChangedCopyWith(_FilterChanged value, $Res Function(_FilterChanged) _then) = __$FilterChangedCopyWithImpl;
@useResult
$Res call({
 FigureFilter filter
});




}
/// @nodoc
class __$FilterChangedCopyWithImpl<$Res>
    implements _$FilterChangedCopyWith<$Res> {
  __$FilterChangedCopyWithImpl(this._self, this._then);

  final _FilterChanged _self;
  final $Res Function(_FilterChanged) _then;

/// Create a copy of FiguresEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(_FilterChanged(
null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as FigureFilter,
  ));
}


}

/// @nodoc


class _DetailLoaded implements FiguresEvent {
  const _DetailLoaded(this.figureId);
  

 final  int figureId;

/// Create a copy of FiguresEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailLoadedCopyWith<_DetailLoaded> get copyWith => __$DetailLoadedCopyWithImpl<_DetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailLoaded&&(identical(other.figureId, figureId) || other.figureId == figureId));
}


@override
int get hashCode => Object.hash(runtimeType,figureId);

@override
String toString() {
  return 'FiguresEvent.detailLoaded(figureId: $figureId)';
}


}

/// @nodoc
abstract mixin class _$DetailLoadedCopyWith<$Res> implements $FiguresEventCopyWith<$Res> {
  factory _$DetailLoadedCopyWith(_DetailLoaded value, $Res Function(_DetailLoaded) _then) = __$DetailLoadedCopyWithImpl;
@useResult
$Res call({
 int figureId
});




}
/// @nodoc
class __$DetailLoadedCopyWithImpl<$Res>
    implements _$DetailLoadedCopyWith<$Res> {
  __$DetailLoadedCopyWithImpl(this._self, this._then);

  final _DetailLoaded _self;
  final $Res Function(_DetailLoaded) _then;

/// Create a copy of FiguresEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? figureId = null,}) {
  return _then(_DetailLoaded(
null == figureId ? _self.figureId : figureId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$FiguresState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FiguresState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FiguresState()';
}


}

/// @nodoc
class $FiguresStateCopyWith<$Res>  {
$FiguresStateCopyWith(FiguresState _, $Res Function(FiguresState) __);
}


/// Adds pattern-matching-related methods to [FiguresState].
extension FiguresStatePatterns on FiguresState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Feed value)?  feed,TResult Function( _Detail value)?  detail,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Feed() when feed != null:
return feed(_that);case _Detail() when detail != null:
return detail(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Feed value)  feed,required TResult Function( _Detail value)  detail,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Feed():
return feed(_that);case _Detail():
return detail(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Feed value)?  feed,TResult? Function( _Detail value)?  detail,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Feed() when feed != null:
return feed(_that);case _Detail() when detail != null:
return detail(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<HeroModel> allFigures,  List<HeroModel> filteredFigures,  FigureFilter selectedFilter,  String query)?  feed,TResult Function( HeroModel? selectedFigure,  List<HistoryEventModel> relatedEvents)?  detail,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Feed() when feed != null:
return feed(_that.allFigures,_that.filteredFigures,_that.selectedFilter,_that.query);case _Detail() when detail != null:
return detail(_that.selectedFigure,_that.relatedEvents);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<HeroModel> allFigures,  List<HeroModel> filteredFigures,  FigureFilter selectedFilter,  String query)  feed,required TResult Function( HeroModel? selectedFigure,  List<HistoryEventModel> relatedEvents)  detail,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Feed():
return feed(_that.allFigures,_that.filteredFigures,_that.selectedFilter,_that.query);case _Detail():
return detail(_that.selectedFigure,_that.relatedEvents);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<HeroModel> allFigures,  List<HeroModel> filteredFigures,  FigureFilter selectedFilter,  String query)?  feed,TResult? Function( HeroModel? selectedFigure,  List<HistoryEventModel> relatedEvents)?  detail,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Feed() when feed != null:
return feed(_that.allFigures,_that.filteredFigures,_that.selectedFilter,_that.query);case _Detail() when detail != null:
return detail(_that.selectedFigure,_that.relatedEvents);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements FiguresState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FiguresState.initial()';
}


}




/// @nodoc


class _Loading implements FiguresState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FiguresState.loading()';
}


}




/// @nodoc


class _Feed implements FiguresState {
  const _Feed({required final  List<HeroModel> allFigures, required final  List<HeroModel> filteredFigures, required this.selectedFilter, required this.query}): _allFigures = allFigures,_filteredFigures = filteredFigures;
  

 final  List<HeroModel> _allFigures;
 List<HeroModel> get allFigures {
  if (_allFigures is EqualUnmodifiableListView) return _allFigures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allFigures);
}

 final  List<HeroModel> _filteredFigures;
 List<HeroModel> get filteredFigures {
  if (_filteredFigures is EqualUnmodifiableListView) return _filteredFigures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredFigures);
}

 final  FigureFilter selectedFilter;
 final  String query;

/// Create a copy of FiguresState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedCopyWith<_Feed> get copyWith => __$FeedCopyWithImpl<_Feed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Feed&&const DeepCollectionEquality().equals(other._allFigures, _allFigures)&&const DeepCollectionEquality().equals(other._filteredFigures, _filteredFigures)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allFigures),const DeepCollectionEquality().hash(_filteredFigures),selectedFilter,query);

@override
String toString() {
  return 'FiguresState.feed(allFigures: $allFigures, filteredFigures: $filteredFigures, selectedFilter: $selectedFilter, query: $query)';
}


}

/// @nodoc
abstract mixin class _$FeedCopyWith<$Res> implements $FiguresStateCopyWith<$Res> {
  factory _$FeedCopyWith(_Feed value, $Res Function(_Feed) _then) = __$FeedCopyWithImpl;
@useResult
$Res call({
 List<HeroModel> allFigures, List<HeroModel> filteredFigures, FigureFilter selectedFilter, String query
});




}
/// @nodoc
class __$FeedCopyWithImpl<$Res>
    implements _$FeedCopyWith<$Res> {
  __$FeedCopyWithImpl(this._self, this._then);

  final _Feed _self;
  final $Res Function(_Feed) _then;

/// Create a copy of FiguresState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? allFigures = null,Object? filteredFigures = null,Object? selectedFilter = null,Object? query = null,}) {
  return _then(_Feed(
allFigures: null == allFigures ? _self._allFigures : allFigures // ignore: cast_nullable_to_non_nullable
as List<HeroModel>,filteredFigures: null == filteredFigures ? _self._filteredFigures : filteredFigures // ignore: cast_nullable_to_non_nullable
as List<HeroModel>,selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as FigureFilter,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Detail implements FiguresState {
  const _Detail({required this.selectedFigure, required final  List<HistoryEventModel> relatedEvents}): _relatedEvents = relatedEvents;
  

 final  HeroModel? selectedFigure;
 final  List<HistoryEventModel> _relatedEvents;
 List<HistoryEventModel> get relatedEvents {
  if (_relatedEvents is EqualUnmodifiableListView) return _relatedEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_relatedEvents);
}


/// Create a copy of FiguresState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailCopyWith<_Detail> get copyWith => __$DetailCopyWithImpl<_Detail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Detail&&(identical(other.selectedFigure, selectedFigure) || other.selectedFigure == selectedFigure)&&const DeepCollectionEquality().equals(other._relatedEvents, _relatedEvents));
}


@override
int get hashCode => Object.hash(runtimeType,selectedFigure,const DeepCollectionEquality().hash(_relatedEvents));

@override
String toString() {
  return 'FiguresState.detail(selectedFigure: $selectedFigure, relatedEvents: $relatedEvents)';
}


}

/// @nodoc
abstract mixin class _$DetailCopyWith<$Res> implements $FiguresStateCopyWith<$Res> {
  factory _$DetailCopyWith(_Detail value, $Res Function(_Detail) _then) = __$DetailCopyWithImpl;
@useResult
$Res call({
 HeroModel? selectedFigure, List<HistoryEventModel> relatedEvents
});


$HeroModelCopyWith<$Res>? get selectedFigure;

}
/// @nodoc
class __$DetailCopyWithImpl<$Res>
    implements _$DetailCopyWith<$Res> {
  __$DetailCopyWithImpl(this._self, this._then);

  final _Detail _self;
  final $Res Function(_Detail) _then;

/// Create a copy of FiguresState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedFigure = freezed,Object? relatedEvents = null,}) {
  return _then(_Detail(
selectedFigure: freezed == selectedFigure ? _self.selectedFigure : selectedFigure // ignore: cast_nullable_to_non_nullable
as HeroModel?,relatedEvents: null == relatedEvents ? _self._relatedEvents : relatedEvents // ignore: cast_nullable_to_non_nullable
as List<HistoryEventModel>,
  ));
}

/// Create a copy of FiguresState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeroModelCopyWith<$Res>? get selectedFigure {
    if (_self.selectedFigure == null) {
    return null;
  }

  return $HeroModelCopyWith<$Res>(_self.selectedFigure!, (value) {
    return _then(_self.copyWith(selectedFigure: value));
  });
}
}

/// @nodoc


class _Error implements FiguresState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of FiguresState
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
  return 'FiguresState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $FiguresStateCopyWith<$Res> {
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

/// Create a copy of FiguresState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
