#if DEBUG
import RealmSwift

extension DataProvider {
  public static var examples: [Object] = []

  public static func addExamples() throws {
    for configuration in configurations {
      for example in configuration.examples() {
        try example.add()
        examples.append(example)
      }
    }
  }

  public static func deleteExamples() throws {
    for example in examples.reversed() {
      try example.delete()
      examples.removeLast()
    }
  }
}
#endif
