import 'package:htca_app/constants/exports.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size,
  });
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.appLogo.svg(height: size, width: size),
          // 20.verticalSpace,
          // Assets.images.nrQuikScan.svg(height: nrSize, width: nrSize),
        ],
      ),
    );
  }
}
