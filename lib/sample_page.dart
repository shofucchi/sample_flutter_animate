import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_flutter_animate/cached_list_item.dart';
import 'package:sample_flutter_animate/favorite_button.dart';

class SamplePage extends HookWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          controller: controller,
          itemCount: 52,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return ColoredBox(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 64),
                    child: Center(
                      child: FlutterLogo(size: 100),
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(delay: 0.1.seconds, duration: 0.5.seconds)
                    .slide(begin: const Offset(0, 0.2));
              case 1:
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    'Flutter',
                    style: TextStyle(fontSize: 36),
                  ),
                )
                    .animate()
                    .fadeIn(delay: 0.2.seconds, duration: 0.5.seconds)
                    .slide(begin: const Offset(0, 0.2));
              default:
                final listTileDelay = 0.3.seconds + 0.01.seconds * (index - 1);
                return const CachedListItem(
                  leading: CircleAvatar(child: FlutterLogo()),
                  title: Text('SubTitle', style: TextStyle(fontSize: 24)),
                  subtitle: Text('Description', style: TextStyle(fontSize: 18)),
                  trailing: FavoriteButton(),
                )
                    .animate()
                    .fadeIn(delay: listTileDelay, duration: 0.5.seconds)
                    .slide(begin: const Offset(0, 0.2));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.animateTo(
          controller.position.minScrollExtent,
          duration: 500.milliseconds,
          curve: Curves.easeInOut,
        ),
        child: const Icon(Icons.arrow_upward),
      )
          .animate(
            autoPlay: false,
            adapter: ScrollAdapter(controller, end: 150),
          )
          .scale()
          .animate(
            autoPlay: false,
            adapter: ScrollAdapter(controller, begin: 3300),
          )
          .fadeOut(),
    );
  }
}
