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
    let item = JCategoryItem(
      category: category,
      title: "Category Item Title",
      notes: "Category item notes"
    )
    XCTAssertNotNil(item._id)
    XCTAssertEqual(item.category?._id, category._id)
    XCTAssertEqual(item.title, "Category Item Title")
    XCTAssertEqual(item.notes, "Category item notes")
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

  func test_findCategoryItemInTheDatabase() {
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
    let founded = try? DataProvider.findCategoryItem(by: item._id)
    XCTAssertEqual(item._id, founded?._id)
    XCTAssertEqual(item.category?._id, founded?.category?._id)
    XCTAssertEqual(item.title, founded?.title)
    XCTAssertEqual(item.notes, founded?.notes)
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
    try? item.update(category: JCategory(
      title: "Another Category Title",
      icon: Icon(name: .cart, type: .system),
      colorTheme: .blue
    ))
    let founded = try? DataProvider.findCategoryItem(by: item._id)
    XCTAssertEqual(item.category?._id, founded?.category?._id)
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
    try? item.update(title: "New Category Item Title")
    let founded = try? DataProvider.findCategoryItem(by: item._id)
    XCTAssertEqual(item.title, "New Category Item Title")
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
    try? item.update(notes: "New category item notes")
    let founded = try? DataProvider.findCategoryItem(by: item._id)
    XCTAssertEqual(item.notes, "New category item notes")
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
    let founded = try? DataProvider.findCategoryItem(by: item._id)
    XCTAssertNil(item.notes)
  }
}