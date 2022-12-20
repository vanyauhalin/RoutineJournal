extension ColorThemePickerDecoratorModel {
  public struct Size {
    public static let `default` = Size.medium
    public static let medium = Size(width: 11)

    public let width: Double

    public init(width: Double) {
      self.width = width
    }
  }
}
