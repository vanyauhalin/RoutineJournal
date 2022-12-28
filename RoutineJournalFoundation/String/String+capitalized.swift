extension String {
  public func capitalized() -> String {
    prefix(1).uppercased() + lowercased().dropFirst()
  }
}
