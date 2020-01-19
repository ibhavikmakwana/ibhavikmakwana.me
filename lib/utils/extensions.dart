import 'package:ibhavikmakwana/ui/home.dart';

extension sdpExtenstion on num {
  double get sdp => (this * 0.75 + devicePixelRatio).toDouble();
}