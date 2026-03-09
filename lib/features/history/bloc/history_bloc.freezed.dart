// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryEvent()';
}


}

/// @nodoc
class $HistoryEventCopyWith<$Res>  {
$HistoryEventCopyWith(HistoryEvent _, $Res Function(HistoryEvent) __);
}


/// Adds pattern-matching-related methods to [HistoryEvent].
extension HistoryEventPatterns on HistoryEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  feedLoaded,TResult Function( String query)?  queryChanged,TResult Function( HistoryFilter filter)?  filterChanged,TResult Function( String eventId)?  detailLoaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedLoaded() when feedLoaded != null:
return feedLoaded();case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _FilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case _DetailLoaded() when detailLoaded != null:
return detailLoaded(_that.eventId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  feedLoaded,required TResult Function( String query)  queryChanged,required TResult Function( HistoryFilter filter)  filterChanged,required TResult Function( String eventId)  detailLoaded,}) {final _that = this;
switch (_that) {
case _FeedLoaded():
return feedLoaded();case _QueryChanged():
return queryChanged(_that.query);case _FilterChanged():
return filterChanged(_that.filter);case _DetailLoaded():
return detailLoaded(_that.eventId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  feedLoaded,TResult? Function( String query)?  queryChanged,TResult? Function( HistoryFilter filter)?  filterChanged,TResult? Function( String eventId)?  detailLoaded,}) {final _that = this;
switch (_that) {
case _FeedLoaded() when feedLoaded != null:
return feedLoaded();case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _FilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case _DetailLoaded() when detailLoaded != null:
return detailLoaded(_that.eventId);case _:
  return null;

}
}

}

/// @nodoc


class _FeedLoaded implements HistoryEvent {
  const _FeedLoaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedLoaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryEvent.feedLoaded()';
}


}




/// @nodoc


class _QueryChanged implements HistoryEvent {
  const _QueryChanged(this.query);
  

 final  String query;

/// Create a copy of HistoryEvent
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
  return 'HistoryEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class _$QueryChangedCopyWith<$Res> implements $HistoryEventCopyWith<$Res> {
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

/// Create a copy of HistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_QueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _FilterChanged implements HistoryEvent {
  const _FilterChanged(this.filter);
  

 final  HistoryFilter filter;

/// Create a copy of HistoryEvent
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
  return 'HistoryEvent.filterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$FilterChangedCopyWith<$Res> implements $HistoryEventCopyWith<$Res> {
  factory _$FilterChangedCopyWith(_FilterChanged value, $Res Function(_FilterChanged) _then) = __$FilterChangedCopyWithImpl;
@useResult
$Res call({
 HistoryFilter filter
});




}
/// @nodoc
class __$FilterChangedCopyWithImpl<$Res>
    implements _$FilterChangedCopyWith<$Res> {
  __$FilterChangedCopyWithImpl(this._self, this._then);

  final _FilterChanged _self;
  final $Res Function(_FilterChanged) _then;

/// Create a copy of HistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(_FilterChanged(
null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as HistoryFilter,
  ));
}


}

/// @nodoc


class _DetailLoaded implements HistoryEvent {
  const _DetailLoaded(this.eventId);
  

 final  String eventId;

/// Create a copy of HistoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailLoadedCopyWith<_DetailLoaded> get copyWith => __$DetailLoadedCopyWithImpl<_DetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailLoaded&&(identical(other.eventId, eventId) || other.eventId == eventId));
}


@override
int get hashCode => Object.hash(runtimeType,eventId);

@override
String toString() {
  return 'HistoryEvent.detailLoaded(eventId: $eventId)';
}


}

/// @nodoc
abstract mixin class _$DetailLoadedCopyWith<$Res> implements $HistoryEventCopyWith<$Res> {
  factory _$DetailLoadedCopyWith(_DetailLoaded value, $Res Function(_DetailLoaded) _then) = __$DetailLoadedCopyWithImpl;
@useResult
$Res call({
 String eventId
});




}
/// @nodoc
class __$DetailLoadedCopyWithImpl<$Res>
    implements _$DetailLoadedCopyWith<$Res> {
  __$DetailLoadedCopyWithImpl(this._self, this._then);

  final _DetailLoaded _self;
  final $Res Function(_DetailLoaded) _then;

/// Create a copy of HistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? eventId = null,}) {
  return _then(_DetailLoaded(
null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$HistoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryState()';
}


}

/// @nodoc
class $HistoryStateCopyWith<$Res>  {
$HistoryStateCopyWith(HistoryState _, $Res Function(HistoryState) __);
}


/// Adds pattern-matching-related methods to [HistoryState].
extension HistoryStatePatterns on HistoryState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<HistoryEventModel> allEvents,  List<HistoryEventModel> filteredEvents,  HistoryFilter selectedFilter,  String query)?  feed,TResult Function( HistoryEventModel? selectedEvent,  List<HistoryEventModel> relatedEvents)?  detail,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Feed() when feed != null:
return feed(_that.allEvents,_that.filteredEvents,_that.selectedFilter,_that.query);case _Detail() when detail != null:
return detail(_that.selectedEvent,_that.relatedEvents);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<HistoryEventModel> allEvents,  List<HistoryEventModel> filteredEvents,  HistoryFilter selectedFilter,  String query)  feed,required TResult Function( HistoryEventModel? selectedEvent,  List<HistoryEventModel> relatedEvents)  detail,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Feed():
return feed(_that.allEvents,_that.filteredEvents,_that.selectedFilter,_that.query);case _Detail():
return detail(_that.selectedEvent,_that.relatedEvents);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<HistoryEventModel> allEvents,  List<HistoryEventModel> filteredEvents,  HistoryFilter selectedFilter,  String query)?  feed,TResult? Function( HistoryEventModel? selectedEvent,  List<HistoryEventModel> relatedEvents)?  detail,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Feed() when feed != null:
return feed(_that.allEvents,_that.filteredEvents,_that.selectedFilter,_that.query);case _Detail() when detail != null:
return detail(_that.selectedEvent,_that.relatedEvents);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements HistoryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryState.initial()';
}


}




