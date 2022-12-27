import SwiftUI

public struct NavigationButton<Label, Content>: View
where Label: View, Content: View {
  public let action: () -> Void
  public let label: Label
  public let content: Content
  public let withContent: Bool

  public var body: some View {
    Button(
      action: {
        action()
      },
      label: {
        HStack {
          label
            .foregroundColor(.label)
            .if(withContent) { view in
              HStack(spacing: .zero) {
                view
                Spacer()
                content
                  .foregroundColor(.systemGray)
              }
            }
            .if(!withContent) { view in
              HStack(spacing: .zero) {
                view
                Spacer(minLength: .zero)
              }
            }
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
    self.withContent = true
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
    self.withContent = true
  }
}

extension NavigationButton where Content == EmptyView {
  public init(
    action: @escaping () -> Void,
    @ViewBuilder label: () -> Label
  ) {
    self.action = action
    self.label = label()
    self.content = EmptyView()
    self.withContent = false
  }
}

struct NavigationButton_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State
    private var counter = 0
    @State
    private var selection = 0

    var body: some View {
      PreviewContext { _ in
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
                Text("View Label")
              },
              content: {
                Text("?")
              }
            )
            NavigationButton(
              "String Title",
              action: {
                counter -= 1
              },
              content: {
                Text("?")
              }
            )
            NavigationButton(
              action: {
                counter += 2
              },
              label: {
                Text("View Label Without Content")
              }
            )
          }
        }
      }
      .id(NavigationButton_Previews.name)
      .value(counter.description)
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
