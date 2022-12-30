#if DEBUG
extension CategoryObject {
  public static var mock1: CategoryObject {
    CategoryObject(title: "Flights", icon: .mock1, colorTheme: .indigo)
  }
  public static var mock2: CategoryObject {
    CategoryObject(title: "Shopping Trip", icon: .mock2, colorTheme: .rose)
  }
  public static var mock3: CategoryObject {
    CategoryObject(title: "Unknown Category", icon: .mock3, colorTheme: .blue)
  }
}
#endif
