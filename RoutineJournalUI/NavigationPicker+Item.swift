import SwiftUI

extension NavigationPicker {
  public struct Item: View {
    public let active: Binding<Bool>
    public let selection: Binding<SelectionValue>
    public let option: Option

    public var selected: Bool {
      option.id == selection.wrappedValue
    }

    public var body: some View {
      Button(
        action: {
          select()
          close()
        },
        label: {
          HStack(spacing: .zero) {
            option.content
              .foregroundColor(Color.label)
              .environment(\.navigationPickerOptionPosition, .destination)
            if selected {
              Spacer()
              Image(systemName: "checkmark")
                .font(.headline)
            }
          }
        }
      )
    }

    public init(
      active: Binding<Bool>,
      selection: Binding<SelectionValue>,
      option: Option
    ) {
      self.active = active
      self.selection = selection
      self.option = option
    }

    private func select() {
      selection.wrappedValue = option.id
    }

    private func close() {
      active.wrappedValue = false
    }
  }
}
