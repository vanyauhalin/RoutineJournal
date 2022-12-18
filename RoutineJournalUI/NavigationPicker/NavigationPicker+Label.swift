import SwiftUI

extension NavigationPicker {
  public struct Label: View {
    public let title: String
    public let selection: Binding<SelectionValue>
    public let options: [Option]

    public var selected: Option? {
      options.first { option in
        option.id == selection.wrappedValue
      }
    }

    public var body: some View {
      HStack(spacing: .zero) {
        Text(title)
        if let selected {
          Spacer()
          selected.content
            .foregroundColor(Color.systemGray)
            .environment(\.navigationPickerOptionPosition, .label)
        }
      }
    }

    public init(
      title: String,
      selection: Binding<SelectionValue>,
      options: [Option]
    ) {
      self.title = title
      self.selection = selection
      self.options = options
    }
  }
}
