import Foundation

extension Bundle {
  private final class BundleFinder {}

  static var resources: Bundle {
    guard
      let path = Bundle(for: BundleFinder.self).path(
        forResource: "RoutineJournalUIResources",
        ofType: "bundle"
      ),
      let bundle = Bundle(path: path)
    else {
      fatalError("Failed to load RoutineJournalUIResources")
    }
    return bundle
  }
}
