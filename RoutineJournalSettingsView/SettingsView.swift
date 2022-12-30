import SwiftUI

public struct SettingsView: View {
  public typealias Model = SettingsModel

  public var model: Model

  public var body: some View {
    List {
      SettingsCategories()
    }
    .navigationTitle(Model.title)
  }

  public init() {
    self.model = Model()
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
