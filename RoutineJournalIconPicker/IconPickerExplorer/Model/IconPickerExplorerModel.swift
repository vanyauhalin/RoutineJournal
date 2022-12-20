import RoutineJournalCore
import SwiftUI

public final class IconPickerExplorerModel: ObservableObject {
  public typealias Model = IconPickerExplorerModel

  public let navigationTitle: String
  public let selectionIcon: Binding<IconObject>
  public let colorTheme: ColorTheme
  @Published public var query: String

  public init(
    navigationTitle: String = .default,
    selectionIcon: Binding<IconObject> = .constant(.default),
    colorTheme: ColorTheme = .default,
    query: String = .default
  ) {
    self.navigationTitle = navigationTitle
    self.selectionIcon = selectionIcon
    self.colorTheme = colorTheme
    self.query = query
  }

  public func reinit(
    navigationTitle: String? = nil,
    selectionIcon: Binding<IconObject>? = nil,
    colorTheme: ColorTheme? = nil,
    query: String? = nil
  ) -> Model {
    Model(
      navigationTitle: navigationTitle ?? self.navigationTitle,
      selectionIcon: selectionIcon ?? self.selectionIcon,
      colorTheme: colorTheme ?? self.colorTheme,
      query: query ?? self.query
    )
  }
}
