import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticlesRecord extends FirestoreRecord {
  ArticlesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "articleLink" field.
  String? _articleLink;
  String get articleLink => _articleLink ?? '';
  bool hasArticleLink() => _articleLink != null;

  // "authors" field.
  List<String>? _authors;
  List<String> get authors => _authors ?? const [];
  bool hasAuthors() => _authors != null;

  // "keywords" field.
  List<String>? _keywords;
  List<String> get keywords => _keywords ?? const [];
  bool hasKeywords() => _keywords != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "imageLink" field.
  String? _imageLink;
  String get imageLink => _imageLink ?? '';
  bool hasImageLink() => _imageLink != null;

  // "sentiment" field.
  double? _sentiment;
  double get sentiment => _sentiment ?? 0.0;
  bool hasSentiment() => _sentiment != null;

  void _initializeFields() {
    _date = snapshotData['Date'] as DateTime?;
    _title = snapshotData['Title'] as String?;
    _articleLink = snapshotData['articleLink'] as String?;
    _authors = getDataList(snapshotData['authors']);
    _keywords = getDataList(snapshotData['keywords']);
    _summary = snapshotData['summary'] as String?;
    _imageLink = snapshotData['imageLink'] as String?;
    _sentiment = castToType<double>(snapshotData['sentiment']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Articles');

  static Stream<ArticlesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticlesRecord.fromSnapshot(s));

  static Future<ArticlesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArticlesRecord.fromSnapshot(s));

  static ArticlesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticlesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticlesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticlesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArticlesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticlesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticlesRecordData({
  DateTime? date,
  String? title,
  String? articleLink,
  String? summary,
  String? imageLink,
  double? sentiment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Date': date,
      'Title': title,
      'articleLink': articleLink,
      'summary': summary,
      'imageLink': imageLink,
      'sentiment': sentiment,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArticlesRecordDocumentEquality implements Equality<ArticlesRecord> {
  const ArticlesRecordDocumentEquality();

  @override
  bool equals(ArticlesRecord? e1, ArticlesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.title == e2?.title &&
        e1?.articleLink == e2?.articleLink &&
        listEquality.equals(e1?.authors, e2?.authors) &&
        listEquality.equals(e1?.keywords, e2?.keywords) &&
        e1?.summary == e2?.summary &&
        e1?.imageLink == e2?.imageLink &&
        e1?.sentiment == e2?.sentiment;
  }

  @override
  int hash(ArticlesRecord? e) => const ListEquality().hash([
        e?.date,
        e?.title,
        e?.articleLink,
        e?.authors,
        e?.keywords,
        e?.summary,
        e?.imageLink,
        e?.sentiment
      ]);

  @override
  bool isValidKey(Object? o) => o is ArticlesRecord;
}
