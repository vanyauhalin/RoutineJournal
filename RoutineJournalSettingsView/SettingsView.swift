import RoutineJournalCategoriesLink
import SwiftUI

public struct SettingsView: View {
  public typealias Model = SettingsModel
  public typealias ViewStyle = SettingsViewStyle

  public var model: Model

  public var body: some View {
    List {
      CategoriesLink()
    }
    .navigationTitle(Model.title)
  }

  public init() {
    self.model = Model()
  }

  public func style<Style>(_ style: Style) -> some View
  where Style: ViewStyle, Style.Content == Self {
    style.body(content: self)
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      SettingsView()
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}
