extension ColorThemePickerOptionModel {
  public struct Size {
    public static let `default` = Size.medium
    public static let medium = Size(destinationSpacing: 16, labelSpacing: 10)

    public let destinationSpacing: Double
    public let labelSpacing: Double

    public init(destinationSpacing: Double, labelSpacing: Double) {
      self.destinationSpacing = destinationSpacing
      self.labelSpacing = labelSpacing
    }
  }
}
