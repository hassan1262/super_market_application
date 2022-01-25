class user {
  String uid, userName, phoneNumber, email;
  user(this.uid, this.phoneNumber);
  factory user.fromJson(Map json) {
    return user(
      json['data']['picture'] ?? '',
      json['data']['name'],
      json['data']['price'],
      json['data']['category'],
      json['data']['pid'] ?? 'null',
    );
  }
}
