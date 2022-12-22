public protocol SelectModifier {
  func onSelect(perform action: () -> Void) -> Self
}
