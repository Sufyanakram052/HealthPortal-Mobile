enum POStatus {
  Accepted, // Completed,
  Canceled,
  Failed,
  InProgress,
  New,
  PartiallyAccepted,
  Recount,
  Rejected,
  Submitted,
  Completed,
}

enum ItemType {
  installation,
  inventory,
  po,
}

enum RentalSecondarySubmitType {
  primary,
  admin,
}

enum InstallationPartType {
  Major,
  Minor,
}

enum CaseFilters {
  All,
  Evaluation,
  Installation,
  Inspection,
  Repair,
  DeInstallation,
}

enum CaseStatus {
  Created,
  RFQ_Send,
  EvalScheduled,
  EvalReceived,
  EvalReview,
  EvalSent,
  PO_Received,
  Install_PO_Sent,
  InstallScheduled,
  InstallReceived,
  InstallSent,
  PaymentReceived,
  InspectionAssigned,
  InspectionScheduled,
  InspectionReceived,
  RepairAssigned,
  RepairScheduled,
  RepairReceived,
  DeInstallationStart,
  DeInstallPOSent,
  DeInstallationReceived,
  DeInstallationSubmitted,
  DeInstallationScheduled,
  DeInstallationSent,
}

enum CaseType {
  VA,
  IA,
}

enum CasePriority {
  Rush,
  Overdue,
  Standard,
}

enum CaseCategory {
  Sale,
  Rental,
}

enum TaskType {
  Assigned,
  MyTasks,
  DirectAssign,
  SubAssign,
  All,
}
