import SwiftUI

public struct CloseLabelStyle: LabelStyle {
  public func makeBody(configuration: Configuration) -> some View {
    HStack(spacing: 10) {
      configuration.icon
      configuration.title
    }
  }
}

extension LabelStyle where Self == CloseLabelStyle {
  public static var close: CloseLabelStyle {
    CloseLabelStyle()
  }
}

struct CloseLabelStyle_Previews: PreviewProvider {
  static var previews: some View {
    List {
      Label(
        title: {
          Text("title")
            .background(.red)
        },
        icon: {
          Text("•")
            .background(.cyan)
        }
      )
      .background(.yellow)
      Label(
        title: {
          Text("title")
            .background(.red)
        },
        icon: {
          Text("•")
            .background(.cyan)
        }
      )
      .labelStyle(.close)
      .background(.yellow)
    }
  }
}
