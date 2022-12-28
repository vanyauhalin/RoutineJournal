import RoutineJournalFoundation
import SwiftUI

public protocol MVITextFieldModel: AnyObject {
  var title: String { get }
  var text: Binding<String> { get }

  init()
  init(text: Binding<String>)

  func reinit(text: Binding<String>?) -> Self
}

extension MVITextFieldModel {
  public init() {
    self.init(text: .constant(.default))
  }

  public func reinit(text: Binding<String>? = nil) -> Self {
    Self(text: text ?? self.text)
  }
}
