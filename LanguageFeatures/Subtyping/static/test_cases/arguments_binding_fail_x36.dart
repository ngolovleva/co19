/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Instance method required argument is
 * tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class ArgumentsBindingClassGen<X> {
  ArgumentsBindingClassGen(X t1) {}

  namedArgumentsMethod(X t1, {X t2}) {}
}

main() {
  new ArgumentsBindingClassGen<@T1>(t1Instance).namedArgumentsMethod(
    t0Instance);
}