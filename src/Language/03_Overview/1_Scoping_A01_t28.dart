/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart is lexically scoped and uses a single namespace for variables, functions and types.
 * It is a compile-time error if there is more than one entity, other than a setter and a getter,
 * with the same name declared in the same scope.
 * @description Checks that a nested scope has access to names from enclosing scopes.
 * @author msyabro
 * @reviewer iefremov
 */

var x;

main() {
  func (p) {Expect.equals(p, x);};
  x = 1;
  () {
    x = 2;
    func(2);
    {
      x = 3;
      func(3);
      () {
        x = 4;
        func(4);
        {
          x = 5;
          func(5);
        }
      } ();
    }
  }();
}