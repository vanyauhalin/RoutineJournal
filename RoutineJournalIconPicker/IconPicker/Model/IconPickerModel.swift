import RoutineJournalCore
import SwiftUI

public final class IconPickerModel: ObservableObject {
  public typealias Model = IconPickerModel

  public static let title = "Icon"

  @Published
  public var showingExplorer = false

  public let iconSelection: Binding<IconObject>
  public let colorTheme: ColorTheme

  public var icon: IconObject {
    iconSelection.wrappedValue
  }

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

  public func showExplorer() {
    showingExplorer = true
  }
}
