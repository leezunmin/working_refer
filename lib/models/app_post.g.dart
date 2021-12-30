// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_post;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppPost> _$appPostSerializer = new _$AppPostSerializer();

class _$AppPostSerializer implements StructuredSerializer<AppPost> {
  @override
  final Iterable<Type> types = const [AppPost, _$AppPost];
  @override
  final String wireName = 'AppPost';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppPost object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'ownerId',
      serializers.serialize(object.ownerId,
          specifiedType: const FullType(String)),
      'nickName',
      serializers.serialize(object.nickName,
          specifiedType: const FullType(String)),
      'replyCount',
      serializers.serialize(object.replyCount,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.voteUid;
    if (value != null) {
      result
        ..add('voteUid')
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
    value = object.deleteFlag;
    if (value != null) {
      result
        ..add('deleteFlag')
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
    value = object.collectionType;
    if (value != null) {
      result
        ..add('collectionType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AppPostTypeEnum)));
    }
    value = object.likeCount;
    if (value != null) {
      result
        ..add('likeCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.viewCount;
    if (value != null) {
      result
        ..add('viewCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalVoteCount;
    if (value != null) {
      result
        ..add('totalVoteCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.header;
    if (value != null) {
      result
        ..add('header')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AppPostHeaderEnum)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updatedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.baseId;
    if (value != null) {
      result
        ..add('baseId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parentId;
    if (value != null) {
      result
        ..add('parentId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parentType;
    if (value != null) {
      result
        ..add('parentType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AppPostTypeEnum)));
    }
    value = object.relpyUsers;
    if (value != null) {
      result
        ..add('relpyUsers')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.likeUsers;
    if (value != null) {
      result
        ..add('likeUsers')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.voteUsers;
    if (value != null) {
      result
        ..add('voteUsers')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.vote;
    if (value != null) {
      result
        ..add('vote')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AppVote)));
    }
    value = object.voteExpire;
    if (value != null) {
      result
        ..add('voteExpire')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  AppPost deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppPostBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'voteUid':
          result.voteUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postUid':
          result.postUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'deleteFlag':
          result.deleteFlag = serializers.deserialize(value,
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
        case 'collectionType':
          result.collectionType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ownerId':
          result.ownerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nickName':
          result.nickName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(AppPostTypeEnum))
              as AppPostTypeEnum?;
          break;
        case 'likeCount':
          result.likeCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'replyCount':
          result.replyCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'viewCount':
          result.viewCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'totalVoteCount':
          result.totalVoteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'header':
          result.header = serializers.deserialize(value,
                  specifiedType: const FullType(AppPostHeaderEnum))
              as AppPostHeaderEnum?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'baseId':
          result.baseId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'parentId':
          result.parentId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'parentType':
          result.parentType = serializers.deserialize(value,
                  specifiedType: const FullType(AppPostTypeEnum))
              as AppPostTypeEnum?;
          break;
        case 'relpyUsers':
          result.relpyUsers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'likeUsers':
          result.likeUsers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'voteUsers':
          result.voteUsers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'vote':
          result.vote.replace(serializers.deserialize(value,
              specifiedType: const FullType(AppVote))! as AppVote);
          break;
        case 'voteExpire':
          result.voteExpire = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$AppPost extends AppPost {
  @override
  final String? voteUid;
  @override
  final String? postUid;
  @override
  final String? deleteFlag;
  @override
  final String? imgDownload;
  @override
  final String? deleteImgPath;
  @override
  final String? collectionType;
  @override
  final String? title;
  @override
  final String text;
  @override
  final String ownerId;
  @override
  final String nickName;
  @override
  final AppPostTypeEnum? type;
  @override
  final int? likeCount;
  @override
  final int replyCount;
  @override
  final int? viewCount;
  @override
  final int? totalVoteCount;
  @override
  final AppPostHeaderEnum? header;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? baseId;
  @override
  final String? parentId;
  @override
  final AppPostTypeEnum? parentType;
  @override
  final BuiltList<String>? relpyUsers;
  @override
  final BuiltList<String>? likeUsers;
  @override
  final BuiltList<String>? voteUsers;
  @override
  final AppVote? vote;
  @override
  final DateTime? voteExpire;

  factory _$AppPost([void Function(AppPostBuilder)? updates]) =>
      (new AppPostBuilder()..update(updates)).build();

  _$AppPost._(
      {this.voteUid,
      this.postUid,
      this.deleteFlag,
      this.imgDownload,
      this.deleteImgPath,
      this.collectionType,
      this.title,
      required this.text,
      required this.ownerId,
      required this.nickName,
      this.type,
      this.likeCount,
      required this.replyCount,
      this.viewCount,
      this.totalVoteCount,
      this.header,
      this.createdAt,
      this.updatedAt,
      this.baseId,
      this.parentId,
      this.parentType,
      this.relpyUsers,
      this.likeUsers,
      this.voteUsers,
      this.vote,
      this.voteExpire})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(text, 'AppPost', 'text');
    BuiltValueNullFieldError.checkNotNull(ownerId, 'AppPost', 'ownerId');
    BuiltValueNullFieldError.checkNotNull(nickName, 'AppPost', 'nickName');
    BuiltValueNullFieldError.checkNotNull(replyCount, 'AppPost', 'replyCount');
  }

  @override
  AppPost rebuild(void Function(AppPostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppPostBuilder toBuilder() => new AppPostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppPost &&
        voteUid == other.voteUid &&
        postUid == other.postUid &&
        deleteFlag == other.deleteFlag &&
        imgDownload == other.imgDownload &&
        deleteImgPath == other.deleteImgPath &&
        collectionType == other.collectionType &&
        title == other.title &&
        text == other.text &&
        ownerId == other.ownerId &&
        nickName == other.nickName &&
        type == other.type &&
        likeCount == other.likeCount &&
        replyCount == other.replyCount &&
        viewCount == other.viewCount &&
        totalVoteCount == other.totalVoteCount &&
        header == other.header &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        baseId == other.baseId &&
        parentId == other.parentId &&
        parentType == other.parentType &&
        relpyUsers == other.relpyUsers &&
        likeUsers == other.likeUsers &&
        voteUsers == other.voteUsers &&
        vote == other.vote &&
        voteExpire == other.voteExpire;
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
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc(0, voteUid.hashCode), postUid.hashCode), deleteFlag.hashCode), imgDownload.hashCode), deleteImgPath.hashCode), collectionType.hashCode), title.hashCode),
                                                                                text.hashCode),
                                                                            ownerId.hashCode),
                                                                        nickName.hashCode),
                                                                    type.hashCode),
                                                                likeCount.hashCode),
                                                            replyCount.hashCode),
                                                        viewCount.hashCode),
                                                    totalVoteCount.hashCode),
                                                header.hashCode),
                                            createdAt.hashCode),
                                        updatedAt.hashCode),
                                    baseId.hashCode),
                                parentId.hashCode),
                            parentType.hashCode),
                        relpyUsers.hashCode),
                    likeUsers.hashCode),
                voteUsers.hashCode),
            vote.hashCode),
        voteExpire.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppPost')
          ..add('voteUid', voteUid)
          ..add('postUid', postUid)
          ..add('deleteFlag', deleteFlag)
          ..add('imgDownload', imgDownload)
          ..add('deleteImgPath', deleteImgPath)
          ..add('collectionType', collectionType)
          ..add('title', title)
          ..add('text', text)
          ..add('ownerId', ownerId)
          ..add('nickName', nickName)
          ..add('type', type)
          ..add('likeCount', likeCount)
          ..add('replyCount', replyCount)
          ..add('viewCount', viewCount)
          ..add('totalVoteCount', totalVoteCount)
          ..add('header', header)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('baseId', baseId)
          ..add('parentId', parentId)
          ..add('parentType', parentType)
          ..add('relpyUsers', relpyUsers)
          ..add('likeUsers', likeUsers)
          ..add('voteUsers', voteUsers)
          ..add('vote', vote)
          ..add('voteExpire', voteExpire))
        .toString();
  }
}

