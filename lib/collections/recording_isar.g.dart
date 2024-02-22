// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecordingRecordCollection on Isar {
  IsarCollection<RecordingRecord> get recordingRecords => this.collection();
}

const RecordingRecordSchema = CollectionSchema(
  name: r'RecordingRecord',
  id: 6423076984909896630,
  properties: {
    r'dedicationLevel': PropertySchema(
      id: 0,
      name: r'dedicationLevel',
      type: IsarType.long,
    ),
    r'lastRecorded': PropertySchema(
      id: 1,
      name: r'lastRecorded',
      type: IsarType.string,
    ),
    r'lastRecordingType': PropertySchema(
      id: 2,
      name: r'lastRecordingType',
      type: IsarType.string,
    ),
    r'recordingPoints': PropertySchema(
      id: 3,
      name: r'recordingPoints',
      type: IsarType.long,
    ),
    r'rpForRecordingNow': PropertySchema(
      id: 4,
      name: r'rpForRecordingNow',
      type: IsarType.long,
    ),
    r'rpNeededForNextLevel': PropertySchema(
      id: 5,
      name: r'rpNeededForNextLevel',
      type: IsarType.long,
    )
  },
  estimateSize: _recordingRecordEstimateSize,
  serialize: _recordingRecordSerialize,
  deserialize: _recordingRecordDeserialize,
  deserializeProp: _recordingRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _recordingRecordGetId,
  getLinks: _recordingRecordGetLinks,
  attach: _recordingRecordAttach,
  version: '3.1.0+1',
);

int _recordingRecordEstimateSize(
  RecordingRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.lastRecorded.length * 3;
  bytesCount += 3 + object.lastRecordingType.length * 3;
  return bytesCount;
}

void _recordingRecordSerialize(
  RecordingRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.dedicationLevel);
  writer.writeString(offsets[1], object.lastRecorded);
  writer.writeString(offsets[2], object.lastRecordingType);
  writer.writeLong(offsets[3], object.recordingPoints);
  writer.writeLong(offsets[4], object.rpForRecordingNow);
  writer.writeLong(offsets[5], object.rpNeededForNextLevel);
}

RecordingRecord _recordingRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecordingRecord(
    dedicationLevel: reader.readLong(offsets[0]),
    lastRecorded: reader.readString(offsets[1]),
    lastRecordingType: reader.readString(offsets[2]),
    recordingPoints: reader.readLong(offsets[3]),
    rpForRecordingNow: reader.readLong(offsets[4]),
    rpNeededForNextLevel: reader.readLong(offsets[5]),
  );
  object.id = id;
  return object;
}

P _recordingRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recordingRecordGetId(RecordingRecord object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _recordingRecordGetLinks(RecordingRecord object) {
  return [];
}

void _recordingRecordAttach(
    IsarCollection<dynamic> col, Id id, RecordingRecord object) {
  object.id = id;
}

extension RecordingRecordQueryWhereSort
    on QueryBuilder<RecordingRecord, RecordingRecord, QWhere> {
  QueryBuilder<RecordingRecord, RecordingRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecordingRecordQueryWhere
    on QueryBuilder<RecordingRecord, RecordingRecord, QWhereClause> {
  QueryBuilder<RecordingRecord, RecordingRecord, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecordingRecordQueryFilter
    on QueryBuilder<RecordingRecord, RecordingRecord, QFilterCondition> {
  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      dedicationLevelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dedicationLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      dedicationLevelGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dedicationLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      dedicationLevelLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dedicationLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      dedicationLevelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dedicationLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastRecorded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastRecorded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastRecorded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastRecorded',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastRecorded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastRecorded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastRecorded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastRecorded',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastRecorded',
        value: '',
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastRecorded',
        value: '',
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordingTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastRecordingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordingTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastRecordingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordingTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastRecordingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordingTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastRecordingType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordingTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastRecordingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordingTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastRecordingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordingTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastRecordingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordingTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastRecordingType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordingTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastRecordingType',
        value: '',
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      lastRecordingTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastRecordingType',
        value: '',
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      recordingPointsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordingPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      recordingPointsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recordingPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      recordingPointsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recordingPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      recordingPointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recordingPoints',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      rpForRecordingNowEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rpForRecordingNow',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      rpForRecordingNowGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rpForRecordingNow',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      rpForRecordingNowLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rpForRecordingNow',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      rpForRecordingNowBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rpForRecordingNow',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      rpNeededForNextLevelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rpNeededForNextLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      rpNeededForNextLevelGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rpNeededForNextLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      rpNeededForNextLevelLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rpNeededForNextLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterFilterCondition>
      rpNeededForNextLevelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rpNeededForNextLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecordingRecordQueryObject
    on QueryBuilder<RecordingRecord, RecordingRecord, QFilterCondition> {}

extension RecordingRecordQueryLinks
    on QueryBuilder<RecordingRecord, RecordingRecord, QFilterCondition> {}

extension RecordingRecordQuerySortBy
    on QueryBuilder<RecordingRecord, RecordingRecord, QSortBy> {
  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      sortByDedicationLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dedicationLevel', Sort.asc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      sortByDedicationLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dedicationLevel', Sort.desc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      sortByLastRecorded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRecorded', Sort.asc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      sortByLastRecordedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRecorded', Sort.desc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      sortByLastRecordingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRecordingType', Sort.asc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      sortByLastRecordingTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRecordingType', Sort.desc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      sortByRecordingPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordingPoints', Sort.asc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      sortByRecordingPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordingPoints', Sort.desc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      sortByRpForRecordingNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpForRecordingNow', Sort.asc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      sortByRpForRecordingNowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpForRecordingNow', Sort.desc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      sortByRpNeededForNextLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpNeededForNextLevel', Sort.asc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      sortByRpNeededForNextLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpNeededForNextLevel', Sort.desc);
    });
  }
}

