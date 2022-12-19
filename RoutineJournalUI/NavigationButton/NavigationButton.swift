import SwiftUI

public struct NavigationButton<Label, Content>: View
where Label: View, Content: View {
  public let action: () -> Void
  public let label: Label
  public let content: Content

  public var body: some View {
    Button(
      action: {
        action()
      },
      label: {
        HStack(spacing: .zero) {
          label
          Spacer(minLength: 8)
          content
          NavigationLink.EmptyView()
            .fixedSize(horizontal: true, vertical: true)
            .hidden()
        }
      }
    )
    .background {
      NavigationLink.EmptyView()
    }
  }

  public init(
    action: @escaping () -> Void,
    @ViewBuilder label: () -> Label,
    @ViewBuilder content: () -> Content
  ) {
    self.action = action
    self.label = label()
    self.content = content()
  }
}

struct NavigationButton_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var previewIndex = 0

    var body: some View {
      NavigationView {
        Form {
          if #available(iOS 16.0, *) {
            Picker(
              selection: $previewIndex,
              label: Text("Label")
            ) {
              Text("?")
            }
            .pickerStyle(.navigationLink)
          }
          NavigationButton(
            action: {},
            label: {
              Text("Label")
            },
            content: {
              Text("?")
            }
          )
        }
      }
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
