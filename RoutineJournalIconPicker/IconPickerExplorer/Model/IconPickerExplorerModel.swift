import RoutineJournalCore
import SwiftUI

public final class IconPickerExplorerModel: ObservableObject {
  public typealias Model = IconPickerExplorerModel

  @Published
  public var query = String.default

  public let navigationTitle: String
  public let iconSelection: Binding<IconObject>
  public let colorTheme: ColorTheme

  public init(
    navigationTitle: String = .default,
    iconSelection: Binding<IconObject> = .constant(.default),
    colorTheme: ColorTheme = .default
  ) {
    self.navigationTitle = navigationTitle
    self.iconSelection = iconSelection
    self.colorTheme = colorTheme
  }

  public func reinit(
    navigationTitle: String? = nil,
    iconSelection: Binding<IconObject>? = nil,
    colorTheme: ColorTheme? = nil
  ) -> Model {
    Model(
      navigationTitle: navigationTitle ?? self.navigationTitle,
      iconSelection: iconSelection ?? self.iconSelection,
      colorTheme: colorTheme ?? self.colorTheme
    )
  }
}
