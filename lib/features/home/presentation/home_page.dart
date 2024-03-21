import 'package:flutter/material.dart';
import 'package:state_management/features/home/presentation/home_controller.dart';
import 'package:state_management/features/home/presentation/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get controller => widget.controller;

  void trackingSuccess() {
    debugPrint('SUCESSO');
  }

  void trackingFail() {
    debugPrint('FAIÔ');
  }

  void track() {
    controller.value.track<HomeSuccessState>(trackingSuccess);
    controller.value.track<HomeFailureState>(trackingFail);
  }

  @override
  void initState() {
    super.initState();

    controller.addListener(track);
  }

  @override
  void dispose() {
    controller.removeListener(track);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<HomeState>(
          valueListenable: controller,
          builder: (_, value, child) {
            return switch (value) {
              HomeEmptyState() => const SizedBox.shrink(),
              HomeLoadingState() => const SizedBox(
                  width: 96,
                  height: 96,
                  child: CircularProgressIndicator(strokeWidth: 16),
                ),
              HomeFailureState() => const _FailureWidget(),
              HomeSuccessState() => const _SuccessWidget(),
            };
          },
        ),
      ),
      bottomSheet: SizedBox(
        height: 80,
        width: double.maxFinite,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                key: const Key('empty'),
                onPressed: controller.empty,
                child: const Text('Empty')),
            ElevatedButton(
                key: const Key('loading'),
                onPressed: controller.loading,
                child: const Text('Loading')),
            ElevatedButton(
                key: const Key('failure'),
                onPressed: controller.failure,
                child: const Text('Failure')),
            ElevatedButton(
                key: const Key('success'),
                onPressed: controller.success,
                child: const Text('Success')),
          ],
        ),
      ),
    );
  }
}

class _FailureWidget extends StatelessWidget {
  const _FailureWidget();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.thumb_down_alt_outlined,
      color: Colors.red,
      size: 128,
    );
  }
}

class _SuccessWidget extends StatelessWidget {
  const _SuccessWidget();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.thumb_up_alt_outlined,
      color: Colors.blue,
      size: 128,
    );
  }
}
