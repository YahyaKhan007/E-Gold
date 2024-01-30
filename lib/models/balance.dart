class BalanceModel {
  double balance;

  BalanceModel({required this.balance});

  // Serialization for Firebase
  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
    };
  }

  // Deserialization from JSON
  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      balance: json['balance'],
    );
  }
}
