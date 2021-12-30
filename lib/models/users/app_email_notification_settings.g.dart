// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_email_notification_settings;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppEmailNotificationSettings>
    _$appEmailNotificationSettingsSerializer =
    new _$AppEmailNotificationSettingsSerializer();

class _$AppEmailNotificationSettingsSerializer
    implements StructuredSerializer<AppEmailNotificationSettings> {
  @override
  final Iterable<Type> types = const [
    AppEmailNotificationSettings,
    _$AppEmailNotificationSettings
  ];
  @override
  final String wireName = 'AppEmailNotificationSettings';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AppEmailNotificationSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'connection',
      serializers.serialize(object.connection,
          specifiedType: const FullType(bool)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(bool)),
      'meetingInvitation',
      serializers.serialize(object.meetingInvitation,
          specifiedType: const FullType(bool)),
      'meetingRecruit',
      serializers.serialize(object.meetingRecruit,
          specifiedType: const FullType(bool)),
      'communityReply',
      serializers.serialize(object.communityReply,
          specifiedType: const FullType(bool)),
      'communityLike',
      serializers.serialize(object.communityLike,
          specifiedType: const FullType(bool)),
      'promotion',
      serializers.serialize(object.promotion,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  AppEmailNotificationSettings deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppEmailNotificationSettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'connection':
          result.connection = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'meetingInvitation':
          result.meetingInvitation = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'meetingRecruit':
          result.meetingRecruit = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'communityReply':
          result.communityReply = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'communityLike':
          result.communityLike = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'promotion':
          result.promotion = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AppEmailNotificationSettings extends AppEmailNotificationSettings {
  @override
  final bool connection;
  @override
  final bool message;
  @override
  final bool meetingInvitation;
  @override
  final bool meetingRecruit;
  @override
  final bool communityReply;
  @override
  final bool communityLike;
  @override
  final bool promotion;

  factory _$AppEmailNotificationSettings(
          [void Function(AppEmailNotificationSettingsBuilder)? updates]) =>
      (new AppEmailNotificationSettingsBuilder()..update(updates)).build();

  _$AppEmailNotificationSettings._(
      {required this.connection,
      required this.message,
      required this.meetingInvitation,
      required this.meetingRecruit,
      required this.communityReply,
      required this.communityLike,
      required this.promotion})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        connection, 'AppEmailNotificationSettings', 'connection');
    BuiltValueNullFieldError.checkNotNull(
        message, 'AppEmailNotificationSettings', 'message');
    BuiltValueNullFieldError.checkNotNull(
        meetingInvitation, 'AppEmailNotificationSettings', 'meetingInvitation');
    BuiltValueNullFieldError.checkNotNull(
        meetingRecruit, 'AppEmailNotificationSettings', 'meetingRecruit');
    BuiltValueNullFieldError.checkNotNull(
        communityReply, 'AppEmailNotificationSettings', 'communityReply');
    BuiltValueNullFieldError.checkNotNull(
        communityLike, 'AppEmailNotificationSettings', 'communityLike');
    BuiltValueNullFieldError.checkNotNull(
        promotion, 'AppEmailNotificationSettings', 'promotion');
  }

  @override
  AppEmailNotificationSettings rebuild(
          void Function(AppEmailNotificationSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppEmailNotificationSettingsBuilder toBuilder() =>
      new AppEmailNotificationSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppEmailNotificationSettings &&
        connection == other.connection &&
        message == other.message &&
        meetingInvitation == other.meetingInvitation &&
        meetingRecruit == other.meetingRecruit &&
        communityReply == other.communityReply &&
        communityLike == other.communityLike &&
        promotion == other.promotion;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, connection.hashCode), message.hashCode),
                        meetingInvitation.hashCode),
                    meetingRecruit.hashCode),
                communityReply.hashCode),
            communityLike.hashCode),
        promotion.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppEmailNotificationSettings')
          ..add('connection', connection)
          ..add('message', message)
          ..add('meetingInvitation', meetingInvitation)
          ..add('meetingRecruit', meetingRecruit)
          ..add('communityReply', communityReply)
          ..add('communityLike', communityLike)
          ..add('promotion', promotion))
        .toString();
  }
}

class AppEmailNotificationSettingsBuilder
    implements
        Builder<AppEmailNotificationSettings,
            AppEmailNotificationSettingsBuilder> {
  _$AppEmailNotificationSettings? _$v;

  bool? _connection;
  bool? get connection => _$this._connection;
  set connection(bool? connection) => _$this._connection = connection;

  bool? _message;
  bool? get message => _$this._message;
  set message(bool? message) => _$this._message = message;

  bool? _meetingInvitation;
  bool? get meetingInvitation => _$this._meetingInvitation;
  set meetingInvitation(bool? meetingInvitation) =>
      _$this._meetingInvitation = meetingInvitation;

  bool? _meetingRecruit;
  bool? get meetingRecruit => _$this._meetingRecruit;
  set meetingRecruit(bool? meetingRecruit) =>
      _$this._meetingRecruit = meetingRecruit;

  bool? _communityReply;
  bool? get communityReply => _$this._communityReply;
  set communityReply(bool? communityReply) =>
      _$this._communityReply = communityReply;

  bool? _communityLike;
  bool? get communityLike => _$this._communityLike;
  set communityLike(bool? communityLike) =>
      _$this._communityLike = communityLike;

  bool? _promotion;
  bool? get promotion => _$this._promotion;
  set promotion(bool? promotion) => _$this._promotion = promotion;

  AppEmailNotificationSettingsBuilder() {
    AppEmailNotificationSettings._initializeBuilder(this);
  }

  AppEmailNotificationSettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _connection = $v.connection;
      _message = $v.message;
      _meetingInvitation = $v.meetingInvitation;
      _meetingRecruit = $v.meetingRecruit;
      _communityReply = $v.communityReply;
      _communityLike = $v.communityLike;
      _promotion = $v.promotion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppEmailNotificationSettings other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppEmailNotificationSettings;
  }

  @override
  void update(void Function(AppEmailNotificationSettingsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppEmailNotificationSettings build() {
    final _$result = _$v ??
        new _$AppEmailNotificationSettings._(
            connection: BuiltValueNullFieldError.checkNotNull(
                connection, 'AppEmailNotificationSettings', 'connection'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, 'AppEmailNotificationSettings', 'message'),
            meetingInvitation: BuiltValueNullFieldError.checkNotNull(
                meetingInvitation,
                'AppEmailNotificationSettings',
                'meetingInvitation'),
            meetingRecruit: BuiltValueNullFieldError.checkNotNull(
                meetingRecruit, 'AppEmailNotificationSettings', 'meetingRecruit'),
            communityReply: BuiltValueNullFieldError.checkNotNull(
                communityReply, 'AppEmailNotificationSettings', 'communityReply'),
            communityLike: BuiltValueNullFieldError.checkNotNull(
                communityLike, 'AppEmailNotificationSettings', 'communityLike'),
            promotion: BuiltValueNullFieldError.checkNotNull(
                promotion, 'AppEmailNotificationSettings', 'promotion'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
