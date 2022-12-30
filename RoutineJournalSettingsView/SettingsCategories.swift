import SwiftUI

public struct SettingsCategories: View {
  public typealias Model = SettingsCategoriesModel

  public var model: Model

  public var body: some View {
    NavigationLink(Model.title) {
      EmptyView()
    }
  }

  public init() {
    self.model = Model()
  }
}

struct SettingsCategories_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      List {
        SettingsCategories()
      }
    }
  }
}
