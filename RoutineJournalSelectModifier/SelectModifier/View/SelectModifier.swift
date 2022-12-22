public protocol SelectModifier {
  func onSelect(perform action: @escaping () -> Void) -> Self
}
