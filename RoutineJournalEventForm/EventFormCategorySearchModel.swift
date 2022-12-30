import Combine
import RealmSwift
import RoutineJournalCore
import SwiftUI

public final class EventFormCategorySearchModel: ObservableObject {
  public let object: Binding<CategoryObject?>

  @Published public var objects: Results<CategoryObject>?
  public var objectsCancellable: AnyCancellable?

  @Published public var query = ""
  public var queryResults: Results<CategoryObject>? {
    objects?.where { object in
      object.title.contains(query)
    }
  }

  public init(object: Binding<CategoryObject?>) {
    self.object = object
    self.objects = try? DataProvider.realm().objects(CategoryObject.self)
    self.objectsCancellable = objects?.objectWillChange.sink { [weak self] _ in
      self?.objectWillChange.send()
    }
  }

  public func update(object: CategoryObject) {
    self.object.wrappedValue = object
  }
}
