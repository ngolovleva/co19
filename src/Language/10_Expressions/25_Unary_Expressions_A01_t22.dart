/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unary expressions invoke unary operators on objects.
 * unaryExpression:
 *   prefixOperator unaryExpression |
 *   postfixExpression |
 *   unaryOperator super |
 *   '-' super |
 *   incrementOperator assignableExpression
 * ;
 * prefixOperator:
 *   '-' |
 *   negateOperator
 * ;
 * negateOperator:
 *   '!' |
 *   '~'
 * ;
 * @description Checks that '~' can't be used with
 * a reference to a type variable.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @note issue 1225
 */

class A <T> {
  test() {
    try {~T;} catch(var e) {}
  }
}

main() {
  A a = new A();
  a.test();
}