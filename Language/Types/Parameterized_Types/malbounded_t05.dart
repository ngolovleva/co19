/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, let Ti be the type parameters of G and let Bi be the
 * bound of Ti, i ∈ 1..n. T is malbounded iff either Si is malbounded or Si is
 * not a subtype of [S1, ..., Sn/T1, ..., Tn]Bi, i ∈ 1..n.
 * Note, that, in checked mode, it is a dynamic type error if a malbounded type
 * is used in a type test as specified in 19.2.
 * Any use of a malbounded type gives rise to a static warning.
 * @description Checks that it is a static warning if first type argument
 * violates the bound.
 * @static-warning
 * @author rodionov
 * @reviewer iefremov
 */

class F1 {}

class F2 extends F1 {}

class F3 extends F2 {}

class A<F extends F2, T extends String, S extends Object> {}

main() {
  A<F1, String, List> a; /// static type warning
}
