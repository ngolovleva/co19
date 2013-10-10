/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> abstract class 
 * @description Checks that List-specific methods work as specified.
 * @author kaigorodov
 */
library allListTests;

import "add_A01_t01.test.dart" as add_A01_t01;
import "add_A01_t02.test.dart" as add_A01_t02;
import "add_A02_t01.test.dart" as add_A02_t01;
import "addAll_A01_t01.test.dart" as addAll_A01_t01;
import "addAll_A01_t02.test.dart" as addAll_A01_t02;
import "addAll_A02_t01.test.dart" as addAll_A02_t01;
import "addAll_A02_t02.test.dart" as addAll_A02_t02;
import "asMap_A01_t01.test.dart" as asMap_A01_t01;
import "asMap_A02_t01.test.dart" as asMap_A02_t01;
import "clear_A01_t01.test.dart" as clear_A01_t01;
import "clear_A02_t01.test.dart" as clear_A02_t01;
import "fillRange_A01_t01.test.dart" as fillRange_A01_t01;
import "fillRange_A02_t01.test.dart" as fillRange_A02_t01;
import "getRange_A01_t01.test.dart" as getRange_A01_t01;
import "getRange_A01_t02.test.dart" as getRange_A01_t02;
import "getRange_A02_t01.test.dart" as getRange_A02_t01;
import "getRange_A03_t01.test.dart" as getRange_A03_t01;
import "insert_A01_t01.test.dart" as insert_A01_t01;
import "insert_A02_t01.test.dart" as insert_A02_t01;
import "insertAll_A01_t01.test.dart" as insertAll_A01_t01;
import "insertAll_A02_t01.test.dart" as insertAll_A02_t01;

import "length_A01_t01.test.dart" as length_A01_t01;
import "length_A02_t01.test.dart" as length_A02_t01;
import "length_A03_t01.test.dart" as length_A03_t01;
import "length_A04_t01.test.dart" as length_A04_t01;
import "length_A05_t01.test.dart" as length_A05_t01;
import "length_A06_t01.test.dart" as length_A06_t01;
import "operator_subscript_A01_t01.test.dart" as operator_subscript_A01_t01;
import "operator_subscript_A01_t02.test.dart" as operator_subscript_A01_t02;
import "operator_subscript_A02_t01.test.dart" as operator_subscript_A02_t01;
import "operator_subscript_A03_t01.test.dart" as operator_subscript_A03_t01;
import "operator_subscript_A04_t01.test.dart" as operator_subscript_A04_t01;
import "operator_subscripted_assignment_A01_t01.test.dart" as operator_subscripted_assignment_A01_t01;
import "operator_subscripted_assignment_A01_t02.test.dart" as operator_subscripted_assignment_A01_t02;
import "operator_subscripted_assignment_A02_t01.test.dart" as operator_subscripted_assignment_A02_t01;
import "operator_subscripted_assignment_A03_t01.test.dart" as operator_subscripted_assignment_A03_t01;
import "reversed_A01_t01.test.dart" as reversed_A01_t01;

test(List create([int length])) {
  add_A01_t01.test(create);
  add_A01_t02.test(create);
  add_A02_t01.test(create);
  addAll_A01_t01.test(create);
  addAll_A01_t02.test(create);
  addAll_A02_t01.test(create);
  addAll_A02_t02.test(create);
  asMap_A01_t01.test(create);
  asMap_A02_t01.test(create);
  clear_A01_t01.test(create);
  clear_A02_t01.test(create);
  fillRange_A01_t01.test(create);
  fillRange_A02_t01.test(create);
  getRange_A01_t01.test(create);
  getRange_A01_t02.test(create);
  getRange_A02_t01.test(create);
  getRange_A03_t01.test(create);
  insert_A01_t01.test(create);
  insert_A02_t01.test(create);
  insertAll_A01_t01.test(create);
  insertAll_A02_t01.test(create);
  
  length_A01_t01.test(create);
  length_A02_t01.test(create);
  length_A03_t01.test(create);
  length_A04_t01.test(create);
  length_A05_t01.test(create);
  length_A06_t01.test(create);
  operator_subscript_A01_t01.test(create);
  operator_subscript_A01_t02.test(create);
  operator_subscript_A02_t01.test(create);
  operator_subscript_A03_t01.test(create);
  operator_subscript_A04_t01.test(create);
  operator_subscripted_assignment_A01_t01.test(create);
  operator_subscripted_assignment_A01_t02.test(create);
  operator_subscripted_assignment_A02_t01.test(create);
  operator_subscripted_assignment_A03_t01.test(create);
  reversed_A01_t01.test(create);
}