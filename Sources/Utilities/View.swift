import SwiftUI

private struct ViewSizeReaderKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

extension View {
  func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geometry in
        Color
          .clear
          .hidden()
          .preference(key: ViewSizeReaderKey.self, value: geometry.size)
      }
    )
    .onPreferenceChange(ViewSizeReaderKey.self, perform: onChange)
  }
}
