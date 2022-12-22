import RoutineJournalCore
import SwiftUI

public final class IconPickerExplorerModel: ObservableObject {
  public typealias Model = IconPickerExplorerModel

  public static let title = IconPickerModel.title

  @Published
  public var query = String.default

  public let iconSelection: Binding<IconObject>
  public let colorTheme: ColorTheme

  public init(
    iconSelection: Binding<IconObject> = .constant(.default),
    colorTheme: ColorTheme = .default
  ) {
    self.iconSelection = iconSelection
    self.colorTheme = colorTheme
  }

  public func reinit(
    iconSelection: Binding<IconObject>? = nil,
    colorTheme: ColorTheme? = nil
  ) -> Model {
    Model(
      iconSelection: iconSelection ?? self.iconSelection,
      colorTheme: colorTheme ?? self.colorTheme
    )
  }
}
