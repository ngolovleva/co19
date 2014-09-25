/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Table rowspan
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
    <style>
    td { font: 15px/1 Ahem }
    #div-table { display: table; border-spacing: 2px }
    #div-row, #span-row { display: table-row }
    #div-cell, #span-cell { display: table-cell }
    #div-table, #div-row, #span-row, #div-cell, #span-cell{ border: 1px solid black }
    </style>
''';

const String htmlEL2 = r'''
<h3>Test for chromium bug : <a href="https://code.google.com/p/chromium/issues/detail?id=254914">254914</a>. Height of fixed height cell is not proper when cell's row is under row spanning cell.</h3>
<h4>Rows in rowspan should get proportional height.</h4>
<h5>Test 1 - One rowSpan cell</h5>
<table border="1">
  <tbody>
    <tr>
      <td>row0 col0</td>
    </tr>
    <tr data-expected-height="19">
      <td rowspan="4">row1 col0 - rowspan=4</td>
      <td>row1 col1</td>
    </tr>
    <tr data-expected-height="19">
      <td>row2 col1</td>
    </tr>
    <tr data-expected-height="19">
      <td>row3 col1</td>
    </tr>
    <tr data-expected-height="19">
      <td>row4 col1</td>
    </tr>
    <tr data-expected-height="19">
      <td>row5 col0</td>
    </tr>
  </tbody>
</table>
<h5>Test 2 - One rowSpan cell and specified table width</h5>
<table border="1" width="607">
  <tbody>
    <tr data-expected-height="19">
      <td rowspan="5">row0 col0 - rowspan=5</td>
      <td>row0 col1</td>
    </tr>
    <tr data-expected-height="19">
      <td>row1 col1</td>
    </tr>
    <tr data-expected-height="19">
      <td>row2 col1</td>
    </tr>
    <tr data-expected-height="19">
      <td>row3 col1</td>
    </tr>
    <tr data-expected-height="19">
      <td>row4 col1</td>
    </tr>
  </tbody>
</table>
<h5>Test 3 - One rowSpan cell and specified rowSpan cell height</h5>
<table border="1">
  <tbody>
    <tr>
      <td>row0 col0</td>
    </tr>
    <tr data-expected-height="57">
      <td>row1 col0</td>
      <td rowspan="4" style="height:300px">row1 col1 - rowspan=4 height=300px</td>
    </tr>
    <tr data-expected-height="57">
      <td>row2 col0</td>
    </tr>
    <tr data-expected-height="74">
      <td>row3 col0</td>
    </tr>
    <tr data-expected-height="75">
      <td>row4 col0</td>
    </tr>
    <tr data-expected-height="19">
      <td>row5 col0</td>
      <td>row5 col1</td>
    </tr>
  </tbody>
</table>
<h5>Test 4 - One rowSpan cell and one cell have fixed height.</h5>
<table border="1">
  <tbody>
    <tr>
      <td>row0 col0</td>
    </tr>
    <tr data-expected-height="60">
      <td>row1 col0</td>
      <td rowspan="4" style="height:300px">row1 col1 - rowspan=4 height=300px</td>
    </tr>
    <tr data-expected-height="60">
      <td>row2 col0</td>
    </tr>
    <tr data-expected-height="44">
      <td style="height:40px">row3 col0 height=40px</td>
    </tr>
    <tr data-expected-height="85">
      <td>row4 col0</td>
    </tr>
    <tr data-expected-height="19">
      <td>row5 col0</td>
      <td>row5 col1</td>
    </tr>
  </tbody>
</table>
<h5>Test 5 - One rowSpan cell and one cell have percent height.</h5>
<table border="1">
  <tbody>
    <tr>
      <td>row0 col0</td>
    </tr>
    <tr data-expected-height="23">
      <td>row1 col0</td>
      <td rowspan="4" style="height:300px">row1 col1 - rowspan=4 height=300px</td>
    </tr>
    <tr data-expected-height="183">
      <td style="height:40%">row2 col0 height=40%</td>
    </tr>
    <tr data-expected-height="41">
      <td>row3 col0</td>
    </tr>
    <tr data-expected-height="47">
      <td>row4 col0</td>
    </tr>
    <tr data-expected-height="19">
      <td>row5 col0</td>
      <td>row5 col1</td>
    </tr>
  </tbody>
