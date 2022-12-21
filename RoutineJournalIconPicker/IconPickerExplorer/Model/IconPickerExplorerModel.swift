import RoutineJournalCore
import SwiftUI

public final class IconPickerExplorerModel: ObservableObject {
  public typealias Model = IconPickerExplorerModel

  @Published public var query = String.default

  public let navigationTitle: String
  public let selectionIcon: Binding<IconObject>
  public let colorTheme: ColorTheme

  public init(
    navigationTitle: String = .default,
    selectionIcon: Binding<IconObject> = .constant(.default),
    colorTheme: ColorTheme = .default
  ) {
    self.navigationTitle = navigationTitle
    self.selectionIcon = selectionIcon
    self.colorTheme = colorTheme
  }

  public func reinit(
    navigationTitle: String? = nil,
    selectionIcon: Binding<IconObject>? = nil,
    colorTheme: ColorTheme? = nil
  ) -> Model {
    Model(
      navigationTitle: navigationTitle ?? self.navigationTitle,
      selectionIcon: selectionIcon ?? self.selectionIcon,
      colorTheme: colorTheme ?? self.colorTheme
    )
  }
}
