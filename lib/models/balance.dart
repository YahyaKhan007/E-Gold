class BalanceModel {
  double balance;
  double margin;

  BalanceModel({required this.balance, required this.margin});

  // Serialization for Firebase
  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
      'margin': margin,
    };
  }

  // Deserialization from JSON
  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      balance: json['balance'],
      margin: json['margin'],
    );
  }
}
