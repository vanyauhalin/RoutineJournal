#if DEBUG
extension DataProvider {
  public static func useMemory(_ identifier: String) {
    configuration.inMemoryIdentifier = identifier
  }
}
#endif
