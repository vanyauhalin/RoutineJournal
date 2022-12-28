import Combine
import RoutineJournalCore
import RoutineJournalFoundation

public final class CategoryFormModel: ObservableObject {
  public static let title = "New Category"

  @Published
  public var name: String
  @Published
  public var icon: IconObject
  @Published
  public var colorTheme: ColorTheme

  public init() {
    self.name = .default
    self.icon = .default
    self.colorTheme = .default
  }
}
