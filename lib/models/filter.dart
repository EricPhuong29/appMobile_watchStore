class Filter {
  String title;
  QuerySize? querySize;
  QueryPrice? queryPrice;
  String? wire;
  String? factory;

  Filter({
    required this.title,
    this.querySize,
    this.queryPrice,
    this.wire,
    this.factory,
  });
}

class QuerySize {
  double? startSize;
  double? endSize;

  QuerySize({
    this.startSize,
    this.endSize,
  });
}

class QueryPrice {
  double? startPrice;
  double? endPrice;

  QueryPrice({
    this.startPrice,
    this.endPrice,
  });
}
