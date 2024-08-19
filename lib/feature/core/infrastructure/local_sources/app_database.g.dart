// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductEntryTable extends ProductEntry
    with TableInfo<$ProductEntryTable, ProductEntryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductEntryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
      'rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _rateCountMeta =
      const VerificationMeta('rateCount');
  @override
  late final GeneratedColumn<int> rateCount = GeneratedColumn<int>(
      'rate_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, price, description, category, image, rate, rateCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_entry';
  @override
  VerificationContext validateIntegrity(Insertable<ProductEntryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
          _rateMeta, rate.isAcceptableOrUnknown(data['rate']!, _rateMeta));
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    if (data.containsKey('rate_count')) {
      context.handle(_rateCountMeta,
          rateCount.isAcceptableOrUnknown(data['rate_count']!, _rateCountMeta));
    } else if (isInserting) {
      context.missing(_rateCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductEntryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductEntryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      rate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rate'])!,
      rateCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rate_count'])!,
    );
  }

  @override
  $ProductEntryTable createAlias(String alias) {
    return $ProductEntryTable(attachedDatabase, alias);
  }
}

class ProductEntryData extends DataClass
    implements Insertable<ProductEntryData> {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rate;
  final int rateCount;
  const ProductEntryData(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rate,
      required this.rateCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['price'] = Variable<double>(price);
    map['description'] = Variable<String>(description);
    map['category'] = Variable<String>(category);
    map['image'] = Variable<String>(image);
    map['rate'] = Variable<double>(rate);
    map['rate_count'] = Variable<int>(rateCount);
    return map;
  }

  ProductEntryCompanion toCompanion(bool nullToAbsent) {
    return ProductEntryCompanion(
      id: Value(id),
      title: Value(title),
      price: Value(price),
      description: Value(description),
      category: Value(category),
      image: Value(image),
      rate: Value(rate),
      rateCount: Value(rateCount),
    );
  }

  factory ProductEntryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductEntryData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      price: serializer.fromJson<double>(json['price']),
      description: serializer.fromJson<String>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      image: serializer.fromJson<String>(json['image']),
      rate: serializer.fromJson<double>(json['rate']),
      rateCount: serializer.fromJson<int>(json['rateCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'price': serializer.toJson<double>(price),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<String>(category),
      'image': serializer.toJson<String>(image),
      'rate': serializer.toJson<double>(rate),
      'rateCount': serializer.toJson<int>(rateCount),
    };
  }

  ProductEntryData copyWith(
          {int? id,
          String? title,
          double? price,
          String? description,
          String? category,
          String? image,
          double? rate,
          int? rateCount}) =>
      ProductEntryData(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
        rate: rate ?? this.rate,
        rateCount: rateCount ?? this.rateCount,
      );
  ProductEntryData copyWithCompanion(ProductEntryCompanion data) {
    return ProductEntryData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      price: data.price.present ? data.price.value : this.price,
      description:
          data.description.present ? data.description.value : this.description,
      category: data.category.present ? data.category.value : this.category,
      image: data.image.present ? data.image.value : this.image,
      rate: data.rate.present ? data.rate.value : this.rate,
      rateCount: data.rateCount.present ? data.rateCount.value : this.rateCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductEntryData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('image: $image, ')
          ..write('rate: $rate, ')
          ..write('rateCount: $rateCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, price, description, category, image, rate, rateCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductEntryData &&
          other.id == this.id &&
          other.title == this.title &&
          other.price == this.price &&
          other.description == this.description &&
          other.category == this.category &&
          other.image == this.image &&
          other.rate == this.rate &&
          other.rateCount == this.rateCount);
}

class ProductEntryCompanion extends UpdateCompanion<ProductEntryData> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> price;
  final Value<String> description;
  final Value<String> category;
  final Value<String> image;
  final Value<double> rate;
  final Value<int> rateCount;
  const ProductEntryCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.price = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.image = const Value.absent(),
    this.rate = const Value.absent(),
    this.rateCount = const Value.absent(),
  });
  ProductEntryCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required double rate,
    required int rateCount,
  })  : title = Value(title),
        price = Value(price),
        description = Value(description),
        category = Value(category),
        image = Value(image),
        rate = Value(rate),
        rateCount = Value(rateCount);
  static Insertable<ProductEntryData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? price,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? image,
    Expression<double>? rate,
    Expression<int>? rateCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (price != null) 'price': price,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (image != null) 'image': image,
      if (rate != null) 'rate': rate,
      if (rateCount != null) 'rate_count': rateCount,
    });
  }

  ProductEntryCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<double>? price,
      Value<String>? description,
      Value<String>? category,
      Value<String>? image,
      Value<double>? rate,
      Value<int>? rateCount}) {
    return ProductEntryCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rate: rate ?? this.rate,
      rateCount: rateCount ?? this.rateCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (rateCount.present) {
      map['rate_count'] = Variable<int>(rateCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductEntryCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('image: $image, ')
          ..write('rate: $rate, ')
          ..write('rateCount: $rateCount')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductEntryTable productEntry = $ProductEntryTable(this);
  late final ProductsDao productsDao = ProductsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productEntry];
}

typedef $$ProductEntryTableCreateCompanionBuilder = ProductEntryCompanion
    Function({
  Value<int> id,
  required String title,
  required double price,
  required String description,
  required String category,
  required String image,
  required double rate,
  required int rateCount,
});
typedef $$ProductEntryTableUpdateCompanionBuilder = ProductEntryCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<double> price,
  Value<String> description,
  Value<String> category,
  Value<String> image,
  Value<double> rate,
  Value<int> rateCount,
});

