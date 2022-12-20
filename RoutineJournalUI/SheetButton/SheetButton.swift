import SwiftUI

public struct SheetButton<Label, Content>: View
where Label: View, Content: View {
  @State private var showing = false

  public let label: Label
  public let content: Content

  public var body: some View {
    Button(
      action: {
        show()
      },
      label: {
        label
      }
    )
    .sheet(isPresented: $showing) {
      content
    }
  }

  public init(
    @ViewBuilder label: () -> Label,
    @ViewBuilder content: () -> Content
  ) {
    self.label = label()
    self.content = content()
  }

  private func show() {
    showing = true
  }
}

extension SheetButton where Label == Image {
  public init(
    systemName: String,
    @ViewBuilder content: () -> Content
  ) {
    self.label = Image(systemName: systemName)
    self.content = content()
  }
}

struct SheetButton_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      SheetButton(
        label: {
          Text("Button With View Label")
        },
        content: {
          Text("Button With View Label Content")
        }
      )
      SheetButton(systemName: "plus") {
        Text("Button With Image Label Content")
      }
    }
  }
}