extension RecordingRecordQuerySortThenBy
    on QueryBuilder<RecordingRecord, RecordingRecord, QSortThenBy> {
  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      thenByDedicationLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dedicationLevel', Sort.asc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      thenByDedicationLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dedicationLevel', Sort.desc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      thenByLastRecorded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRecorded', Sort.asc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      thenByLastRecordedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRecorded', Sort.desc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      thenByLastRecordingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRecordingType', Sort.asc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      thenByLastRecordingTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRecordingType', Sort.desc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      thenByRecordingPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordingPoints', Sort.asc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      thenByRecordingPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordingPoints', Sort.desc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      thenByRpForRecordingNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpForRecordingNow', Sort.asc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      thenByRpForRecordingNowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpForRecordingNow', Sort.desc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      thenByRpNeededForNextLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpNeededForNextLevel', Sort.asc);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QAfterSortBy>
      thenByRpNeededForNextLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpNeededForNextLevel', Sort.desc);
    });
  }
}

extension RecordingRecordQueryWhereDistinct
    on QueryBuilder<RecordingRecord, RecordingRecord, QDistinct> {
  QueryBuilder<RecordingRecord, RecordingRecord, QDistinct>
      distinctByDedicationLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dedicationLevel');
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QDistinct>
      distinctByLastRecorded({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastRecorded', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QDistinct>
      distinctByLastRecordingType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastRecordingType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QDistinct>
      distinctByRecordingPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordingPoints');
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QDistinct>
      distinctByRpForRecordingNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rpForRecordingNow');
    });
  }

  QueryBuilder<RecordingRecord, RecordingRecord, QDistinct>
      distinctByRpNeededForNextLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rpNeededForNextLevel');
    });
  }
}

extension RecordingRecordQueryProperty
    on QueryBuilder<RecordingRecord, RecordingRecord, QQueryProperty> {
  QueryBuilder<RecordingRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecordingRecord, int, QQueryOperations>
      dedicationLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dedicationLevel');
    });
  }

  QueryBuilder<RecordingRecord, String, QQueryOperations>
      lastRecordedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastRecorded');
    });
  }

  QueryBuilder<RecordingRecord, String, QQueryOperations>
      lastRecordingTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastRecordingType');
    });
  }

  QueryBuilder<RecordingRecord, int, QQueryOperations>
      recordingPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordingPoints');
    });
  }

  QueryBuilder<RecordingRecord, int, QQueryOperations>
      rpForRecordingNowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rpForRecordingNow');
    });
  }

  QueryBuilder<RecordingRecord, int, QQueryOperations>
      rpNeededForNextLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rpNeededForNextLevel');
    });
  }
}
