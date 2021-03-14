
























import 'dart:async';

import 'package:qr/src/models/scan_model.dart';

class Validaciones {
  final validarGeo =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
          handleData: (scans, sink) {
    final geoScans = scans.where((s) => s.tipo == 'geo').toList();
    sink.add(geoScans);
  });

  final validarHttp =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
          handleData: (scans, sink) {
    final geoScans = scans.where((s) => s.tipo == 'http').toList();
    sink.add(geoScans);
  });
}

/*
Creates a [StreamTransformer] that delegates events to the given functions.

Example use of a duplicating transformer:

stringStream.transform(new StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink) {
      sink.add(value);
      sink.add(value);  // Duplicate the incoming events.
    }));
Transformers that are constructed this way cannot use captured state if they are used in streams that can be listened to multiple times.

StreamController<String> controller;
controller = new StreamController.broadcast(onListen: () {
  scheduleMicrotask(() {
    controller.addError("Bad");
    controller.addError("Worse");
    controller.addError("Worst");
  });
});
var sharedState = 0;
var transformedStream = controller.stream.transform(
    new StreamTransformer<String>.fromHandlers(
        handleError: (error, stackTrace, sink) {
  sharedState++; // Increment shared error-counter.
  sink.add("Error $sharedState: $error");
}));

transformedStream.listen(print);
transformedStream.listen(print); // Listen twice.
// Listening twice to the same stream makes the transformer share the same
// state. Instead of having "Error 1: Bad", "Error 2: Worse",
// "Error 3: Worst" as output (each twice for the separate subscriptions),
// this program emits:
// Error 1: Bad
// Error 2: Bad
// Error 3: Worse
// Error 4: Worse
// Error 5: Worst
// Error 6: Worst

*/
