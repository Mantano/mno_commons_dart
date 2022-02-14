// Copyright (c) 2021 Mantano. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:mno_commons/utils/condition_predicate.dart';
import 'package:mno_commons/utils/condition_type.dart';

abstract class Predicate<T> {
  static const Predicate acceptAll = AcceptAllPredicate();
  final bool dbOnly = true;

  List<ConditionPredicate> conditionsPredicate = [];

  void addEqualsCondition(String field, Object value) {
    conditionsPredicate
        .add(ConditionPredicate(ConditionType.isEqualTo, field, value));
  }

  void addIdInCondition(String field, List<Object> value) {
    conditionsPredicate
        .add(ConditionPredicate(ConditionType.arrayContainsAny, field, value));
  }

  bool test(T element);
}

class AcceptAllPredicate<T> implements Predicate<T> {
  const AcceptAllPredicate();

  @override
  bool test(T element) => true;

  @override
  void addEqualsCondition(String field, Object value) {}

  @override
  void addIdInCondition(String field, List<Object> value) {}

  @override
  List<ConditionPredicate> get conditionsPredicate => [];

  @override
  set conditionsPredicate(List<ConditionPredicate> _conditionsPredicate) {}

  @override
  // TODO: implement dbOnly
  bool get dbOnly => true;
}
