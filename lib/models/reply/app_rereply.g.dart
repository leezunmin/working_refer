// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_re_reply;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppReReply> _$appReReplySerializer = new _$AppReReplySerializer();

class _$AppReReplySerializer implements StructuredSerializer<AppReReply> {
  @override
  final Iterable<Type> types = const [AppReReply, _$AppReReply];
  @override
  final String wireName = 'AppReReply';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppReReply object,
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
    value = object.rereplyUid;
    if (value != null) {
      result
        ..add('rereplyUid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
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
    value = object.createDate;
    if (value != null) {
      result
        ..add('createDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.reCommentTarget;
    if (value != null) {
      result
        ..add('reCommentTarget')
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
  AppReReply deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppReReplyBuilder();

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
        case 'postUid':
          result.postUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'replyUid':
          result.replyUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rereplyUid':
          result.rereplyUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tagUser':
          result.tagUser = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createDate':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'reCommentTarget':
          result.reCommentTarget = serializers.deserialize(value,
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

class _$AppReReply extends AppReReply {
  @override
  final String? ownerId;
  @override
  final String? deleteFlag;
  @override
  final String? collectionType;
  @override
  final String? nickName;
  @override
  final String? postUid;
  @override
  final String? replyUid;
  @override
  final String? rereplyUid;
  @override
  final String? content;
  @override
  final String? tagUser;
  @override
  final DateTime? createDate;
  @override
  final String? reCommentTarget;
  @override
  final String? imgDownload;
  @override
  final String? deleteImgPath;

  factory _$AppReReply([void Function(AppReReplyBuilder)? updates]) =>
      (new AppReReplyBuilder()..update(updates)).build();

  _$AppReReply._(
      {this.ownerId,
      this.deleteFlag,
      this.collectionType,
      this.nickName,
      this.postUid,
      this.replyUid,
      this.rereplyUid,
      this.content,
      this.tagUser,
      this.createDate,
      this.reCommentTarget,
      this.imgDownload,
      this.deleteImgPath})
      : super._();

  @override
  AppReReply rebuild(void Function(AppReReplyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppReReplyBuilder toBuilder() => new AppReReplyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppReReply &&
        ownerId == other.ownerId &&
        deleteFlag == other.deleteFlag &&
        collectionType == other.collectionType &&
        nickName == other.nickName &&
        postUid == other.postUid &&
        replyUid == other.replyUid &&
        rereplyUid == other.rereplyUid &&
        content == other.content &&
        tagUser == other.tagUser &&
        createDate == other.createDate &&
        reCommentTarget == other.reCommentTarget &&
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
                                                $jc($jc(0, ownerId.hashCode),
                                                    deleteFlag.hashCode),
                                                collectionType.hashCode),
                                            nickName.hashCode),
                                        postUid.hashCode),
                                    replyUid.hashCode),
                                rereplyUid.hashCode),
                            content.hashCode),
                        tagUser.hashCode),
                    createDate.hashCode),
                reCommentTarget.hashCode),
            imgDownload.hashCode),
        deleteImgPath.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppReReply')
          ..add('ownerId', ownerId)
          ..add('deleteFlag', deleteFlag)
          ..add('collectionType', collectionType)
          ..add('nickName', nickName)
          ..add('postUid', postUid)
          ..add('replyUid', replyUid)
          ..add('rereplyUid', rereplyUid)
          ..add('content', content)
          ..add('tagUser', tagUser)
          ..add('createDate', createDate)
          ..add('reCommentTarget', reCommentTarget)
          ..add('imgDownload', imgDownload)
          ..add('deleteImgPath', deleteImgPath))
        .toString();
  }
}

class AppReReplyBuilder implements Builder<AppReReply, AppReReplyBuilder> {
  _$AppReReply? _$v;

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

  String? _postUid;
  String? get postUid => _$this._postUid;
  set postUid(String? postUid) => _$this._postUid = postUid;

  String? _replyUid;
  String? get replyUid => _$this._replyUid;
  set replyUid(String? replyUid) => _$this._replyUid = replyUid;

  String? _rereplyUid;
  String? get rereplyUid => _$this._rereplyUid;
  set rereplyUid(String? rereplyUid) => _$this._rereplyUid = rereplyUid;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _tagUser;
  String? get tagUser => _$this._tagUser;
  set tagUser(String? tagUser) => _$this._tagUser = tagUser;

  DateTime? _createDate;
  DateTime? get createDate => _$this._createDate;
  set createDate(DateTime? createDate) => _$this._createDate = createDate;

  String? _reCommentTarget;
  String? get reCommentTarget => _$this._reCommentTarget;
  set reCommentTarget(String? reCommentTarget) =>
      _$this._reCommentTarget = reCommentTarget;

  String? _imgDownload;
  String? get imgDownload => _$this._imgDownload;
  set imgDownload(String? imgDownload) => _$this._imgDownload = imgDownload;

  String? _deleteImgPath;
  String? get deleteImgPath => _$this._deleteImgPath;
  set deleteImgPath(String? deleteImgPath) =>
      _$this._deleteImgPath = deleteImgPath;

  AppReReplyBuilder();

  AppReReplyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ownerId = $v.ownerId;
      _deleteFlag = $v.deleteFlag;
      _collectionType = $v.collectionType;
      _nickName = $v.nickName;
      _postUid = $v.postUid;
      _replyUid = $v.replyUid;
      _rereplyUid = $v.rereplyUid;
      _content = $v.content;
      _tagUser = $v.tagUser;
      _createDate = $v.createDate;
      _reCommentTarget = $v.reCommentTarget;
      _imgDownload = $v.imgDownload;
      _deleteImgPath = $v.deleteImgPath;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppReReply other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppReReply;
  }

  @override
  void update(void Function(AppReReplyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppReReply build() {
    final _$result = _$v ??
        new _$AppReReply._(
            ownerId: ownerId,
            deleteFlag: deleteFlag,
            collectionType: collectionType,
            nickName: nickName,
            postUid: postUid,
            replyUid: replyUid,
            rereplyUid: rereplyUid,
            content: content,
            tagUser: tagUser,
            createDate: createDate,
            reCommentTarget: reCommentTarget,
            imgDownload: imgDownload,
            deleteImgPath: deleteImgPath);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
