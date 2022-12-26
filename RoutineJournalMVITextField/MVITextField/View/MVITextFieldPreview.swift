#if DEBUG
import RoutineJournalCore
import SwiftUI

public struct MVITextFieldPreview<Model>: View where Model: MVITextFieldModel {
  @State private var text = String.default

  public var body: some View {
    Form {
      MVITextField<Model>
        .render()
        .text($text)
    }
  }

  public init() {}
}
#endif
