/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL2 = r'''
<h3>Test for chromium bug : <a href="https://code.google.com/p/chromium/issues/detail?id=29502">29502</a>. border-spacing is doubled between table-row-groups.</h3>
<h4>Border-spacing was adding twice, One for bottom of first section and another for top of second section. But bottom of first section and top of second section border spacing should be common.</h4>
Distance between all rows in the table should be same.
<br/><br/>

<div id="divId">
<table border="5" style="border-spacing:10px">
    <thead>
        <tr>
            <th id = "td0Id"> row0 head0 </th>
            <th> row0 head1 </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td id = "td1Id"> row0 col0 </td>
            <td> row0 col11 </td>
        </tr>
        <tr>
            <td id = "td2Id"> row1 col0 </td>
            <td> row1 col11 </td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td id = "td3Id"> row0 col0 </td>
            <td> row0 col11 </td>
        </tr>
        <tr>
            <td id = "td4Id"> row1 col0 </td>
            <td> row1 col11 </td>
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <td id = "td5Id"> row0 foot0 </td>
            <td> row0 foot1 </td>
        </tr>
    </tfoot>
</table>
</div>
<br/>
<div id="console"></div>
''';

void testBorderSpacing(index) {
    var afterRow = document.getElementById('td${index}Id');
    var beforeRow = document.getElementById('td${index - 1}Id');
    var borderSpacing = afterRow.offsetTop - beforeRow.offsetTop - beforeRow.offsetHeight;
    shouldBe(borderSpacing, 10, index.toString());
}

void main() {
    document.body.appendHtml(htmlEL2);

    for (var i = 1; i < 6; i++) {
        document.getElementById('console').append(document.createElement('br'));
        testBorderSpacing(i);
    }
    
    checkTestFailures();
}
