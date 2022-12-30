#if DEBUG
import Foundation

extension PreviewContext {
  public final class Context: ObservableObject {
    @Published
    public var sheetShowing = false
    @Published
    public var counter = Int.zero

    public init() {}

    public func dismiss() {
      sheetShowing = false
    }

    public func increment() {
      counter += 1
    }

    public func decrement() {
      counter -= 1
    }
  }
}
#endif
