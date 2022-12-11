#if DEBUG
import SwiftUI

extension DataProvider {
  public struct ExamplesView<Content>: View where Content: View {
    @State private var render = false
    public let content: Content

    public var body: some View {
      ZStack {
        Text(render.description).hidden()
        content
        VStack {
          Spacer()
          HStack {
            Button("add") {
              try? DataProvider.addExamples()
              render.toggle()
            }
            Button("delete") {
              try? DataProvider.deleteExamples()
              render.toggle()
            }
          }
        }
      }
    }

    public init(_ identifier: String, @ViewBuilder content: () -> Content) {
      DataProvider.useMemory(identifier)
      self.content = content()
    }
  }
}
#endif
