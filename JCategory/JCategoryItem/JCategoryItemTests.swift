import RoutineJournalCore
@testable import RoutineJournalJCategory
import RoutineJournalUI
import XCTest

class JCategoryItemTests: XCTestCase {
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
    let category = JCategory(
      title: "Category Title",
      icon: Icon(name: .airplane, type: .system),
      colorTheme: .amber
    )
    let title = "Category Item Title"
    let notes = "Category item notes"
    let item = JCategoryItem(category: category, title: title, notes: notes)
    XCTAssertEqual(item.category?._id, category._id)
    XCTAssertEqual(item.title, title)
    XCTAssertEqual(item.notes, notes)
  }

  func test_addCategoryItemToTheDatabase() {
    let item = JCategoryItem(
      category: JCategory(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? DataProvider.add(categoryItem: item)
    XCTAssertFalse(item.isInvalidated)
  }

  func test_deleteCategoryItemFromTheDatabase() {
    let item = JCategoryItem(
      category: JCategory(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? DataProvider.add(categoryItem: item)
    try? DataProvider.delete(categoryItem: item)
    XCTAssert(item.isInvalidated)
  }

  func test_updateCategoryItemCategory() {
    let item = JCategoryItem(
      category: JCategory(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? DataProvider.add(categoryItem: item)
    let category = JCategory(
      title: "Another Category Title",
      icon: Icon(name: .cart, type: .system),
      colorTheme: .blue
    )
    try? item.update(category: category)
    XCTAssertEqual(item.category?._id, category._id)
  }

  func test_updateCategoryItemTitle() {
    let item = JCategoryItem(
      category: JCategory(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? DataProvider.add(categoryItem: item)
    let title = "New Category Item Title"
    try? item.update(title: title)
    XCTAssertEqual(item.title, title)
  }

  func test_updateCategoryItemNotes() {
    let item = JCategoryItem(
      category: JCategory(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? DataProvider.add(categoryItem: item)
    let notes = "New category item notes"
    try? item.update(notes: notes)
    XCTAssertEqual(item.notes, notes)
  }

  func test_removeCategoryItemNotes() {
    let item = JCategoryItem(
      category: JCategory(
        title: "Category Title",
        icon: Icon(name: .airplane, type: .system),
        colorTheme: .amber
      ),
      title: "Category Item Title",
      notes: "Category item notes"
    )
    try? DataProvider.add(categoryItem: item)
    try? item.removeNotes()
    XCTAssertNil(item.notes)
  }
}
