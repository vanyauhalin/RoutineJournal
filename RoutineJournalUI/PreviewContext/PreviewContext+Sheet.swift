#if DEBUG
import SwiftUI

extension PreviewContext {
  public struct Sheet: View {
    public let showing: Binding<Bool>

    public var body: some View {
      HStack(spacing: .zero) {
        Text("sheet: ")
        Button("show") {
          showing.wrappedValue.toggle()
        }
      }
    }

    public init(showing: Binding<Bool>) {
      self.showing = showing
    }
  }

  public struct SheetContainer<Content>: View where Content: View {
    public let showing: Binding<Bool>
    public let content: Content

    public var body: some View {
      Color
        .clear
        .sheet(isPresented: showing) {
          content
        }
    }

    public init(showing: Binding<Bool>, @ViewBuilder content: () -> Content) {
      self.showing = showing
      self.content = content()
    }
  }
}
#endif