class AppPostBuilder implements Builder<AppPost, AppPostBuilder> {
  _$AppPost? _$v;

  String? _voteUid;
  String? get voteUid => _$this._voteUid;
  set voteUid(String? voteUid) => _$this._voteUid = voteUid;

  String? _postUid;
  String? get postUid => _$this._postUid;
  set postUid(String? postUid) => _$this._postUid = postUid;

  String? _deleteFlag;
  String? get deleteFlag => _$this._deleteFlag;
  set deleteFlag(String? deleteFlag) => _$this._deleteFlag = deleteFlag;

  String? _imgDownload;
  String? get imgDownload => _$this._imgDownload;
  set imgDownload(String? imgDownload) => _$this._imgDownload = imgDownload;

  String? _deleteImgPath;
  String? get deleteImgPath => _$this._deleteImgPath;
  set deleteImgPath(String? deleteImgPath) =>
      _$this._deleteImgPath = deleteImgPath;

  String? _collectionType;
  String? get collectionType => _$this._collectionType;
  set collectionType(String? collectionType) =>
      _$this._collectionType = collectionType;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _ownerId;
  String? get ownerId => _$this._ownerId;
  set ownerId(String? ownerId) => _$this._ownerId = ownerId;

  String? _nickName;
  String? get nickName => _$this._nickName;
  set nickName(String? nickName) => _$this._nickName = nickName;

  AppPostTypeEnum? _type;
  AppPostTypeEnum? get type => _$this._type;
  set type(AppPostTypeEnum? type) => _$this._type = type;

  int? _likeCount;
  int? get likeCount => _$this._likeCount;
  set likeCount(int? likeCount) => _$this._likeCount = likeCount;

  int? _replyCount;
  int? get replyCount => _$this._replyCount;
  set replyCount(int? replyCount) => _$this._replyCount = replyCount;

