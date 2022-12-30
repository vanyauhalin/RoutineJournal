import RoutineJournalCategoriesLink
import RoutineJournalUI
import SwiftUI

public struct SettingsView: View {
  public typealias Model = SettingsModel
  public typealias ViewStyle = SettingsViewStyle
  public typealias ToolbarContentStyle = SettingsToolbarContentStyle

  public var body: some View {
    List {
      CategoriesLink()
    }
  }

  public init() {}

  public func style<Style>(_ style: Style) -> some View
  where Style: ViewStyle, Style.Content == Self {
    style.body(content: self)
  }

  public func style<Style>(_ style: Style) -> some ToolbarContent
  where Style: ToolbarContentStyle, Style.Content == Self {
    style.body(content: self)
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewContext { _ in
      NavigationView {
        SettingsView()
      }
    }
    .id(name)
    .modifier(.data)
  }
}