</table>
<h5>Test 6 - One rowSpan cell, one cell have percent height and another one cell have fixed height.</h5>
<table border="1">
  <tbody>
    <tr>
      <td>row0 col0</td>
    </tr>
    <tr data-expected-height="19">
      <td>row1 col0</td>
      <td rowspan="4" style="height:300px">row1 col1 - rowspan=4 height=300px</td>
    </tr>
    <tr data-expected-height="183">
      <td style="height:40%">row2 col0 height=40%</td>
    </tr>
    <tr data-expected-height="44">
      <td style="height:40px">row3 col0 height=40px</td>
    </tr>
    <tr data-expected-height="49">
      <td>row4 col0</td>
    </tr>
    <tr data-expected-height="19">
      <td>row5 col0</td>
      <td>row5 col1</td>
    </tr>
  </tbody>
</table>
<h5>Test 7 - One rowSpan cell and two cells have percent height but total percent is less than 100.</h5>
<table border="1">
  <tbody>
    <tr>
      <td>row0 col0</td>
    </tr>
    <tr data-expected-height="33">
      <td>row1 col0</td>
      <td rowspan="4" style="height:300px">row1 col1 - rowspan=4 height=300px</td>
    </tr>
    <tr data-expected-height="37">
      <td>row2 col0</td>
    </tr>
    <tr data-expected-height="131">
      <td style="height:30%">row3 col0 height=30%</td>
    </tr>
    <tr data-expected-height="142">
      <td style="height:40%">row4 col0 height=40%</td>
    </tr>
    <tr data-expected-height="19">
      <td>row5 col0</td>
      <td>row5 col1</td>
    </tr>
  </tbody>
</table>
<h5>Test 8 - One rowSpan cell and three cells have percent height but total percent is more than 100.</h5>
<table border="1">
  <tbody>
    <tr>
      <td>row0 col0</td>
    </tr>
    <tr data-expected-height="203">
      <td style="height:60%">row1 col0 height=60%</td>
      <td rowspan="4" style="height:300px">row1 col1 - rowspan=4 height=300px</td>
    </tr>
    <tr data-expected-height="34">
      <td style="height:40%">row2 col0 height=40%</td>
    </tr>
    <tr data-expected-height="19">
      <td>row3 col0</td>
    </tr>
    <tr data-expected-height="34">
      <td style="height:50%">row4 col0 height=50%</td>
    </tr>
    <tr data-expected-height="19">
      <td>row5 col0</td>
      <td>row5 col1</td>
    </tr>
  </tbody>
</table>
<h5>Test 9 - One rowSpan cell and specified cells height.</h5>
<table border="1">
  <tbody>
    <tr>
      <td>row0 col0</td>
    </tr>
    <tr data-expected-height="74">
      <td style="height:70px">row1 col0 height=70px</td>
      <td rowspan="4" style="height:500px">row1 col1 - rowspan=4 height=500px</td>
    </tr>
    <tr data-expected-height="74">
      <td style="height:70px">row2 col0 height=70px</td>
    </tr>
    <tr data-expected-height="59">
      <td style="height:30px">row3 col0 height=30px</td>
    </tr>
    <tr data-expected-height="182">
      <td style="height:100px">row4 col0 height=100px</td>
    </tr>
    <tr data-expected-height="54">
      <td style="height:50px">row5 col0 height=50px</td>
      <td>row5 col1</td>
    </tr>
  </tbody>
</table>
<h5>Test 10 - RowSpan and ColSpan. </h5>
<table border="1" width="607">
  <tbody>
    <tr data-expected-height="34">
      <td>row0 col0</td>
      <td rowspan="3" colspan="2">row0 col1 - rowspan=3 colspan=2</td>
      <td>row0 col2</td>
    </tr>
    <tr data-expected-height="34">
      <td>row1 col0</td>
    </tr>
    <tr data-expected-height="34">
      <td>row2 col0</td>
    </tr>
    <tr data-expected-height="19">
      <td colspan="3">row3 col0 - colspan=3</td>
    </tr>
    <tr data-expected-height="34">
      <td>row4 col0</td>
    </tr>
  </tbody>
