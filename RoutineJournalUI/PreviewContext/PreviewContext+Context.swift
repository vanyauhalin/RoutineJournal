#if DEBUG
import Foundation

extension PreviewContext {
  public final class Context: ObservableObject {
    @Published
    public var sheetShowing = false

    public init() {}

    public func dismiss() {
      sheetShowing = false
    }
  }
}
#endif
