@testable import RoutineJournalCore
import XCTest

class CategoryItemObjectTests: XCTestCase {
  override func setUp() {
    super.setUp()
    DataProvider.useMemory(self.name)
  }

  override func tearDown() {
    super.tearDown()
    try? DataProvider.write { realm in
      realm.deleteAll()
    }
  }

  func test_categoryItemObjectInitialization() {
    let category = CategoryObject(
      title: "Category Title",
      icon: IconObject(name: .airplane, type: .system),
      colorTheme: .amber
    )
    let title = "Category Item Title"
    let notes = "Category item notes"
    let item = CategoryItemObject(
      category: category,
      title: title,
      notes: notes
    )
    XCTAssertEqual(item.category?._id, category._id)
    XCTAssertEqual(item.title, title)
    XCTAssertEqual(item.notes, notes)
  }

  func test_updateCategoryItemObjectCategory() {
    let item = CategoryItemObject(
      category: CategoryObject(
        title: "Category Title",
        icon: IconObject(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? item.add()
    let category = CategoryObject(
      title: "Another Category Title",
      icon: IconObject(name: .cart, type: .system),
      colorTheme: .blue
    )
    try? item.update(category: category)
    XCTAssertEqual(item.category?._id, category._id)
  }

  func test_updateCategoryItemObjectTitle() {
    let item = CategoryItemObject(
      category: CategoryObject(
        title: "Category Title",
        icon: IconObject(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? item.add()
    let title = "New Category Item Title"
    try? item.update(title: title)
    XCTAssertEqual(item.title, title)
  }

  func test_updateCategoryItemObjectNotes() {
    let item = CategoryItemObject(
      category: CategoryObject(
        title: "Category Title",
        icon: IconObject(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? item.add()
    let notes = "New category item notes"
    try? item.update(notes: notes)
    XCTAssertEqual(item.notes, notes)
  }

  func test_removeCategoryItemNotes() {
    let item = CategoryItemObject(
      category: CategoryObject(
        title: "Category Title",
        icon: IconObject(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? item.add()
    try? item.removeNotes()
    XCTAssertEqual(item.notes, "")
  }
}
