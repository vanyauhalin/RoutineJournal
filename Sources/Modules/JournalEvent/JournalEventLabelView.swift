import SwiftUI

struct JournalEventLabelView<Title, Icon>: View where Title: View, Icon: View {
  @ViewBuilder let title: () -> Title
  @ViewBuilder let icon: () -> Icon

  var body: some View {
    Label {
      HStack(spacing: .zero) {
        title()
      }
    } icon: {
      icon()
    }
    .labelStyle(JournalEventLabelStyle())
  }
}

extension JournalEventLabelView {
  struct JournalEventLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
      HStack(spacing: 8) {
        configuration.icon
        configuration.title
      }
    }
  }
}
