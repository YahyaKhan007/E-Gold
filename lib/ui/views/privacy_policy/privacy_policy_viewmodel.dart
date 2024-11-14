import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../app/app.locator.dart';

class PrivacyPolicyViewModel extends BaseViewModel {
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
    <title>Privacy Policy - EG24k</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 00px;
            background-color: #2C2C2C; /* Set background to transparent */
            color: white; /* Set text color to white */
        }
        h1, h2 {
            color: white; /* Ensure heading text is white */
        }
        h1 {
            font-size: 2em;
            text-align: center;
        }
        h2 {
            font-size: 1.5em;
            margin-top: 20px;
            margin-bottom: 10px;
        }
        p, li {
            color: white; /* Ensure paragraph and list text is white */
        }
        ul {
            margin-left: 00px;
        }
    </style>
</head>
<body>

    <h1>Privacy Policy</h1>
    <p><strong>Effective Date:</strong> [Insert Date]</p>

    <p>This Privacy Policy explains how EG24k ("we," "our," or "us") collects, uses, and protects the personal information of users ("you," "your") who access or use our mobile application (the "App"). By using the EG24k App, you consent to the practices described in this Privacy Policy.</p>

    <h2>1. Information We Collect</h2>
    <p>We collect personal information to provide and improve our services. The types of information we collect include:</p>
    <ul>
        <li><strong>Personal Identification Information:</strong> Full name, email address, phone number, and address.</li>
        <li><strong>Payment Information:</strong> Credit card details, cryptocurrency wallet details, and other payment-related information when you make purchases or transactions.</li>
        <li><strong>Usage Data:</strong> Information on how you interact with the App, including features used, time spent, and error reports.</li>
        <li><strong>Location Data:</strong> We may collect and process location information based on your device’s GPS settings, subject to your consent.</li>
    </ul>

    <h2>2. How We Use Your Information</h2>
    <p>We use the information we collect to:</p>
    <ul>
        <li>Provide, operate, and maintain the EG24k App.</li>
        <li>Facilitate transactions, including purchasing and selling gold.</li>
        <li>Offer 100% margin services and manage user accounts.</li>
        <li>Personalize user experiences and improve the App’s functionality.</li>
        <li>Communicate with users, including responding to inquiries and providing customer support.</li>
        <li>Send updates, marketing materials, and promotional information (subject to your consent).</li>
        <li>Analyze user activity for security, fraud prevention, and risk management.</li>
        <li>Comply with legal obligations and resolve disputes.</li>
    </ul>

    <h2>3. Data Sharing and Disclosure</h2>
    <p>We will not sell or rent your personal information to third parties. However, we may share information in the following circumstances:</p>
    <ul>
        <li><strong>With Service Providers:</strong> We may share data with trusted third-party service providers to process payments, store data, and perform other services on our behalf.</li>
        <li><strong>For Legal Purposes:</strong> We may disclose information if required by law, such as in response to a court order or legal request.</li>
        <li><strong>Business Transfers:</strong> In the event of a merger, acquisition, or sale of our business, your information may be transferred to the new owner.</li>
    </ul>

    <h2>4. Data Security</h2>
    <p>We take the security of your data seriously. We use industry-standard encryption protocols and security measures to protect your personal and financial information from unauthorized access, alteration, disclosure, or destruction. However, please note that no method of transmission over the internet is 100% secure, and we cannot guarantee the absolute security of your data.</p>

    <h2>5. User Control and Data Retention</h2>
    <p>You can manage your personal data by:</p>
    <ul>
        <li><strong>Accessing and Editing Information:</strong> You may access, update, or correct your personal information through your account settings in the App.</li>
        <li><strong>Deleting Your Account:</strong> You can request to delete your account and all associated personal data by emailing support@gold24k.com. Upon account deletion, we will retain only the data necessary to comply with legal obligations.</li>
        <li><strong>Location Data:</strong> You can manage location services permissions via your device settings.</li>
    </ul>
    <p>We will retain your information for as long as your account is active, or as needed to provide our services. We may also retain and use your information to comply with legal obligations, resolve disputes, and enforce our agreements.</p>

    <h2>6. Cookies and Tracking Technologies</h2>
    <p>The App may use cookies, beacons, or similar tracking technologies to enhance your experience, analyze app usage, and improve the services. You can control the use of cookies at the browser or device level; however, disabling cookies may limit certain features of the App.</p>

    <h2>7. Children’s Privacy</h2>
    <p>The EG24k App is not intended for children under the age of 10 years, and we do not knowingly collect personal information from children under this age. If we learn that we have collected such data, we will take steps to delete the information as soon as possible.</p>

    <h2>8. International Data Transfers</h2>
    <p>As EG24k is based in Dubai, your information may be transferred to, and processed in, a country other than your own. We take appropriate safeguards to ensure that your data is protected in compliance with this Privacy Policy.</p>

    <h2>9. Your Rights and Choices</h2>
    <p>Depending on your location, you may have the following rights regarding your personal information:</p>
    <ul>
        <li>The right to access and receive a copy of your personal data.</li>
        <li>The right to request the correction of inaccurate or incomplete information.</li>
        <li>The right to request the deletion of your data.</li>
        <li>The right to restrict or object to our processing of your data.</li>
        <li>The right to data portability.</li>
    </ul>
    <p>If you wish to exercise any of these rights, please contact us at support@gold24k.com.</p>

    <h2>10. Third-Party Links</h2>
    <p>The EG24k App may contain links to third-party websites or services. We are not responsible for the privacy practices or content of these external sites. We encourage you to review their privacy policies before providing them with your personal information.</p>

    <h2>11. Changes to This Privacy Policy</h2>
    <p>We may update this Privacy Policy from time to time to reflect changes in our practices or relevant laws. We will notify users of any significant changes via the App or through email. Your continued use of the App after such changes constitutes your acceptance of the revised Privacy Policy.</p>

    <h2>12. Contact Us</h2>
    <p>If you have any questions or concerns about this Privacy Policy or how we handle your data, please contact us at:</p>
    <p>VOG Bullion and Gold LLC<br>
       Dubai, United Arab Emirates<br>
       Email: support@gold24k.com</p>

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
