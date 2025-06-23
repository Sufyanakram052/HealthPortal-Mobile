class Insurance {
  final String id;
   String name;
   String status;
   String memberId;
  final String groupNumber;
  final String coveragePeriod;
  final bool isActive;

  Insurance({
    required this.id,
    required this.status,
    required this.name,
    required this.memberId,
    required this.groupNumber,
    required this.coveragePeriod,
    this.isActive = true,
  });
}