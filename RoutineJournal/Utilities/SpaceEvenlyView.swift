import SwiftUI

struct SpaceEvenlyView<Content>: View where Content: View {
  let spacing: CGFloat
  @ViewBuilder var content: () -> Content

  var body: some View {
    HStack {
      Spacer(minLength: spacing)
      content()
      Spacer(minLength: spacing)
    }
  }
}
