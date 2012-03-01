/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Bitwise expressions invoke the bitwise operators on objects.
 * bitwiseOrExpression:
 *   bitwiseXorExpression ('|' bitwiseXorExpression)* |
 *   super ('|' bitwiseXorExpression)+
 * ;
 * bitwiseXorExpression:
 *   bitwiseAndExpression ('^' bitwiseAndExpression)* |
 *   super ('^' bitwiseAndExpression)+
 * ;
 * bitwiseAndExpression:
 *   equalityExpression ('&' equalityExpression)* |
 *   super ('&' equalityExpression)+
 * ;
 * bitwiseOperator:
 * '&' |
 * '^' |
 * '|'
 * ;
 * A bitwise expression is either an equality expression, or an invocation
 * of a bitwise operator on either super or an expression e1, with argument e2.
 * @description Checks that various expression fitted into this grammar
 * don't cause compile-time errors.
 * @author msyabro
 * @needsreview 'functionExpression' can be an operand by spec but is not allowed by implementation.
 * Issue 1189.
 */

topLevelFunction() {}

class S {
  const S();
  operator|(var val) {return this;}
  operator&(var val) {return this;}
  operator^(var val) {return this;}
}

class A extends S {
  method() {}
  var id;

  test() {
    //super
    super | this;
    try {super ^ 1 | 3; } catch(var e) {}
    try {super & new Object() ^ true | 1; } catch(var e) {}

    //literals
    try {1 & "1";} catch(var e) {}
    try {false | null;} catch(var e) {}
    try {[1, 2, 3, 4] ^ {"1": 2, "3": 4};} catch(var e) {}

    //function expressions
    try {(){} | ()=>{};} catch(var e) {}
    try {void f() {return null;} & void g(int x) => 7;} catch(var e) {}
    try {()=>({}) ^ void f() {};} catch(var e) {}

    //constants and instance creation
    try {const [] | [];} catch(var e) {}
    try {const {"a": 1} & {"a": 1};} catch(var e) {}
    try {const S() ^ new A();} catch(var e) {}

    //invocation
    try {id ^ topLevelFunction();} catch(var e) {}
    try {method() & topLevelFunction();} catch(var e) {}
    try {method() | id;} catch(var e) {}

    //assignment and equality
    try {(1[1] = 2) ^ (1 === 2);} catch(var e) {}
    try {(id !== id) | (true == false);} catch(var e) {}
    try {(3(2(1)) != 1(2(3))) & 0;} catch(var e) {}

    //logical and relational expressions
    try {(1 < 2) ^ (true > false ? 1 : id);} catch(var e) {}
    try {(true >= false) & ([] && {});} catch(var e) {}
    try {(null || this) | (id > 7);} catch(var e) {}

    //bitwise and shift expressions
    try {(1[1] ^ 2(2)) | (new S() & true);} catch(var e) {}
    try {(id | method()) & ({}() >> []());} catch(var e) {}
    try {(1 << 2) ^ (null >> null);} catch(var e) {}

    //additive expressions
    try { (1 + 2) ^ 2;} catch(var e ) {}
    try { (0 - 0) | (null + null);} catch(var e ) {}
    try { ([] + ({} === (){})) & 0;} catch(var e ) {}

    //multiplicative expressions
    try {(true * false) ^ (id.id / []());} catch(var e) {}
    try {(this[1] % null(1)) & ((topLevelFunction()[0]++) ~/ {}()[0]);} catch(var e) {}
    try {(0 ~/ 1) | (1 - -1);} catch(var e) {}

    //unary expressions
    try {(-this) & (~this);} catch(var e) {}
    try {(--id) | (id++);} catch(var e) {}
    try {(~-id) ^ (!!false);} catch(var e) {}

    //identifier
    try { id ^ id | id & id;} catch(var e) {}
  }
}

main() {
  A a = new A();
  a.test();
}