class $$ProductEntryTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProductEntryTable> {
  $$ProductEntryTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get rate => $state.composableBuilder(
      column: $state.table.rate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get rateCount => $state.composableBuilder(
      column: $state.table.rateCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ProductEntryTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProductEntryTable> {
  $$ProductEntryTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get rate => $state.composableBuilder(
      column: $state.table.rate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get rateCount => $state.composableBuilder(
      column: $state.table.rateCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ProductEntryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductEntryTable,
    ProductEntryData,
    $$ProductEntryTableFilterComposer,
    $$ProductEntryTableOrderingComposer,
    $$ProductEntryTableCreateCompanionBuilder,
    $$ProductEntryTableUpdateCompanionBuilder,
    (
      ProductEntryData,
      BaseReferences<_$AppDatabase, $ProductEntryTable, ProductEntryData>
    ),
    ProductEntryData,
    PrefetchHooks Function()> {
  $$ProductEntryTableTableManager(_$AppDatabase db, $ProductEntryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProductEntryTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ProductEntryTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<double> rate = const Value.absent(),
            Value<int> rateCount = const Value.absent(),
          }) =>
              ProductEntryCompanion(
            id: id,
            title: title,
            price: price,
            description: description,
            category: category,
            image: image,
            rate: rate,
            rateCount: rateCount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required double price,
            required String description,
            required String category,
            required String image,
            required double rate,
            required int rateCount,
          }) =>
              ProductEntryCompanion.insert(
            id: id,
            title: title,
            price: price,
            description: description,
            category: category,
            image: image,
            rate: rate,
            rateCount: rateCount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductEntryTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductEntryTable,
    ProductEntryData,
    $$ProductEntryTableFilterComposer,
    $$ProductEntryTableOrderingComposer,
    $$ProductEntryTableCreateCompanionBuilder,
    $$ProductEntryTableUpdateCompanionBuilder,
    (
      ProductEntryData,
      BaseReferences<_$AppDatabase, $ProductEntryTable, ProductEntryData>
    ),
    ProductEntryData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductEntryTableTableManager get productEntry =>
      $$ProductEntryTableTableManager(_db, _db.productEntry);
}
