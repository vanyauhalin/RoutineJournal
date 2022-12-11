import SwiftUI

extension NavigationLink where Label == EmptyView, Destination == EmptyView {
  // Mimics a `View` structure.
  // swiftlint:disable:next identifier_name
  public static func EmptyView() -> NavigationLink {
    NavigationLink<Label, Destination>(
      destination: {
        SwiftUI.EmptyView()
      },
      label: {
        SwiftUI.EmptyView()
      }
    )
  }
}
