import Combine
import RoutineJournalCore
import RoutineJournalFoundation

public final class CategoryFormModel: ObservableObject {
  public let navigationTitle = "New Category"

  @Published public var name: String
  @Published public var icon: IconObject
  @Published public var colorTheme: ColorTheme

  public init(
    name: String = .default,
    icon: IconObject = .default,
    colorTheme: ColorTheme = .default
  ) {
    self.name = name
    self.icon = icon
    self.colorTheme = colorTheme
  }
}
