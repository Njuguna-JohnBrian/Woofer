import 'package:woofer/animations/animations_utils/view.dart';

import '../animations.dart';

class WooferAnimation extends LottieAnimationView {
  const WooferAnimation({
    super.key,
  }) : super(
          animation: LottieAnimation.woofer,
        );
}
