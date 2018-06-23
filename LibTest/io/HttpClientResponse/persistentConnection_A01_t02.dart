/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool persistentConnection
 * Gets the persistent connection state returned by the server.
 *
 * If the persistent connection state needs to be set, it must be set before the
 * body is written to. Setting the reason phrase after writing to the body will
 * throw a StateError.
 * @description Checks that this getter returns the persistent connection state
 * returned by the server
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.LOOPBACK_IP_V4.address;

test(String method) async {
  asyncStart();
  String helloWorld = "Hello test world!";
  HttpServer server = await HttpServer.bind(localhost, 0);
  server.listen((HttpRequest request) {
    request.response.persistentConnection = false;
    request.response.write(helloWorld);
    request.response.close();
    server.close();
  });

  HttpClient client = new HttpClient();
  client.open(method, localhost, server.port, "")
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    Expect.isFalse(response.persistentConnection);
    response.transform(UTF8.decoder).listen((content) {});
    asyncEnd();
  });
}

main() {
  test("get");
  test("head");
  test("delete");
  test("put");
  test("post");
  test("patch");
}