#if DEBUG
import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public struct MVITextFieldPreview<Model>: View where Model: MVITextFieldModel {
  @State private var text = String.default

  public var body: some View {
    PreviewBinding($text) {
      Form {
        MVITextField<Model>
          .render()
          .text($text)
      }
    }
  }

  public init() {}
}
#endif
