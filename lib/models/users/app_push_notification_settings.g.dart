// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_push_notification_settings;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppPushNotificationSettings>
    _$appPushNotificationSettingsSerializer =
    new _$AppPushNotificationSettingsSerializer();

class _$AppPushNotificationSettingsSerializer
    implements StructuredSerializer<AppPushNotificationSettings> {
  @override
  final Iterable<Type> types = const [
    AppPushNotificationSettings,
    _$AppPushNotificationSettings
  ];
  @override
  final String wireName = 'AppPushNotificationSettings';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AppPushNotificationSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'connection',
      serializers.serialize(object.connection,
          specifiedType: const FullType(bool)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(bool)),
      'groupMessage',
      serializers.serialize(object.groupMessage,
          specifiedType: const FullType(bool)),
      'like',
      serializers.serialize(object.like, specifiedType: const FullType(bool)),
      'superLike',
      serializers.serialize(object.superLike,
          specifiedType: const FullType(bool)),
      'invitation',
      serializers.serialize(object.invitation,
          specifiedType: const FullType(bool)),
      'approveInvitation',
      serializers.serialize(object.approveInvitation,
          specifiedType: const FullType(bool)),
      'schedule',
      serializers.serialize(object.schedule,
          specifiedType: const FullType(bool)),
      'vibration',
      serializers.serialize(object.vibration,
          specifiedType: const FullType(bool)),
      'reply',
      serializers.serialize(object.reply, specifiedType: const FullType(bool)),
      'postLike',
      serializers.serialize(object.postLike,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  AppPushNotificationSettings deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppPushNotificationSettingsBuilder();

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
        case 'groupMessage':
          result.groupMessage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'like':
          result.like = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'superLike':
          result.superLike = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'invitation':
          result.invitation = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'approveInvitation':
          result.approveInvitation = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'schedule':
          result.schedule = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'vibration':
          result.vibration = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'reply':
          result.reply = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'postLike':
          result.postLike = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AppPushNotificationSettings extends AppPushNotificationSettings {
  @override
  final bool connection;
  @override
  final bool message;
  @override
  final bool groupMessage;
  @override
  final bool like;
  @override
  final bool superLike;
  @override
  final bool invitation;
  @override
  final bool approveInvitation;
  @override
  final bool schedule;
  @override
  final bool vibration;
  @override
  final bool reply;
  @override
  final bool postLike;

  factory _$AppPushNotificationSettings(
          [void Function(AppPushNotificationSettingsBuilder)? updates]) =>
      (new AppPushNotificationSettingsBuilder()..update(updates)).build();

  _$AppPushNotificationSettings._(
      {required this.connection,
      required this.message,
      required this.groupMessage,
      required this.like,
      required this.superLike,
      required this.invitation,
      required this.approveInvitation,
      required this.schedule,
      required this.vibration,
      required this.reply,
      required this.postLike})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        connection, 'AppPushNotificationSettings', 'connection');
    BuiltValueNullFieldError.checkNotNull(
        message, 'AppPushNotificationSettings', 'message');
    BuiltValueNullFieldError.checkNotNull(
        groupMessage, 'AppPushNotificationSettings', 'groupMessage');
    BuiltValueNullFieldError.checkNotNull(
        like, 'AppPushNotificationSettings', 'like');
    BuiltValueNullFieldError.checkNotNull(
        superLike, 'AppPushNotificationSettings', 'superLike');
    BuiltValueNullFieldError.checkNotNull(
        invitation, 'AppPushNotificationSettings', 'invitation');
    BuiltValueNullFieldError.checkNotNull(
        approveInvitation, 'AppPushNotificationSettings', 'approveInvitation');
    BuiltValueNullFieldError.checkNotNull(
        schedule, 'AppPushNotificationSettings', 'schedule');
    BuiltValueNullFieldError.checkNotNull(
        vibration, 'AppPushNotificationSettings', 'vibration');
    BuiltValueNullFieldError.checkNotNull(
        reply, 'AppPushNotificationSettings', 'reply');
    BuiltValueNullFieldError.checkNotNull(
        postLike, 'AppPushNotificationSettings', 'postLike');
  }

  @override
  AppPushNotificationSettings rebuild(
          void Function(AppPushNotificationSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppPushNotificationSettingsBuilder toBuilder() =>
      new AppPushNotificationSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppPushNotificationSettings &&
        connection == other.connection &&
        message == other.message &&
        groupMessage == other.groupMessage &&
        like == other.like &&
        superLike == other.superLike &&
        invitation == other.invitation &&
        approveInvitation == other.approveInvitation &&
        schedule == other.schedule &&
        vibration == other.vibration &&
        reply == other.reply &&
        postLike == other.postLike;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, connection.hashCode),
                                            message.hashCode),
                                        groupMessage.hashCode),
                                    like.hashCode),
                                superLike.hashCode),
                            invitation.hashCode),
                        approveInvitation.hashCode),
                    schedule.hashCode),
                vibration.hashCode),
            reply.hashCode),
        postLike.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppPushNotificationSettings')
          ..add('connection', connection)
          ..add('message', message)
          ..add('groupMessage', groupMessage)
          ..add('like', like)
          ..add('superLike', superLike)
          ..add('invitation', invitation)
          ..add('approveInvitation', approveInvitation)
          ..add('schedule', schedule)
          ..add('vibration', vibration)
          ..add('reply', reply)
          ..add('postLike', postLike))
        .toString();
  }
}

