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
            .foregroundColor(.label)
          Spacer(minLength: 8)
          content
            .foregroundColor(.systemGray)
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

extension NavigationButton where Label == Text {
  public init<Title>(
    _ title: Title,
    action: @escaping () -> Void,
    @ViewBuilder content: () -> Content
  ) where Title: StringProtocol {
    self.action = action
    self.label = Text(title)
    self.content = content()
  }
}

struct NavigationButton_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var counter = 0
    @State private var selection = 0

    var body: some View {
      PreviewBinding($counter) {
        NavigationView {
          Form {
            if #available(iOS 16.0, *) {
              Picker("Picker", selection: $selection) {
                Text("?")
              }
              .pickerStyle(.navigationLink)
            }
            NavigationButton(
              action: {
                counter += 1
              },
              label: {
                Text("Button With View Label")
              },
              content: {
                Text("?")
              }
            )
            NavigationButton(
              "Button With String Title",
              action: {
                counter -= 1
              },
              content: {
                Text("?")
              }
            )
          }
        }
      }
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
