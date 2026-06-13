class NotificationPreferences {
  final bool receiveNews;
  final bool receiveUpdates;
  final bool receiveOffers;

  NotificationPreferences({
    required this.receiveNews,
    required this.receiveUpdates,
    required this.receiveOffers,
  });

  NotificationPreferences copyWith({
    bool? receiveNews,
    bool? receiveUpdates,
    bool? receiveOffers,
  }) {
    return NotificationPreferences(
      receiveNews: receiveNews ?? this.receiveNews,
      receiveUpdates: receiveUpdates ?? this.receiveUpdates,
      receiveOffers: receiveOffers ?? this.receiveOffers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'receiveNews': receiveNews,
      'receiveUpdates': receiveUpdates,
      'receiveOffers': receiveOffers,
    };
  }

  factory NotificationPreferences.fromMap(Map<String, dynamic> map) {
    return NotificationPreferences(
      receiveNews: map['receiveNews'] ?? false,
      receiveUpdates: map['receiveUpdates'] ?? false,
      receiveOffers: map['receiveOffers'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationPreferences.fromJson(String source) =>
      NotificationPreferences.fromMap(json.decode(source));

  @override
  String toString() =>
      'NotificationPreferences(receiveNews: $receiveNews, receiveUpdates: $receiveUpdates, receiveOffers: $receiveOffers)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificationPreferences &&
        other.receiveNews == receiveNews &&
        other.receiveUpdates == receiveUpdates &&
        other.receiveOffers == receiveOffers;
  }

  @override
  int get hashCode =>
      receiveNews.hashCode ^ receiveUpdates.hashCode ^ receiveOffers.hashCode;
}