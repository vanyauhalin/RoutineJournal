import SwiftUI

public struct NavigationPicker<SelectionValue, Content>: View
where SelectionValue: Hashable, Content: View {
  @State private var active = false

  public let title: String
  public let selection: Binding<SelectionValue>
  public let options: [Option]

  public var body: some View {
    NavigationLink(
      isActive: $active,
      destination: {
        List {
          ForEach(options) { option in
            Item(active: $active, selection: selection, option: option)
          }
        }
        .navigationTitle(title)
      },
      label: {
        Label(title: title, selection: selection, options: options)
      }
    )
  }

  public init(
    _ title: String,
    selection: Binding<SelectionValue>,
    options: () -> [Option]
  ) {
    self.title = title
    self.selection = selection
    self.options = options()
  }
}

struct NavigationPicker_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var selection = "First"

    var body: some View {
      NavigationView {
        List {
          NavigationPicker("Picker Title", selection: $selection) {
            ["First", "Second"].map { value in
              NavigationPicker.Option(id: value) {
                Text(value)
              }
            }
          }
        }
      }
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
