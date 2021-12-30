// GENERATED CODE - DO NOT MODIFY BY HAND

part of faq;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Faq> _$faqSerializer = new _$FaqSerializer();

class _$FaqSerializer implements StructuredSerializer<Faq> {
  @override
  final Iterable<Type> types = const [Faq, _$Faq];
  @override
  final String wireName = 'Faq';

  @override
  Iterable<Object?> serialize(Serializers serializers, Faq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'question',
      serializers.serialize(object.question,
          specifiedType: const FullType(String)),
      'answer',
      serializers.serialize(object.answer,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Faq deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FaqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'answer':
          result.answer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Faq extends Faq {
  @override
  final String id;
  @override
  final String question;
  @override
  final String answer;

  factory _$Faq([void Function(FaqBuilder)? updates]) =>
      (new FaqBuilder()..update(updates)).build();

  _$Faq._({required this.id, required this.question, required this.answer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Faq', 'id');
    BuiltValueNullFieldError.checkNotNull(question, 'Faq', 'question');
    BuiltValueNullFieldError.checkNotNull(answer, 'Faq', 'answer');
  }

  @override
  Faq rebuild(void Function(FaqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FaqBuilder toBuilder() => new FaqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Faq &&
        id == other.id &&
        question == other.question &&
        answer == other.answer;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), question.hashCode), answer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Faq')
          ..add('id', id)
          ..add('question', question)
          ..add('answer', answer))
        .toString();
  }
}

class FaqBuilder implements Builder<Faq, FaqBuilder> {
  _$Faq? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _question;
  String? get question => _$this._question;
  set question(String? question) => _$this._question = question;

  String? _answer;
  String? get answer => _$this._answer;
  set answer(String? answer) => _$this._answer = answer;

  FaqBuilder();

  FaqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _question = $v.question;
      _answer = $v.answer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Faq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Faq;
  }

  @override
  void update(void Function(FaqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Faq build() {
    final _$result = _$v ??
        new _$Faq._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'Faq', 'id'),
            question: BuiltValueNullFieldError.checkNotNull(
                question, 'Faq', 'question'),
            answer:
                BuiltValueNullFieldError.checkNotNull(answer, 'Faq', 'answer'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
