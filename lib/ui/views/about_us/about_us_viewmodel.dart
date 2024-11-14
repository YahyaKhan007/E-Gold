import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class AboutUsViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  void onBack() {
    navigationService.back();
  }

  final String htmlContent = """
eGold24k is a premier mobile application designed to provide you with easy access to the world of gold investment, brought to you by VOG Bullion and Gold LLC (VOG). Based in Dubai, UAE, and licensed by the Department of Economic Development – Dubai, VOG is a trusted name in the bullion industry, offering a seamless, secure, and transparent platform for buying and selling physical gold.

With over four decades of experience in the bullion industry across India and the UAE, the experts behind VOG have built a reputation for reliability, honesty, and precision. Our mission is to simplify the process of owning gold while ensuring complete transparency and accountability in every transaction. Whether you are an investor, jeweler, or gold manufacturer, eGold24k delivers a cost-effective and secure way to purchase physical gold in compliance with global standards.

At VOG, we are associated with the most reputable gold refineries in Dubai and maintain strict quality controls, ensuring the purity, accuracy, and fair pricing of all our products. Through our delivery center in the renowned Gold Souq of Deira, Dubai, we offer swift and secure delivery of physical gold, silver, and certified precious stones.

The eGold24k app is your gateway to peace of mind and financial security, backed by a market leader in the vibrant bullion industry of Dubai. Whether you're looking to invest in gold or explore new opportunities in precious metals, eGold24k offers you a trusted, dependable platform.

""";

  void onViewModelReady() async {
    setBusy(true);

    setBusy(false);
  }
}