class AppPushNotificationSettingsBuilder
    implements
        Builder<AppPushNotificationSettings,
            AppPushNotificationSettingsBuilder> {
  _$AppPushNotificationSettings? _$v;

  bool? _connection;
  bool? get connection => _$this._connection;
  set connection(bool? connection) => _$this._connection = connection;

  bool? _message;
  bool? get message => _$this._message;
  set message(bool? message) => _$this._message = message;

  bool? _groupMessage;
  bool? get groupMessage => _$this._groupMessage;
  set groupMessage(bool? groupMessage) => _$this._groupMessage = groupMessage;

  bool? _like;
  bool? get like => _$this._like;
  set like(bool? like) => _$this._like = like;

  bool? _superLike;
  bool? get superLike => _$this._superLike;
  set superLike(bool? superLike) => _$this._superLike = superLike;

  bool? _invitation;
  bool? get invitation => _$this._invitation;
  set invitation(bool? invitation) => _$this._invitation = invitation;

  bool? _approveInvitation;
  bool? get approveInvitation => _$this._approveInvitation;
  set approveInvitation(bool? approveInvitation) =>
      _$this._approveInvitation = approveInvitation;

  bool? _schedule;
  bool? get schedule => _$this._schedule;
  set schedule(bool? schedule) => _$this._schedule = schedule;

  bool? _vibration;
  bool? get vibration => _$this._vibration;
  set vibration(bool? vibration) => _$this._vibration = vibration;

  bool? _reply;
  bool? get reply => _$this._reply;
  set reply(bool? reply) => _$this._reply = reply;

  bool? _postLike;
  bool? get postLike => _$this._postLike;
  set postLike(bool? postLike) => _$this._postLike = postLike;

  AppPushNotificationSettingsBuilder() {
    AppPushNotificationSettings._initializeBuilder(this);
  }

  AppPushNotificationSettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _connection = $v.connection;
      _message = $v.message;
      _groupMessage = $v.groupMessage;
      _like = $v.like;
      _superLike = $v.superLike;
      _invitation = $v.invitation;
      _approveInvitation = $v.approveInvitation;
      _schedule = $v.schedule;
      _vibration = $v.vibration;
      _reply = $v.reply;
      _postLike = $v.postLike;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppPushNotificationSettings other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppPushNotificationSettings;
  }

  @override
  void update(void Function(AppPushNotificationSettingsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppPushNotificationSettings build() {
    final _$result = _$v ??
        new _$AppPushNotificationSettings._(
            connection: BuiltValueNullFieldError.checkNotNull(
                connection, 'AppPushNotificationSettings', 'connection'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, 'AppPushNotificationSettings', 'message'),
            groupMessage: BuiltValueNullFieldError.checkNotNull(
                groupMessage, 'AppPushNotificationSettings', 'groupMessage'),
            like: BuiltValueNullFieldError.checkNotNull(
                like, 'AppPushNotificationSettings', 'like'),
            superLike: BuiltValueNullFieldError.checkNotNull(
                superLike, 'AppPushNotificationSettings', 'superLike'),
            invitation: BuiltValueNullFieldError.checkNotNull(
                invitation, 'AppPushNotificationSettings', 'invitation'),
            approveInvitation: BuiltValueNullFieldError.checkNotNull(
                approveInvitation,
                'AppPushNotificationSettings',
                'approveInvitation'),
            schedule: BuiltValueNullFieldError.checkNotNull(schedule, 'AppPushNotificationSettings', 'schedule'),
            vibration: BuiltValueNullFieldError.checkNotNull(vibration, 'AppPushNotificationSettings', 'vibration'),
            reply: BuiltValueNullFieldError.checkNotNull(reply, 'AppPushNotificationSettings', 'reply'),
            postLike: BuiltValueNullFieldError.checkNotNull(postLike, 'AppPushNotificationSettings', 'postLike'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
