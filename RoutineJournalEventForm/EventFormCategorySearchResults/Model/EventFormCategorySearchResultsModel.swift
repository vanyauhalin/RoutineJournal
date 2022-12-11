import RealmSwift
import RoutineJournalCore

public final class EventFormCategorySearchResultsModel {
  public let objects: Results<CategoryObject>

  public init(objects: Results<CategoryObject>) {
    self.objects = objects
  }
}
