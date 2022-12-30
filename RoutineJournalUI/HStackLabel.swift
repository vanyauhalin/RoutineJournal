import SwiftUI

public struct HStackLabel<Title, Icon>: View where Title: View, Icon: View {
  struct Style: LabelStyle {
    let spacing: Double

    func makeBody(configuration: Configuration) -> some View {
      HStack(spacing: spacing) {
        configuration.icon
        configuration.title
      }
    }
  }

  public let title: Title
  public let icon: Icon
  public let spacing: Double

  public var body: some View {
    Label(
      title: {
        title
      },
      icon: {
        icon
      }
    )
    .labelStyle(Style(spacing: spacing))
  }

  public init(
    @ViewBuilder title: () -> Title,
    @ViewBuilder icon: () -> Icon,
    spacing: Double = 16
  ) {
    self.title = title()
    self.icon = icon()
    self.spacing = spacing
  }
}

struct HStackLabel_Previews: PreviewProvider {
  static var previews: some View {
    HStackLabel(
      title: {
        Text("Title")
          .background {
            Color.red600
          }
      },
      icon: {
        Text("Icon")
          .background {
            Color.blue600
          }
      }
    )
    .background {
      Color.amber600
    }
  }
}
