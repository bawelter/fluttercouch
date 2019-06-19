import 'dart:async';
import 'dart:collection';

import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

import '../listener_token.dart';

import 'query.dart';
import 'from.dart';
import 'functions.dart';
import 'group_by.dart';
import 'having.dart';
import 'join.dart';
import 'joins.dart';
import 'limit.dart';
import 'order_by.dart';
import 'ordering.dart';
import 'parameters.dart';
import 'query_builder.dart';
import 'result.dart';
import 'result_set.dart';
import 'select.dart';
import 'select_result.dart';
import 'where.dart';

import 'expression/expression.dart';
import 'expression/meta.dart';
import 'expression/meta_expression.dart';
import 'expression/property_expression.dart';
import 'expression/variable_expression.dart';

class From extends Query {
  Where where(Expression expression) {
    var resultQuery = new Where();
    resultQuery.internalOptions = this.options;
    resultQuery.internalOptions["where"] = expression;
    return resultQuery;
  }

  GroupBy groupBy(List<Expression> expressionList) {
    var resultQuery = new GroupBy();
    resultQuery.internalOptions = this.options;
    resultQuery.internalOptions["groupBy"] = expressionList;
    return resultQuery;
  }

  Joins join(Join expression) {
    var resultQuery = new Joins();
    resultQuery.internalOptions = this.options;
    resultQuery.internalOptions["joins"] = expression;
    return resultQuery;
  }

  Limit limit(Expression expression, {Expression offset}) {
    var resultQuery = new Limit();
    resultQuery.internalOptions = this.options;
    if (offset != null) {
      resultQuery.internalOptions["limit"] = [expression, offset];
    } else {
      resultQuery.internalOptions["limit"] = [expression];
    }
    return resultQuery;
  }

  OrderBy orderBy(List<Ordering> orderingList) {
    var resultQuery = new OrderBy();
    resultQuery.internalOptions = this.options;
    resultQuery.internalOptions["orderBy"] = orderingList;
    return resultQuery;
  }
}
