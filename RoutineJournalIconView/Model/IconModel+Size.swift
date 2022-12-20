extension IconModel {
  public struct Size {
    public static let `default` = Size.medium
    public static let medium = Size(width: 28, height: 28, cornerRadius: 7)

    public let width: Double
    public let height: Double
    public let cornerRadius: Double

    public init(width: Double, height: Double, cornerRadius: Double) {
      self.width = width
      self.height = height
      self.cornerRadius = cornerRadius
    }
  }
}
