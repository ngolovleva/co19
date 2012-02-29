/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * operatorSignature: returnType? operator operator formalParameterList ;
 * operator: unaryOperator | binaryOperator | '[]' | '[]=' | negate | call;
 * unaryOperator: negateOperator ;
 * binaryOperator: multiplicativeOperator | additiveOperator | shiftOperator |
 *   relationalOperator | equalityOperator | bitwiseOperator ;
 * prefixOperator: '-' | negateOperator ;
 * negateOperator: '!' | '~' ;
 * @description Checks that any return type (including function type, type parameter,
 * void or no return type at all) can be specified for any operator.
 * @static-warning
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 * @needsreview The assertion probably would change, because of inconsistencies in the grammar (issue 954)
 * @needsreview Issue 1604
 */

typedef int foo(double);

class C<T> {
  int operator +(var v) {}
  List operator [](var v) {}
  operator -(var v) {}
  operator []=(var v, var v2) {}
  void operator negate() {}
  Dynamic operator ~() {}
  foo operator *(var v) {}
  T operator >(var v) {}
  bool operator call(u, v) {}
}

main() {
  try {
    C c = new C();
    var x = c + c;
    x = c - c;
    x = c[c];
    c[c] = c;
    -c;
    x = ~c;
    x = c(1, 2);
  } catch (var ok) {}
}

