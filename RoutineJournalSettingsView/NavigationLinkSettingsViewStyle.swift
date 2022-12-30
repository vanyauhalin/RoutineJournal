import RoutineJournalFoundation
import RoutineJournalUI
import SwiftUI

public struct NavigationLinkSettingsViewStyle:
  Initializable,
  View,
  SettingsViewStyle
{
  public typealias Content = SettingsView

  public var content: Content

  public var body: some View {
    NavigationLink(
      destination: {
        content
          .navigationTitle(Content.Model.title)
      },
      label: {
        Text(Content.Model.title)
      }
    )
  }

  public init() {
    self.content = Content()
  }
}

struct NavigationLinkSettingsViewStyle_Previews: PreviewProvider {
  static var previews: some View {
    PreviewContext { _ in
      NavigationView {
        List {
          SettingsView()
            .style(.navigationLink)
        }
        .navigationBarTitleDisplayMode(.inline)
      }
    }
    .id(name)
    .modifier(.data)
  }
}
