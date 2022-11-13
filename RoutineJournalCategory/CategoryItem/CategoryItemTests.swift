@testable import RoutineJournalCategory
import RoutineJournalCore
import RoutineJournalUI
import XCTest

class CategoryItemTests: XCTestCase {
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

  func test_categoryItemInitialization() {
    let category = Category(
      title: "Category Title",
      icon: Icon(name: .airplane, type: .system),
      colorTheme: .amber
    )
    let title = "Category Item Title"
    let notes = "Category item notes"
    let item = CategoryItem(category: category, title: title, notes: notes)
    XCTAssertEqual(item.category?._id, category._id)
    XCTAssertEqual(item.title, title)
    XCTAssertEqual(item.notes, notes)
  }

  func test_addCategoryItemToTheDatabase() {
    let item = CategoryItem(
      category: Category(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? item.add()
    XCTAssertFalse(item.isInvalidated)
  }

  func test_deleteCategoryItemFromTheDatabase() {
    let item = CategoryItem(
      category: Category(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? item.add()
    try? item.delete()
    XCTAssert(item.isInvalidated)
  }

  func test_updateCategoryItemCategory() {
    let item = CategoryItem(
      category: Category(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? item.add()
    let category = Category(
      title: "Another Category Title",
      icon: Icon(name: .cart, type: .system),
      colorTheme: .blue
    )
    try? item.update(category: category)
    XCTAssertEqual(item.category?._id, category._id)
  }

  func test_updateCategoryItemTitle() {
    let item = CategoryItem(
      category: Category(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
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

  func test_updateCategoryItemNotes() {
    let item = CategoryItem(
      category: Category(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
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
    let item = CategoryItem(
      category: Category(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? item.add()
    try? item.removeNotes()
    XCTAssertNil(item.notes)
  }
}
