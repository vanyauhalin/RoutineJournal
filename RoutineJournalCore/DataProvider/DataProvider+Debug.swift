#if DEBUG

public extension DataProvider {
  static func useMemory(_ identifier: String) {
    configuration.inMemoryIdentifier = identifier
  }
}

#endif
