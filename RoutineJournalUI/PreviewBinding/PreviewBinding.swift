#if DEBUG
import SwiftUI

public struct PreviewBinding<Value, Content>: View
where Value: CustomStringConvertible, Content: View {
  public var value: Binding<Value?>
  public var content: Content

  public var body: some View {
    ZStack {
      content
      HStack {
        VStack(alignment: .leading) {
          Spacer()
          Text(value.wrappedValue?.description ?? "")
            .opacity(0.3)
        }
        Spacer()
      }
      .edgesIgnoringSafeArea(.all)
    }
  }

  public init(
    _ value: Binding<Value?>,
    @ViewBuilder content: () -> Content
  ) {
    self.value = value
    self.content = content()
  }

  public init(
    _ value: Binding<Value>,
    @ViewBuilder content: () -> Content
  ) {
    self.value = Binding.constant(Optional(value.wrappedValue))
    self.content = content()
  }
}

struct PreviewBinding_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var counter = 1

    var body: some View {
      PreviewBinding($counter) {
        VStack {
          Text("count: \(counter.description)")
          Button("increment") {
            counter += 1
          }
        }
      }
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
#endif
