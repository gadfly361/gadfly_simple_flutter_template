import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/counter/bloc.dart';
import '../../../blocs/counter/state.dart';
import '../../../i18n/translations.g.dart';

class Home_Text_CurrentCount extends StatefulWidget {
  const Home_Text_CurrentCount({super.key});

  @override
  State<Home_Text_CurrentCount> createState() => _Home_Text_CurrentCountState();
}

class _Home_Text_CurrentCountState extends State<Home_Text_CurrentCount>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  int? countChange;
  late final Animation<double> countChangeTopAnimation;
  late final Animation<double> countChangeRightAnimation;
  late final Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    countChangeTopAnimation = Tween<double>(
      begin: -4,
      end: -16,
    ).animate(animationController);
    countChangeRightAnimation = Tween<double>(
      begin: -16,
      end: -24,
    ).animate(animationController);
    opacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(animationController);

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          countChange = null;
        });
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Color get countChangeColor {
    switch (countChange ?? 0) {
      case > 0:
        return Colors.green;
      case < 0:
        return Colors.red;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final count = context.watch<Counter_Bloc>().state.count;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            BlocBuilder<Counter_Bloc, Counter_State>(
              builder: (context, state) {
                return Text(
                  context.t.home.currentCount(count: count),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Positioned.fill(
                  top: countChangeTopAnimation.value,
                  right: countChangeRightAnimation.value,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Opacity(
                      opacity: opacityAnimation.value,
                      child: BlocListener<Counter_Bloc, Counter_State>(
                        listenWhen: (previous, current) {
                          return previous.countChangedBy !=
                              current.countChangedBy;
                        },
                        listener: (context, state) {
                          final countChangedBy = state.countChangedBy;
                          if (countChangedBy != null) {
                            setState(() {
                              countChange = countChangedBy;
                            });
                            animationController.forward(from: 0);
                          }
                        },
                        child: (countChange != null && countChange != 0)
                            ? Text(
                                (countChange != null && countChange! > 0)
                                    ? '+$countChange'
                                    : countChange.toString(),
                                style: TextStyle(color: countChangeColor),
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
