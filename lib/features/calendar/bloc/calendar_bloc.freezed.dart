// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent()';
}


}

/// @nodoc
class $CalendarEventCopyWith<$Res>  {
$CalendarEventCopyWith(CalendarEvent _, $Res Function(CalendarEvent) __);
}


/// Adds pattern-matching-related methods to [CalendarEvent].
extension CalendarEventPatterns on CalendarEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _DaySelected value)?  daySelected,TResult Function( _MonthChanged value)?  monthChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _DaySelected() when daySelected != null:
return daySelected(_that);case _MonthChanged() when monthChanged != null:
return monthChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _DaySelected value)  daySelected,required TResult Function( _MonthChanged value)  monthChanged,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _DaySelected():
return daySelected(_that);case _MonthChanged():
return monthChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _DaySelected value)?  daySelected,TResult? Function( _MonthChanged value)?  monthChanged,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _DaySelected() when daySelected != null:
return daySelected(_that);case _MonthChanged() when monthChanged != null:
return monthChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( DateTime day)?  daySelected,TResult Function( DateTime month)?  monthChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _DaySelected() when daySelected != null:
return daySelected(_that.day);case _MonthChanged() when monthChanged != null:
return monthChanged(_that.month);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( DateTime day)  daySelected,required TResult Function( DateTime month)  monthChanged,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _DaySelected():
return daySelected(_that.day);case _MonthChanged():
return monthChanged(_that.month);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( DateTime day)?  daySelected,TResult? Function( DateTime month)?  monthChanged,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _DaySelected() when daySelected != null:
return daySelected(_that.day);case _MonthChanged() when monthChanged != null:
return monthChanged(_that.month);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CalendarEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent.started()';
}


}




/// @nodoc


class _DaySelected implements CalendarEvent {
  const _DaySelected(this.day);
  

 final  DateTime day;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DaySelectedCopyWith<_DaySelected> get copyWith => __$DaySelectedCopyWithImpl<_DaySelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DaySelected&&(identical(other.day, day) || other.day == day));
}


@override
int get hashCode => Object.hash(runtimeType,day);

@override
String toString() {
  return 'CalendarEvent.daySelected(day: $day)';
}


}

