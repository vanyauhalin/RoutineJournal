extension IconPickerOptionsModel {
  public struct Size {
    public static let `default` = Size.medium
    public static let medium = Size(minimum: 28, spacing: 8)

    public let minimum: Double
    public let spacing: Double

    public init(minimum: Double, spacing: Double) {
      self.minimum = minimum
      self.spacing = spacing
    }
  }
}
