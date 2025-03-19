// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TeamsModel> teams) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<TeamsModel> teams)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TeamsModel> teams)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(FormLoading value) loading,
    required TResult Function(FormSuccess value) success,
    required TResult Function(FormError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(FormLoading value)? loading,
    TResult? Function(FormSuccess value)? success,
    TResult? Function(FormError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(FormLoading value)? loading,
    TResult Function(FormSuccess value)? success,
    TResult Function(FormError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormStateCopyWith<$Res> {
  factory $FormStateCopyWith(FormState value, $Res Function(FormState) then) =
      _$FormStateCopyWithImpl<$Res, FormState>;
}

/// @nodoc
class _$FormStateCopyWithImpl<$Res, $Val extends FormState>
    implements $FormStateCopyWith<$Res> {
  _$FormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TeamsModel> teams});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FormStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = null,
  }) {
    return _then(_$InitialImpl(
      null == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamsModel>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl(final List<TeamsModel> teams) : _teams = teams;

  final List<TeamsModel> _teams;
  @override
  List<TeamsModel> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  @override
  String toString() {
    return 'FormState.initial(teams: $teams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._teams, _teams));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_teams));

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TeamsModel> teams) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return initial(teams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<TeamsModel> teams)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call(teams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TeamsModel> teams)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(teams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(FormLoading value) loading,
    required TResult Function(FormSuccess value) success,
    required TResult Function(FormError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(FormLoading value)? loading,
    TResult? Function(FormSuccess value)? success,
    TResult? Function(FormError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(FormLoading value)? loading,
    TResult Function(FormSuccess value)? success,
    TResult Function(FormError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements FormState {
  const factory Initial(final List<TeamsModel> teams) = _$InitialImpl;

  List<TeamsModel> get teams;

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormLoadingImplCopyWith<$Res> {
  factory _$$FormLoadingImplCopyWith(
          _$FormLoadingImpl value, $Res Function(_$FormLoadingImpl) then) =
      __$$FormLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FormLoadingImplCopyWithImpl<$Res>
    extends _$FormStateCopyWithImpl<$Res, _$FormLoadingImpl>
    implements _$$FormLoadingImplCopyWith<$Res> {
  __$$FormLoadingImplCopyWithImpl(
      _$FormLoadingImpl _value, $Res Function(_$FormLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FormLoadingImpl implements FormLoading {
  const _$FormLoadingImpl();

  @override
  String toString() {
    return 'FormState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FormLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TeamsModel> teams) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<TeamsModel> teams)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TeamsModel> teams)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(FormLoading value) loading,
    required TResult Function(FormSuccess value) success,
    required TResult Function(FormError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(FormLoading value)? loading,
    TResult? Function(FormSuccess value)? success,
    TResult? Function(FormError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(FormLoading value)? loading,
    TResult Function(FormSuccess value)? success,
    TResult Function(FormError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FormLoading implements FormState {
  const factory FormLoading() = _$FormLoadingImpl;
}

/// @nodoc
abstract class _$$FormSuccessImplCopyWith<$Res> {
  factory _$$FormSuccessImplCopyWith(
          _$FormSuccessImpl value, $Res Function(_$FormSuccessImpl) then) =
      __$$FormSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FormSuccessImplCopyWithImpl<$Res>
    extends _$FormStateCopyWithImpl<$Res, _$FormSuccessImpl>
    implements _$$FormSuccessImplCopyWith<$Res> {
  __$$FormSuccessImplCopyWithImpl(
      _$FormSuccessImpl _value, $Res Function(_$FormSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FormSuccessImpl implements FormSuccess {
  const _$FormSuccessImpl();

  @override
  String toString() {
    return 'FormState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FormSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TeamsModel> teams) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<TeamsModel> teams)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TeamsModel> teams)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(FormLoading value) loading,
    required TResult Function(FormSuccess value) success,
    required TResult Function(FormError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(FormLoading value)? loading,
    TResult? Function(FormSuccess value)? success,
    TResult? Function(FormError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(FormLoading value)? loading,
    TResult Function(FormSuccess value)? success,
    TResult Function(FormError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class FormSuccess implements FormState {
  const factory FormSuccess() = _$FormSuccessImpl;
}

/// @nodoc
abstract class _$$FormErrorImplCopyWith<$Res> {
  factory _$$FormErrorImplCopyWith(
          _$FormErrorImpl value, $Res Function(_$FormErrorImpl) then) =
      __$$FormErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FormErrorImplCopyWithImpl<$Res>
    extends _$FormStateCopyWithImpl<$Res, _$FormErrorImpl>
    implements _$$FormErrorImplCopyWith<$Res> {
  __$$FormErrorImplCopyWithImpl(
      _$FormErrorImpl _value, $Res Function(_$FormErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FormErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FormErrorImpl implements FormError {
  const _$FormErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FormState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormErrorImplCopyWith<_$FormErrorImpl> get copyWith =>
      __$$FormErrorImplCopyWithImpl<_$FormErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TeamsModel> teams) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<TeamsModel> teams)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TeamsModel> teams)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(FormLoading value) loading,
    required TResult Function(FormSuccess value) success,
    required TResult Function(FormError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(FormLoading value)? loading,
    TResult? Function(FormSuccess value)? success,
    TResult? Function(FormError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(FormLoading value)? loading,
    TResult Function(FormSuccess value)? success,
    TResult Function(FormError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FormError implements FormState {
  const factory FormError(final String message) = _$FormErrorImpl;

  String get message;

  /// Create a copy of FormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormErrorImplCopyWith<_$FormErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
