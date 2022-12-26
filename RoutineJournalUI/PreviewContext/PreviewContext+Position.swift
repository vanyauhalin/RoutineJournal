#if DEBUG
extension PreviewContext {
  public typealias Position = (VerticalPosition, HorizontalPosition)

  public enum VerticalPosition {
    case top
    case bottom
  }
  public enum HorizontalPosition {
    case leading
    case trailing
  }
}
#endif
