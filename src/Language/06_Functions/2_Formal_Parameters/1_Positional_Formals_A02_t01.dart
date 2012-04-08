/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A positional formal parameter is a simple variable declaration.
 * normalFormalParameter:
 *   functionSignature |
 *   fieldFormalParameter |
 *   simpleFormalParameter
 * ;
 * simpleFormalParameter:
 *   declaredIdentifier |
 *   identifier
 * ;
 * fieldFormalParameter:
 *   finalConstVarOrType? this '.' identifier
 * ;
 * @description Checks various positional parameters.
 * @author msyabro
 * @reviewer iefremov
 */

func_func(void g(var x) ) {}
func_var(var x) {}
func_final(final x) {}
func_finalTyped(final int x) {}
func_const(const x) {}
func_constTyped(const int $) {}
func_typed(int x) {}
func_undeclared(z) {}
func(var x, final y, int z, a, void f()) {}

class A<TypeParam> {
  A(this.x);
  A.named(TypeParam this.x);
  var x;
  method_func(void g(var x) ) {}
  method_var(var x) {}
  method_final(final x) {}
  method_finalTyped(final int x) {}
  method_const(const x) {}
  method_constTyped(const int $) {}
  method_typed(int x) {}
  method_undeclared(z) {}
  method(var x, final y, int z, a, void f()) {}
}

main() {
  func_func(null);
  func_var(null);
  func_final(null);
  func_finalTyped(null);
  func_const(null);
  func_constTyped(null);
  func_typed(null);
  func_undeclared(1);
  func(1, 2, 3, 4, null);

  A a = new A(1);
  a = new A.named(1);
  a.method_func(null);
  a.method_var(null);
  a.method_final(null);
  a.method_finalTyped(null);
  a.method_const(null);
  a.method_constTyped(null);
  a.method_typed(null);
  a.method_undeclared(1);
  a.method(1, 2, 3, 4, null);
}