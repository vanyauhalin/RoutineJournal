import SwiftUI

public struct LabelStacked<Title, Icon>: View where Title: View, Icon: View {
  struct LabelStackedStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
      HStack(spacing: 16) {
        configuration.icon
        configuration.title
      }
    }
  }

  @ViewBuilder public let title: () -> Title
  @ViewBuilder public let icon: () -> Icon

  public var body: some View {
    Label(
      title: {
        title()
      },
      icon: {
        icon()
      }
    )
    .labelStyle(LabelStackedStyle())
  }

  public init(
    @ViewBuilder title: @escaping () -> Title,
    @ViewBuilder icon: @escaping () -> Icon
  ) {
    self.title = title
    self.icon = icon
  }
}

struct LabelStacked_Previews: PreviewProvider {
  static var previews: some View {
    LabelStacked(
      title: {
        Text("Title")
      },
      icon: {
        IconView(
          icon: Icon(name: .airplane, type: .system),
          foregroundColor: .white,
          backgroundColor: .indigo
        )
      }
    )
  }
}
