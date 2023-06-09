import 'package:client/src/utils/error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tuple/tuple.dart';

class DataInvalidator {
  void Function() invalidate;
  DataInvalidator({required this.invalidate});
}

class FutureDataConsumer<T> extends HookWidget {
  final Future<T> Function() load;
  final Widget Function(T data, DataInvalidator invalidator) data;
  final Widget Function()? loading;
  final Widget Function(Object e, StackTrace s)? error;

  const FutureDataConsumer({
    super.key,
    required this.load,
    required this.data,
    this.loading,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    final invalidateState = useState(false);
    final dataState = useState<T?>(null);
    final loadingState = useState(false);
    final errorState = useState<Tuple2<Object, StackTrace>?>(null);
    final invalidator = DataInvalidator(invalidate: () {
      invalidateState.value = !invalidateState.value;
    });

    useEffect(() {
      Future(() async {
        try {
          loadingState.value = true;
          dataState.value = await load();
          errorState.value = null;
        } catch (e, s) {
          errorState.value = Tuple2(e, s);
        } finally {
          loadingState.value = false;
        }
      });
      return null;
    }, [invalidateState.value]);

    if (loadingState.value) {
      return loading != null ? loading!() : const CircularProgressIndicator();
    } else if (errorState.value != null) {
      final e = errorState.value!.item1;
      final s = errorState.value!.item2;
      return error != null ? error!(e, s) : ErrorText(error: e, stackTrace: s);
    } else if (dataState.value != null) {
      return data(dataState.value as T, invalidator);
    }
    return Container();
  }
}
