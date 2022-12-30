import RoutineJournalFoundation
import RoutineJournalUI
import SwiftUI

public struct ToolbarItemSettingsToolbarContentStyle:
  Initializable,
  ToolbarContent,
  SettingsToolbarContentStyle
{
  public typealias Content = SettingsView

  public var content: Content

  public var body: some ToolbarContent {
    ToolbarItem(placement: .bottomBar) {
      content
        .style(.navigationLink)
    }
  }

  public init() {
    self.content = Content()
  }
}

struct ToolbarItemSettingsToolbarContentStyle_Previews: PreviewProvider {
  static var previews: some View {
    PreviewContext { _ in
      NavigationView {
        Text("content")
          .navigationBarTitleDisplayMode(.inline)
          .toolbar {
            SettingsView()
              .style(.toolbarItem)
          }
      }
    }
    .id(name)
    .modifier(.data)
  }
}
