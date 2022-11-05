import Foundation

open class JCategoryItem {
  public private(set) var category: JCategory
  public private(set) var title: String
  public private(set) var notes: String?

  public init(category: JCategory, title: String, notes: String? = nil) {
    self.category = category
    self.title = title
    self.notes = notes
  }

  public func update(category: JCategory) {
    self.category = category
  }

  public func update(title: String) {
    self.title = title
  }

  public func update(notes: String) {
    self.notes = notes
  }
}
