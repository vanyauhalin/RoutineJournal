import SwiftUI

struct TimelineItemContainerView<Content>: View where Content: View {
  let backgroundColor: Color
  @ViewBuilder let content: () -> Content

  var body: some View {
    content()
      .padding([.horizontal])
      .padding([.vertical], 8)
      .background {
        Rectangle()
          .foregroundColor(backgroundColor)
          .cornerRadius(10)
      }
  }
}
