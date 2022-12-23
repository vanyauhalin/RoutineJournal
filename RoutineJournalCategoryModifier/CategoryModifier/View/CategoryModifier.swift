import RoutineJournalCore

public protocol CategoryModifier {
  func category(_ category: CategoryObject?) -> Self
}
