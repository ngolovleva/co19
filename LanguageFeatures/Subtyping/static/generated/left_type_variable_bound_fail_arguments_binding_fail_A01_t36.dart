/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Type Variable Bound: T0 is a type variable X0 with bound B0
 *   and B0 <: T1
 * @description Check that if T0 is a type variable X0 with bound B0 and
 * B0 is not a subtype of T1 then T0 is not a subtype of a type T1.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Instance method required argument is
 * tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_type_variable_bound_fail_A01.dart and 
 * arguments_binding_fail_x36.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

class T1 {}
class B0 {}
class X0 extends B0 {}

X0 t0Instance = new X0();
T1 t1Instance = new T1();




class ArgumentsBindingClassGen<X> {
  ArgumentsBindingClassGen(X t1) {}

  namedArgumentsMethod(X t1, {X t2}) {}
}

main() {
  new ArgumentsBindingClassGen<T1>(t1Instance).namedArgumentsMethod(
    t0Instance);
}