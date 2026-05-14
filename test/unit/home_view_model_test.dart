import 'package:flutter_exemplo_temas/ui/home/view_models/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('counter inicia em zero', () {
    final vm = HomeViewModel();
    expect(vm.counter, 0);
    vm.dispose();
  });

  test('incrementCounter incrementa e notifica', () {
    final vm = HomeViewModel();
    var notifications = 0;
    vm.addListener(() => notifications++);

    vm.incrementCounter();

    expect(vm.counter, 1);
    expect(notifications, 1);

    vm.incrementCounter();
    expect(vm.counter, 2);
    expect(notifications, 2);

    vm.dispose();
  });
}
