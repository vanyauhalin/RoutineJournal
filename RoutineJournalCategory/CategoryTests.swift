@testable import RoutineJournalCategory
import RoutineJournalCore
import RoutineJournalUI
import XCTest

class CategoryTests: XCTestCase {
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

  func test_categoryInitialization() {
    let icon = Icon(name: .airplane, type: .system)
    let category = Category(
      title: "Category Title",
      icon: icon,
      colorTheme: .amber
    )
    XCTAssertNotNil(category._id)
    XCTAssertEqual(category.title, "Category Title")
    XCTAssertEqual(category.icon?._id, icon._id)
    XCTAssertEqual(category.colorTheme, .amber)
  }

  func test_addACategoryToTheDatabase() {
    let category = Category(
      title: "Category Title",
      icon: Icon(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? category.add()
    XCTAssertFalse(category.isInvalidated)
  }

  func test_deleteACategoryFromTheDatabase() {
    let category = Category(
      title: "Category Title",
      icon: Icon(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? category.add()
    try? category.delete()
    XCTAssert(category.isInvalidated)
  }

  func test_updateCategoryTitle() {
    let category = Category(
      title: "Category Title",
      icon: Icon(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? category.add()
    let title = "New Category Title"
    try? category.update(title: title)
    XCTAssertEqual(category.title, title)
  }

  func test_selectCategoryIcon() {
    let category = Category(
      title: "Category Title",
      icon: Icon(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? category.add()
    let icon = Icon(name: .cart, type: .system)
    try? category.select(icon: icon)
    XCTAssertEqual(category.icon?._id, icon._id)
  }

  func test_selectCategoryColorTheme() {
    let category = Category(
      title: "Category Title",
      icon: Icon(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? category.add()
    let colorTheme = ColorTheme.blue
    try? category.select(colorTheme: colorTheme)
    XCTAssertEqual(category.colorTheme, colorTheme)
  }
}