  int? _viewCount;
  int? get viewCount => _$this._viewCount;
  set viewCount(int? viewCount) => _$this._viewCount = viewCount;

  int? _totalVoteCount;
  int? get totalVoteCount => _$this._totalVoteCount;
  set totalVoteCount(int? totalVoteCount) =>
      _$this._totalVoteCount = totalVoteCount;

  AppPostHeaderEnum? _header;
  AppPostHeaderEnum? get header => _$this._header;
  set header(AppPostHeaderEnum? header) => _$this._header = header;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  String? _baseId;
  String? get baseId => _$this._baseId;
  set baseId(String? baseId) => _$this._baseId = baseId;

  String? _parentId;
  String? get parentId => _$this._parentId;
  set parentId(String? parentId) => _$this._parentId = parentId;

  AppPostTypeEnum? _parentType;
  AppPostTypeEnum? get parentType => _$this._parentType;
  set parentType(AppPostTypeEnum? parentType) =>
      _$this._parentType = parentType;

  ListBuilder<String>? _relpyUsers;
  ListBuilder<String> get relpyUsers =>
      _$this._relpyUsers ??= new ListBuilder<String>();
  set relpyUsers(ListBuilder<String>? relpyUsers) =>
      _$this._relpyUsers = relpyUsers;

  ListBuilder<String>? _likeUsers;
  ListBuilder<String> get likeUsers =>
      _$this._likeUsers ??= new ListBuilder<String>();
  set likeUsers(ListBuilder<String>? likeUsers) =>
      _$this._likeUsers = likeUsers;

  ListBuilder<String>? _voteUsers;
  ListBuilder<String> get voteUsers =>
      _$this._voteUsers ??= new ListBuilder<String>();
  set voteUsers(ListBuilder<String>? voteUsers) =>
      _$this._voteUsers = voteUsers;

  AppVoteBuilder? _vote;
  AppVoteBuilder get vote => _$this._vote ??= new AppVoteBuilder();
  set vote(AppVoteBuilder? vote) => _$this._vote = vote;

  DateTime? _voteExpire;
  DateTime? get voteExpire => _$this._voteExpire;
  set voteExpire(DateTime? voteExpire) => _$this._voteExpire = voteExpire;

  AppPostBuilder() {
    AppPost._initializeBuilder(this);
  }

  AppPostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _voteUid = $v.voteUid;
      _postUid = $v.postUid;
      _deleteFlag = $v.deleteFlag;
      _imgDownload = $v.imgDownload;
      _deleteImgPath = $v.deleteImgPath;
      _collectionType = $v.collectionType;
      _title = $v.title;
      _text = $v.text;
      _ownerId = $v.ownerId;
      _nickName = $v.nickName;
      _type = $v.type;
      _likeCount = $v.likeCount;
      _replyCount = $v.replyCount;
      _viewCount = $v.viewCount;
      _totalVoteCount = $v.totalVoteCount;
      _header = $v.header;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _baseId = $v.baseId;
      _parentId = $v.parentId;
      _parentType = $v.parentType;
      _relpyUsers = $v.relpyUsers?.toBuilder();
      _likeUsers = $v.likeUsers?.toBuilder();
      _voteUsers = $v.voteUsers?.toBuilder();
      _vote = $v.vote?.toBuilder();
      _voteExpire = $v.voteExpire;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppPost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppPost;
  }

  @override
  void update(void Function(AppPostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppPost build() {
    _$AppPost _$result;
    try {
      _$result = _$v ??
          new _$AppPost._(
              voteUid: voteUid,
              postUid: postUid,
              deleteFlag: deleteFlag,
              imgDownload: imgDownload,
              deleteImgPath: deleteImgPath,
              collectionType: collectionType,
              title: title,
              text: BuiltValueNullFieldError.checkNotNull(
                  text, 'AppPost', 'text'),
              ownerId: BuiltValueNullFieldError.checkNotNull(
                  ownerId, 'AppPost', 'ownerId'),
              nickName: BuiltValueNullFieldError.checkNotNull(
                  nickName, 'AppPost', 'nickName'),
              type: type,
              likeCount: likeCount,
              replyCount: BuiltValueNullFieldError.checkNotNull(
                  replyCount, 'AppPost', 'replyCount'),
              viewCount: viewCount,
              totalVoteCount: totalVoteCount,
              header: header,
              createdAt: createdAt,
              updatedAt: updatedAt,
              baseId: baseId,
              parentId: parentId,
              parentType: parentType,
              relpyUsers: _relpyUsers?.build(),
              likeUsers: _likeUsers?.build(),
              voteUsers: _voteUsers?.build(),
              vote: _vote?.build(),
              voteExpire: voteExpire);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'relpyUsers';
        _relpyUsers?.build();
        _$failedField = 'likeUsers';
        _likeUsers?.build();
        _$failedField = 'voteUsers';
        _voteUsers?.build();
        _$failedField = 'vote';
        _vote?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppPost', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
