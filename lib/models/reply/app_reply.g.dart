// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_reply;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppReply> _$appReplySerializer = new _$AppReplySerializer();

class _$AppReplySerializer implements StructuredSerializer<AppReply> {
  @override
  final Iterable<Type> types = const [AppReply, _$AppReply];
  @override
  final String wireName = 'AppReply';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppReply object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.ownerId;
    if (value != null) {
      result
        ..add('ownerId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deleteFlag;
    if (value != null) {
      result
        ..add('deleteFlag')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.collectionType;
    if (value != null) {
      result
        ..add('collectionType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nickName;
    if (value != null) {
      result
        ..add('nickName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.seqUid;
    if (value != null) {
      result
        ..add('seq_uid')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.postUid;
    if (value != null) {
      result
        ..add('postUid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.replyUid;
    if (value != null) {
      result
        ..add('replyUid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createDate;
    if (value != null) {
      result
        ..add('createDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.profile;
    if (value != null) {
      result
        ..add('profile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rereplyUid;
    if (value != null) {
      result
        ..add('rereplyUid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rere_content;
    if (value != null) {
      result
        ..add('rere_content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tagUser;
    if (value != null) {
      result
        ..add('tagUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imgDownload;
    if (value != null) {
      result
        ..add('imgDownload')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deleteImgPath;
    if (value != null) {
      result
        ..add('deleteImgPath')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AppReply deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppReplyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ownerId':
          result.ownerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'deleteFlag':
          result.deleteFlag = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'collectionType':
          result.collectionType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nickName':
          result.nickName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'seq_uid':
          result.seqUid = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'postUid':
          result.postUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'replyUid':
          result.replyUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createDate':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'profile':
          result.profile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rereplyUid':
          result.rereplyUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rere_content':
          result.rere_content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tagUser':
          result.tagUser = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imgDownload':
          result.imgDownload = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'deleteImgPath':
          result.deleteImgPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$AppReply extends AppReply {
  @override
  final String? ownerId;
  @override
  final String? deleteFlag;
  @override
  final String? collectionType;
  @override
  final String? nickName;
  @override
  final int? seqUid;
  @override
  final String? postUid;
  @override
  final String? replyUid;
  @override
  final DateTime? createDate;
  @override
  final String? content;
  @override
  final String? profile;
  @override
  final String? rereplyUid;
  @override
  final String? rere_content;
  @override
  final String? tagUser;
  @override
  final String? imgDownload;
  @override
  final String? deleteImgPath;

  factory _$AppReply([void Function(AppReplyBuilder)? updates]) =>
      (new AppReplyBuilder()..update(updates)).build();

  _$AppReply._(
      {this.ownerId,
      this.deleteFlag,
      this.collectionType,
      this.nickName,
      this.seqUid,
      this.postUid,
      this.replyUid,
      this.createDate,
      this.content,
      this.profile,
      this.rereplyUid,
      this.rere_content,
      this.tagUser,
      this.imgDownload,
      this.deleteImgPath})
      : super._();

  @override
  AppReply rebuild(void Function(AppReplyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppReplyBuilder toBuilder() => new AppReplyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppReply &&
        ownerId == other.ownerId &&
        deleteFlag == other.deleteFlag &&
        collectionType == other.collectionType &&
        nickName == other.nickName &&
        seqUid == other.seqUid &&
        postUid == other.postUid &&
        replyUid == other.replyUid &&
        createDate == other.createDate &&
        content == other.content &&
        profile == other.profile &&
        rereplyUid == other.rereplyUid &&
        rere_content == other.rere_content &&
        tagUser == other.tagUser &&
        imgDownload == other.imgDownload &&
        deleteImgPath == other.deleteImgPath;
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
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                ownerId
                                                                    .hashCode),
                                                            deleteFlag
                                                                .hashCode),
                                                        collectionType
                                                            .hashCode),
                                                    nickName.hashCode),
                                                seqUid.hashCode),
                                            postUid.hashCode),
                                        replyUid.hashCode),
                                    createDate.hashCode),
                                content.hashCode),
                            profile.hashCode),
                        rereplyUid.hashCode),
                    rere_content.hashCode),
                tagUser.hashCode),
            imgDownload.hashCode),
        deleteImgPath.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppReply')
          ..add('ownerId', ownerId)
          ..add('deleteFlag', deleteFlag)
          ..add('collectionType', collectionType)
          ..add('nickName', nickName)
          ..add('seqUid', seqUid)
          ..add('postUid', postUid)
          ..add('replyUid', replyUid)
          ..add('createDate', createDate)
          ..add('content', content)
          ..add('profile', profile)
          ..add('rereplyUid', rereplyUid)
          ..add('rere_content', rere_content)
          ..add('tagUser', tagUser)
          ..add('imgDownload', imgDownload)
          ..add('deleteImgPath', deleteImgPath))
        .toString();
  }
}

class AppReplyBuilder implements Builder<AppReply, AppReplyBuilder> {
  _$AppReply? _$v;

  String? _ownerId;
  String? get ownerId => _$this._ownerId;
  set ownerId(String? ownerId) => _$this._ownerId = ownerId;

  String? _deleteFlag;
  String? get deleteFlag => _$this._deleteFlag;
  set deleteFlag(String? deleteFlag) => _$this._deleteFlag = deleteFlag;

  String? _collectionType;
  String? get collectionType => _$this._collectionType;
  set collectionType(String? collectionType) =>
      _$this._collectionType = collectionType;

  String? _nickName;
  String? get nickName => _$this._nickName;
  set nickName(String? nickName) => _$this._nickName = nickName;

  int? _seqUid;
  int? get seqUid => _$this._seqUid;
  set seqUid(int? seqUid) => _$this._seqUid = seqUid;

  String? _postUid;
  String? get postUid => _$this._postUid;
  set postUid(String? postUid) => _$this._postUid = postUid;

  String? _replyUid;
  String? get replyUid => _$this._replyUid;
  set replyUid(String? replyUid) => _$this._replyUid = replyUid;

  DateTime? _createDate;
  DateTime? get createDate => _$this._createDate;
  set createDate(DateTime? createDate) => _$this._createDate = createDate;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _profile;
  String? get profile => _$this._profile;
  set profile(String? profile) => _$this._profile = profile;

  String? _rereplyUid;
  String? get rereplyUid => _$this._rereplyUid;
  set rereplyUid(String? rereplyUid) => _$this._rereplyUid = rereplyUid;

  String? _rere_content;
  String? get rere_content => _$this._rere_content;
  set rere_content(String? rere_content) => _$this._rere_content = rere_content;

  String? _tagUser;
  String? get tagUser => _$this._tagUser;
  set tagUser(String? tagUser) => _$this._tagUser = tagUser;

  String? _imgDownload;
  String? get imgDownload => _$this._imgDownload;
  set imgDownload(String? imgDownload) => _$this._imgDownload = imgDownload;

  String? _deleteImgPath;
  String? get deleteImgPath => _$this._deleteImgPath;
  set deleteImgPath(String? deleteImgPath) =>
      _$this._deleteImgPath = deleteImgPath;

  AppReplyBuilder();

  AppReplyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ownerId = $v.ownerId;
      _deleteFlag = $v.deleteFlag;
      _collectionType = $v.collectionType;
      _nickName = $v.nickName;
      _seqUid = $v.seqUid;
      _postUid = $v.postUid;
      _replyUid = $v.replyUid;
      _createDate = $v.createDate;
      _content = $v.content;
      _profile = $v.profile;
      _rereplyUid = $v.rereplyUid;
      _rere_content = $v.rere_content;
      _tagUser = $v.tagUser;
      _imgDownload = $v.imgDownload;
      _deleteImgPath = $v.deleteImgPath;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppReply other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppReply;
  }

  @override
  void update(void Function(AppReplyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppReply build() {
    final _$result = _$v ??
        new _$AppReply._(
            ownerId: ownerId,
            deleteFlag: deleteFlag,
            collectionType: collectionType,
            nickName: nickName,
            seqUid: seqUid,
            postUid: postUid,
            replyUid: replyUid,
            createDate: createDate,
            content: content,
            profile: profile,
            rereplyUid: rereplyUid,
            rere_content: rere_content,
            tagUser: tagUser,
            imgDownload: imgDownload,
            deleteImgPath: deleteImgPath);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