/// @nodoc


class _Loading implements HistoryState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryState.loading()';
}


}




/// @nodoc


class _Feed implements HistoryState {
  const _Feed({required final  List<HistoryEventModel> allEvents, required final  List<HistoryEventModel> filteredEvents, required this.selectedFilter, required this.query}): _allEvents = allEvents,_filteredEvents = filteredEvents;
  

 final  List<HistoryEventModel> _allEvents;
 List<HistoryEventModel> get allEvents {
  if (_allEvents is EqualUnmodifiableListView) return _allEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allEvents);
}

 final  List<HistoryEventModel> _filteredEvents;
 List<HistoryEventModel> get filteredEvents {
  if (_filteredEvents is EqualUnmodifiableListView) return _filteredEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredEvents);
}

 final  HistoryFilter selectedFilter;
 final  String query;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedCopyWith<_Feed> get copyWith => __$FeedCopyWithImpl<_Feed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Feed&&const DeepCollectionEquality().equals(other._allEvents, _allEvents)&&const DeepCollectionEquality().equals(other._filteredEvents, _filteredEvents)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allEvents),const DeepCollectionEquality().hash(_filteredEvents),selectedFilter,query);

@override
String toString() {
  return 'HistoryState.feed(allEvents: $allEvents, filteredEvents: $filteredEvents, selectedFilter: $selectedFilter, query: $query)';
}


}

/// @nodoc
abstract mixin class _$FeedCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory _$FeedCopyWith(_Feed value, $Res Function(_Feed) _then) = __$FeedCopyWithImpl;
@useResult
$Res call({
 List<HistoryEventModel> allEvents, List<HistoryEventModel> filteredEvents, HistoryFilter selectedFilter, String query
});




}
/// @nodoc
class __$FeedCopyWithImpl<$Res>
    implements _$FeedCopyWith<$Res> {
  __$FeedCopyWithImpl(this._self, this._then);

  final _Feed _self;
  final $Res Function(_Feed) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? allEvents = null,Object? filteredEvents = null,Object? selectedFilter = null,Object? query = null,}) {
  return _then(_Feed(
allEvents: null == allEvents ? _self._allEvents : allEvents // ignore: cast_nullable_to_non_nullable
as List<HistoryEventModel>,filteredEvents: null == filteredEvents ? _self._filteredEvents : filteredEvents // ignore: cast_nullable_to_non_nullable
as List<HistoryEventModel>,selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as HistoryFilter,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Detail implements HistoryState {
  const _Detail({required this.selectedEvent, required final  List<HistoryEventModel> relatedEvents}): _relatedEvents = relatedEvents;
  

 final  HistoryEventModel? selectedEvent;
 final  List<HistoryEventModel> _relatedEvents;
 List<HistoryEventModel> get relatedEvents {
  if (_relatedEvents is EqualUnmodifiableListView) return _relatedEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_relatedEvents);
}


/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailCopyWith<_Detail> get copyWith => __$DetailCopyWithImpl<_Detail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Detail&&(identical(other.selectedEvent, selectedEvent) || other.selectedEvent == selectedEvent)&&const DeepCollectionEquality().equals(other._relatedEvents, _relatedEvents));
}


@override
int get hashCode => Object.hash(runtimeType,selectedEvent,const DeepCollectionEquality().hash(_relatedEvents));

@override
String toString() {
  return 'HistoryState.detail(selectedEvent: $selectedEvent, relatedEvents: $relatedEvents)';
}


}

/// @nodoc
abstract mixin class _$DetailCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory _$DetailCopyWith(_Detail value, $Res Function(_Detail) _then) = __$DetailCopyWithImpl;
@useResult
$Res call({
 HistoryEventModel? selectedEvent, List<HistoryEventModel> relatedEvents
});


$HistoryEventModelCopyWith<$Res>? get selectedEvent;

}
/// @nodoc
class __$DetailCopyWithImpl<$Res>
    implements _$DetailCopyWith<$Res> {
  __$DetailCopyWithImpl(this._self, this._then);

  final _Detail _self;
  final $Res Function(_Detail) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedEvent = freezed,Object? relatedEvents = null,}) {
  return _then(_Detail(
selectedEvent: freezed == selectedEvent ? _self.selectedEvent : selectedEvent // ignore: cast_nullable_to_non_nullable
as HistoryEventModel?,relatedEvents: null == relatedEvents ? _self._relatedEvents : relatedEvents // ignore: cast_nullable_to_non_nullable
as List<HistoryEventModel>,
  ));
}

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryEventModelCopyWith<$Res>? get selectedEvent {
    if (_self.selectedEvent == null) {
    return null;
  }

  return $HistoryEventModelCopyWith<$Res>(_self.selectedEvent!, (value) {
    return _then(_self.copyWith(selectedEvent: value));
  });
}
}

/// @nodoc


class _Error implements HistoryState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of HistoryState
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
  return 'HistoryState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
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

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
