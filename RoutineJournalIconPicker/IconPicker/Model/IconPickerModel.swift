import RoutineJournalCore
import SwiftUI

public final class IconPickerModel: ObservableObject {
  public typealias Model = IconPickerModel

  public let title = "Icon"
  @Published
  public var showingExplorer = false

  public let selectionIcon: Binding<IconObject>
  public let colorTheme: ColorTheme

  public init(
    selectionIcon: Binding<IconObject> = .constant(.default),
    colorTheme: ColorTheme = .default
  ) {
    self.selectionIcon = selectionIcon
    self.colorTheme = colorTheme
  }

  public func reinit(
    selectionIcon: Binding<IconObject>? = nil,
    colorTheme: ColorTheme? = nil
  ) -> Model {
    Model(
      selectionIcon: selectionIcon ?? self.selectionIcon,
      colorTheme: colorTheme ?? self.colorTheme
    )
  }

  public func showExplorer() {
    showingExplorer = true
  }
}
