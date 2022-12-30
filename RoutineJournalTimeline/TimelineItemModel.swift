import Combine
import RoutineJournalCore

public final class TimelineItemModel: Identifiable, ObservableObject {
  public let id: ObjectIdentifier
  public let object: EventObject
  public let colorTheme: ColorTheme

  public init(from object: EventObject) {
    self.id = ObjectIdentifier(object._id)
    self.object = object
    self.colorTheme = object.category?.colorTheme ?? .neutral
  }
}
