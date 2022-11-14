import Foundation

extension Bundle {
  private class BundleFinder {}

  static var ui: Bundle {
    guard
      let path = Bundle(for: BundleFinder.self).path(
        forResource: "RoutineJournalUIResources",
        ofType: "bundle"
      ),
      let bundle = Bundle(path: path)
    else {
      fatalError("RoutineJournalUIResources couldn't be loaded")
    }
    return bundle
  }
}
