import SwiftUI

public extension NavigationLink
where Label == EmptyView, Destination == EmptyView {
  // Mimics the View structure.
  // swiftlint:disable:next identifier_name
  static func EmptyView() -> NavigationLink {
    return NavigationLink<Label, Destination>(
      destination: {
        SwiftUI.EmptyView()
      },
      label: {
        SwiftUI.EmptyView()
      }
    )
  }
}
