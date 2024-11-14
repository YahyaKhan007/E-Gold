import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../app/app.locator.dart';

class TermsConditionViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  late WebViewController controller;

  void onBack() {
    navigationService.back();
  }

  final String htmlContent = """
  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>EG24k Terms and Conditions</title>
  <style>
    body {
      background-color: #2C2C2C;
      color: white;
      font-family: Arial, sans-serif;
      margin: 20px;
      padding: 20px;
    }

    h1, h2, h3 {
      color: white;
    }

    p {
      line-height: 1.6;
    }

    .terms {
      background-color: #2C2C2C;
      color: white;
    }

    .section {
      margin-bottom: 20px;
    }

    .contact-info {
      margin-top: 20px;
    }

    .risk-disclaimer {
      font-weight: bold;
    }
  </style>
</head>
<body>

  <h1>EG24k Terms and Conditions</h1>
  <p>Effective Date: [Insert Date]</p>
  
  <div class="section">
    <h2>1. General Overview</h2>
    <p>EG24k offers users the ability to purchase 24-carat gold online and in-store using various payment methods, including credit card, cash, and cryptocurrencies. EG24k provides an optional margin facility that allows users to enhance their investment potential by offering a 100% margin on gold purchases. Users can profit from this margin but are also exposed to an increased risk of loss, which may result in liquidation if their account value drops below a certain threshold.</p>
  </div>

  <div class="section">
    <h2>2. Eligibility</h2>
    <p>You must be at least 10 years of age and fully capable of entering into legally binding contracts to use the EG24k App. By using the App, you confirm that you meet this requirement.</p>
  </div>

  <div class="section">
    <h2>3. Registration and Account Creation</h2>
    <p>To use the App, you are required to create an account. When registering, you agree to:</p>
    <ul>
      <li>Provide accurate, current, and complete information.</li>
      <li>Maintain the confidentiality of your account credentials.</li>
      <li>Be responsible for any activities or transactions that occur under your account.</li>
    </ul>
    <p>EG24k reserves the right to terminate or suspend accounts that are suspected of fraudulent activity or that violate these Terms.</p>
  </div>

  <div class="section">
    <h2>4. Payment Methods</h2>
    <p>EG24k accepts multiple payment methods, including but not limited to:</p>
    <ul>
      <li>Credit cards</li>
      <li>Cash</li>
      <li>Cryptocurrencies</li>
    </ul>
    <p>All payments must be made in accordance with applicable laws. EG24k is not responsible for any fees, conversion charges, or delays that may arise from the use of third-party payment processors.</p>
  </div>

  <div class="section">
    <h2>5. Margin Trading</h2>
    <h3>5.1 Overview of Margin Trading</h3>
    <p>EG24k provides users with a 100% margin facility, which allows them to effectively double their potential profit (and loss) on each gold purchase. For example, if you purchase 10 grams of gold, you are granted an additional 10 grams in margin. This margin is optional, and it is entirely your decision whether or not to use it.</p>

    <h3>5.2 Client Responsibility for Profit and Loss</h3>
    <p>By using margin trading, you acknowledge that while it can amplify potential profits, it also increases the risk of loss. EG24k is not responsible for any losses incurred as a result of your trading decisions. However, EG24k does take responsibility for administering the margin facility and ensuring that all transactions are accurately reflected in your account. You are advised to fully understand the risks associated with margin trading before utilizing this feature.</p>

    <h3>5.3 Liquidation Policy</h3>
    <p>If the market moves against you and the value of your gold holdings declines by 50% or more, EG24k reserves the right to liquidate your account to protect against further losses. In such a case, you may lose the entire margin amount, and your account will be closed out.</p>

    <h3>5.4 Margin Risk Disclosure</h3>
    <p>Using margin to trade gold involves a significant degree of risk. You acknowledge and accept the following risks associated with margin trading:</p>
    <ul>
      <li>Increased Loss Potential: While the margin facility can amplify profits, it can also magnify losses. You could lose more than your initial investment.</li>
      <li>Liquidation Risk: If the value of your account falls by 50% or more, EG24k reserves the right to liquidate your holdings without prior notice to you.</li>
      <li>Market Volatility: Gold prices can fluctuate dramatically due to various factors, including but not limited to market demand, geopolitical events, and changes in economic policies. These fluctuations may adversely affect your investment.</li>
      <li>Higher Risk with 100% Margin: When trading with 100% margin, you are exposed to a higher risk of liquidation. Even minor movements in the market can result in significant losses, as your leveraged position will magnify both profit and loss.</li>
    </ul>
  </div>

  <div class="section">
    <h2>6. Use of the App</h2>
    <p>You agree to use the App only for lawful purposes and in accordance with these Terms. You are prohibited from using the App:</p>
    <ul>
      <li>In any way that violates any applicable local, national, or international law or regulation.</li>
      <li>For fraudulent purposes or to engage in any activity that could result in financial harm to EG24k or other users.</li>
      <li>To distribute viruses, malware, or any other malicious code.</li>
    </ul>
    <p>EG24k reserves the right to terminate your account and take legal action if you are found to be engaging in prohibited activities.</p>
  </div>

  <div class="section">
    <h2>7. Data Privacy</h2>
    <p>Your privacy is important to us. EG24k collects and processes personal data in accordance with its Privacy Policy, which can be found <a href="#">here</a>. By using the App, you consent to the collection and use of your personal information as outlined in the Privacy Policy.</p>
  </div>

  <div class="section">
    <h2>8. Limitation of Liability</h2>
    <p>To the maximum extent permitted by law, EG24k, its officers, directors, employees, and agents shall not be liable for any:</p>
    <ul>
      <li>Direct, indirect, incidental, special, consequential, or punitive damages arising out of your use of or inability to use the App.</li>
      <li>Any loss of profits, revenue, or data incurred by the use of the margin trading feature.</li>
    </ul>
    <p>EG24k’s liability is limited to the total amount of funds available in your account at the time of the dispute, subject to applicable laws.</p>
  </div>

  <div class="section">
    <h2>9. Termination</h2>
    <p>EG24k reserves the right to terminate or suspend your account and access to the App, at our sole discretion, for any reason, including but not limited to:</p>
    <ul>
      <li>Breach of these Terms.</li>
      <li>Engaging in fraudulent activity.</li>
      <li>Inactivity for an extended period.</li>
    </ul>
    <p>Termination does not relieve you of any obligations incurred prior to termination, including any outstanding fees or margin liabilities.</p>
  </div>

  <div class="section">
    <h2>10. Changes to the Terms</h2>
    <p>EG24k reserves the right to modify these Terms at any time. Any changes will be posted within the App, and continued use of the App after changes have been posted will constitute your acceptance of the revised Terms.</p>
  </div>

  <div class="section">
    <h2>11. Governing Law</h2>
    <p>These Terms shall be governed by and construed in accordance with the laws of the United Arab Emirates (UAE), without regard to its conflict of laws principles. Any legal disputes will be resolved exclusively in the courts of Dubai, UAE.</p>
  </div>

  <div class="section contact-info">
    <h2>12. Contact Us</h2>
    <p>For any questions regarding these Terms, please contact us at:</p>
    <p>VOG Bullion and Gold LLC<br>Dubai, United Arab Emirates</p>
    <p>Email: [Insert Contact Email]</p>
    <p>Phone: [Insert Contact Phone]</p>
  </div>

  <div class="section risk-disclaimer">
    <h3>Important Risk Disclosure</h3>
    <p>Trading gold on margin can lead to significant profits, but also carries a high level of risk. You may lose more than your initial investment. Please ensure that you fully understand the risks involved and consider seeking independent advice before trading on margin.</p>
  </div>

</body>
</html>

  """;

  void onViewModelReady() async {
    setBusy(true);
    controller = WebViewController()..loadHtmlString(htmlContent);
    print("Privacy plicy model ready");
    setBusy(false);
  }
}