/// @nodoc
abstract mixin class _$DaySelectedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory _$DaySelectedCopyWith(_DaySelected value, $Res Function(_DaySelected) _then) = __$DaySelectedCopyWithImpl;
@useResult
$Res call({
 DateTime day
});




}
/// @nodoc
class __$DaySelectedCopyWithImpl<$Res>
    implements _$DaySelectedCopyWith<$Res> {
  __$DaySelectedCopyWithImpl(this._self, this._then);

  final _DaySelected _self;
  final $Res Function(_DaySelected) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? day = null,}) {
  return _then(_DaySelected(
null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _MonthChanged implements CalendarEvent {
  const _MonthChanged(this.month);
  

 final  DateTime month;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthChangedCopyWith<_MonthChanged> get copyWith => __$MonthChangedCopyWithImpl<_MonthChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthChanged&&(identical(other.month, month) || other.month == month));
}


@override
int get hashCode => Object.hash(runtimeType,month);

@override
String toString() {
  return 'CalendarEvent.monthChanged(month: $month)';
}


}

/// @nodoc
abstract mixin class _$MonthChangedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory _$MonthChangedCopyWith(_MonthChanged value, $Res Function(_MonthChanged) _then) = __$MonthChangedCopyWithImpl;
@useResult
$Res call({
 DateTime month
});




}
/// @nodoc
class __$MonthChangedCopyWithImpl<$Res>
    implements _$MonthChangedCopyWith<$Res> {
  __$MonthChangedCopyWithImpl(this._self, this._then);

  final _MonthChanged _self;
  final $Res Function(_MonthChanged) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? month = null,}) {
  return _then(_MonthChanged(
null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$CalendarState {

 DateTime get focusedMonth; DateTime get selectedDay; bool get isLoading; List<CalendarEventModel> get markers; Set<String> get specialLunarDays; List<HistoryEventModel> get selectedEvents; LunarDayInfo? get selectedLunarInfo; DailyAdvice? get selectedAdvice; String? get error;
/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarStateCopyWith<CalendarState> get copyWith => _$CalendarStateCopyWithImpl<CalendarState>(this as CalendarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarState&&(identical(other.focusedMonth, focusedMonth) || other.focusedMonth == focusedMonth)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.markers, markers)&&const DeepCollectionEquality().equals(other.specialLunarDays, specialLunarDays)&&const DeepCollectionEquality().equals(other.selectedEvents, selectedEvents)&&(identical(other.selectedLunarInfo, selectedLunarInfo) || other.selectedLunarInfo == selectedLunarInfo)&&(identical(other.selectedAdvice, selectedAdvice) || other.selectedAdvice == selectedAdvice)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,focusedMonth,selectedDay,isLoading,const DeepCollectionEquality().hash(markers),const DeepCollectionEquality().hash(specialLunarDays),const DeepCollectionEquality().hash(selectedEvents),selectedLunarInfo,selectedAdvice,error);

@override
String toString() {
  return 'CalendarState(focusedMonth: $focusedMonth, selectedDay: $selectedDay, isLoading: $isLoading, markers: $markers, specialLunarDays: $specialLunarDays, selectedEvents: $selectedEvents, selectedLunarInfo: $selectedLunarInfo, selectedAdvice: $selectedAdvice, error: $error)';
}


}

/// @nodoc
abstract mixin class $CalendarStateCopyWith<$Res>  {
  factory $CalendarStateCopyWith(CalendarState value, $Res Function(CalendarState) _then) = _$CalendarStateCopyWithImpl;
@useResult
$Res call({
 DateTime focusedMonth, DateTime selectedDay, bool isLoading, List<CalendarEventModel> markers, Set<String> specialLunarDays, List<HistoryEventModel> selectedEvents, LunarDayInfo? selectedLunarInfo, DailyAdvice? selectedAdvice, String? error
});




}
/// @nodoc
class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._self, this._then);

  final CalendarState _self;
  final $Res Function(CalendarState) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? focusedMonth = null,Object? selectedDay = null,Object? isLoading = null,Object? markers = null,Object? specialLunarDays = null,Object? selectedEvents = null,Object? selectedLunarInfo = freezed,Object? selectedAdvice = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
focusedMonth: null == focusedMonth ? _self.focusedMonth : focusedMonth // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,markers: null == markers ? _self.markers : markers // ignore: cast_nullable_to_non_nullable
as List<CalendarEventModel>,specialLunarDays: null == specialLunarDays ? _self.specialLunarDays : specialLunarDays // ignore: cast_nullable_to_non_nullable
as Set<String>,selectedEvents: null == selectedEvents ? _self.selectedEvents : selectedEvents // ignore: cast_nullable_to_non_nullable
as List<HistoryEventModel>,selectedLunarInfo: freezed == selectedLunarInfo ? _self.selectedLunarInfo : selectedLunarInfo // ignore: cast_nullable_to_non_nullable
as LunarDayInfo?,selectedAdvice: freezed == selectedAdvice ? _self.selectedAdvice : selectedAdvice // ignore: cast_nullable_to_non_nullable
as DailyAdvice?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarState].
extension CalendarStatePatterns on CalendarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarState value)  $default,){
final _that = this;
switch (_that) {
case _CalendarState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarState value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime focusedMonth,  DateTime selectedDay,  bool isLoading,  List<CalendarEventModel> markers,  Set<String> specialLunarDays,  List<HistoryEventModel> selectedEvents,  LunarDayInfo? selectedLunarInfo,  DailyAdvice? selectedAdvice,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
return $default(_that.focusedMonth,_that.selectedDay,_that.isLoading,_that.markers,_that.specialLunarDays,_that.selectedEvents,_that.selectedLunarInfo,_that.selectedAdvice,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime focusedMonth,  DateTime selectedDay,  bool isLoading,  List<CalendarEventModel> markers,  Set<String> specialLunarDays,  List<HistoryEventModel> selectedEvents,  LunarDayInfo? selectedLunarInfo,  DailyAdvice? selectedAdvice,  String? error)  $default,) {final _that = this;
switch (_that) {
case _CalendarState():
return $default(_that.focusedMonth,_that.selectedDay,_that.isLoading,_that.markers,_that.specialLunarDays,_that.selectedEvents,_that.selectedLunarInfo,_that.selectedAdvice,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime focusedMonth,  DateTime selectedDay,  bool isLoading,  List<CalendarEventModel> markers,  Set<String> specialLunarDays,  List<HistoryEventModel> selectedEvents,  LunarDayInfo? selectedLunarInfo,  DailyAdvice? selectedAdvice,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
return $default(_that.focusedMonth,_that.selectedDay,_that.isLoading,_that.markers,_that.specialLunarDays,_that.selectedEvents,_that.selectedLunarInfo,_that.selectedAdvice,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CalendarState implements CalendarState {
  const _CalendarState({required this.focusedMonth, required this.selectedDay, required this.isLoading, required final  List<CalendarEventModel> markers, required final  Set<String> specialLunarDays, required final  List<HistoryEventModel> selectedEvents, this.selectedLunarInfo, this.selectedAdvice, this.error}): _markers = markers,_specialLunarDays = specialLunarDays,_selectedEvents = selectedEvents;
  

@override final  DateTime focusedMonth;
@override final  DateTime selectedDay;
@override final  bool isLoading;
 final  List<CalendarEventModel> _markers;
@override List<CalendarEventModel> get markers {
  if (_markers is EqualUnmodifiableListView) return _markers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_markers);
}

 final  Set<String> _specialLunarDays;
@override Set<String> get specialLunarDays {
  if (_specialLunarDays is EqualUnmodifiableSetView) return _specialLunarDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_specialLunarDays);
}

 final  List<HistoryEventModel> _selectedEvents;
@override List<HistoryEventModel> get selectedEvents {
  if (_selectedEvents is EqualUnmodifiableListView) return _selectedEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedEvents);
}

@override final  LunarDayInfo? selectedLunarInfo;
@override final  DailyAdvice? selectedAdvice;
@override final  String? error;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarStateCopyWith<_CalendarState> get copyWith => __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarState&&(identical(other.focusedMonth, focusedMonth) || other.focusedMonth == focusedMonth)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._markers, _markers)&&const DeepCollectionEquality().equals(other._specialLunarDays, _specialLunarDays)&&const DeepCollectionEquality().equals(other._selectedEvents, _selectedEvents)&&(identical(other.selectedLunarInfo, selectedLunarInfo) || other.selectedLunarInfo == selectedLunarInfo)&&(identical(other.selectedAdvice, selectedAdvice) || other.selectedAdvice == selectedAdvice)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,focusedMonth,selectedDay,isLoading,const DeepCollectionEquality().hash(_markers),const DeepCollectionEquality().hash(_specialLunarDays),const DeepCollectionEquality().hash(_selectedEvents),selectedLunarInfo,selectedAdvice,error);

@override
String toString() {
  return 'CalendarState(focusedMonth: $focusedMonth, selectedDay: $selectedDay, isLoading: $isLoading, markers: $markers, specialLunarDays: $specialLunarDays, selectedEvents: $selectedEvents, selectedLunarInfo: $selectedLunarInfo, selectedAdvice: $selectedAdvice, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CalendarStateCopyWith<$Res> implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(_CalendarState value, $Res Function(_CalendarState) _then) = __$CalendarStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime focusedMonth, DateTime selectedDay, bool isLoading, List<CalendarEventModel> markers, Set<String> specialLunarDays, List<HistoryEventModel> selectedEvents, LunarDayInfo? selectedLunarInfo, DailyAdvice? selectedAdvice, String? error
});




}
/// @nodoc
class __$CalendarStateCopyWithImpl<$Res>
    implements _$CalendarStateCopyWith<$Res> {
  __$CalendarStateCopyWithImpl(this._self, this._then);

  final _CalendarState _self;
  final $Res Function(_CalendarState) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? focusedMonth = null,Object? selectedDay = null,Object? isLoading = null,Object? markers = null,Object? specialLunarDays = null,Object? selectedEvents = null,Object? selectedLunarInfo = freezed,Object? selectedAdvice = freezed,Object? error = freezed,}) {
  return _then(_CalendarState(
focusedMonth: null == focusedMonth ? _self.focusedMonth : focusedMonth // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,markers: null == markers ? _self._markers : markers // ignore: cast_nullable_to_non_nullable
as List<CalendarEventModel>,specialLunarDays: null == specialLunarDays ? _self._specialLunarDays : specialLunarDays // ignore: cast_nullable_to_non_nullable
as Set<String>,selectedEvents: null == selectedEvents ? _self._selectedEvents : selectedEvents // ignore: cast_nullable_to_non_nullable
as List<HistoryEventModel>,selectedLunarInfo: freezed == selectedLunarInfo ? _self.selectedLunarInfo : selectedLunarInfo // ignore: cast_nullable_to_non_nullable
as LunarDayInfo?,selectedAdvice: freezed == selectedAdvice ? _self.selectedAdvice : selectedAdvice // ignore: cast_nullable_to_non_nullable
as DailyAdvice?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