</table>
<h5>Test 11 - Mix of baseline aligned and non-baseline aligned cells.</h5>
<table border="1" width="607">
  <tbody>
    <tr data-expected-height="104">
      <td style="height:100px">row0 col0</td>
      <td style="vertical-align:top">row0 col1 vertical-align=top</td>
      <td style="vertical-align:bottom">row0 col2 vertical-align=bottom</td>
    </tr>
    <tr data-expected-height="19">
      <td>row1 col0</td>
    </tr>
    <tr data-expected-height="77">
      <td rowspan="4" style="vertical-align:text-top; height:300px">row2 col0 - rowspan=4 vertical-align=text-top</td>
      <td style="vertical-align:sub">row2 col1 vertical-align=sub</td>
    </tr>
    <tr data-expected-height="77">
      <td style="vertical-align:middle">row3 col1 vertical-align=middle</td>
    </tr>
    <tr data-expected-height="69">
      <td style="vertical-align:super">row4 col1 vertical-align=super</td>
    </tr>
    <tr data-expected-height="91">
      <td style="vertical-align:text-bottom">row5 col1 vertical-align=text-bottom</td>
    </tr>
    <tr data-expected-height="19">
      <td>row6 col0</td>
    </tr>
  </tbody>
</table>
<h5>Test 12 - CSS Table.</h5>
<div id="div-table">
    <span id="span-row">
        <span id="span-cell">row0 col0</span>
        <div id="div-cell">row0 col1</div>
        <span id="span-cell">row0 col2</span>
    </span>
    <div id="div-row">
        <div id="div-cell">row1 col0</div>
        <span id="span-cell">row1 col1</span>
        <div id="div-cell">row1 col2</div>
    </div>
    <div id="div-row">
        <span id="span-cell">row2 col0</span>
    </div>
    <span id="span-row">
        <div id="div-cell">row3 col0</div>
    </span>
    <span id="span-row">
        <span id="span-cell">row4 col0</span>
        <span id="span-cell">row4 col1</span>
        <span id="span-cell">row4 col2</span>
    </span>
    <div id="div-row">
        <span id="span-cell">row5 col0</span>
        <div id="div-cell">row5 col1</div>
        <span id="span-cell">row5 col2</span>
    </div>
    <span id="span-row">
        <div id="div-cell">row6 col0</div>
        <span id="span-cell">row6 col1</span>
    </span>
    <div id="div-row">
        <div id="div-cell">row7 col0</div>
    </div>
    <span id="span-row">
        <span id="span-cell">row8 col0</span>
    </span>
    <div id="div-row">
        <div id="div-cell">row9 col0</div>
    </div>
    <div id="div-row">
        <div id="div-cell">row10 col0</div>
    </div>
</div>
<h5>Test 13 - Table Similar to CSS table with rowspan.</h5>
<table border="1px">
    <tr data-expected-height="21">
        <td rowspan=5 style="height:300px">row0 col0</td>
        <td>row0 col1</td>
        <td>row0 col2</td>
    </tr>
    <tr data-expected-height="87">
        <td rowspan=3 style="height:200px">row1 col1</td>
        <td rowspan=2 style="height:100px">row1 col2</td>
        <td>row1 col3</td>
    </tr>
    <tr data-expected-height="96">
        <td>row2 col3</td>
    </tr>
    <tr data-expected-height="40">
        <td>row3 col2</td>
    </tr>
    <tr data-expected-height="24">
        <td>row4 col1</td>
        <td>row4 col2</td>
        <td>row4 col3</td>
    </tr>
    <tr data-expected-height="19">
        <td>row5 col0</td>
        <td>row5 col1</td>
        <td>row5 col2</td>
    </tr>
    <tr data-expected-height="0">
        <td rowspan=5 style="height:200px">row6 col0</td>
        <td rowspan=5 style="height:100px">row6 col1</td>
    </tr>
    <tr data-expected-height="37">
        <td>row7 col1</td>
    </tr>
    <tr data-expected-height="38">
        <td>row8 col1</td>
    </tr>
    <tr data-expected-height="49">
        <td>row9 col1</td>
    </tr>
    <tr data-expected-height="49">
        <td>row10 col1</td>
    </tr>
</table>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen((e){checkLayout('tr');});
}
