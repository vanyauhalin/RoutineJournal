import RoutineJournalCore
@testable import RoutineJournalJCategory
import RoutineJournalUI
import XCTest

class JCategoryTests: XCTestCase {
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
    let category = JCategory(
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
    let category = JCategory(
      title: "Category Title",
      icon: Icon(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? DataProvider.add(category: category)
    XCTAssertFalse(category.isInvalidated)
  }

  func test_findACategoryInTheDatabase() {
    let category = JCategory(
      title: "Category Title",
      icon: Icon(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? DataProvider.add(category: category)
    let founded = try? DataProvider.findCategory(by: category._id)
    XCTAssertEqual(category._id, founded?._id)
    XCTAssertEqual(category.title, founded?.title)
    XCTAssertEqual(category.icon?._id, founded?.icon?._id)
    XCTAssertEqual(category.colorTheme, founded?.colorTheme)
  }

  func test_deleteACategoryFromTheDatabase() {
    let category = JCategory(
      title: "Category Title",
      icon: Icon(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? DataProvider.add(category: category)
    try? DataProvider.delete(category: category)
    XCTAssert(category.isInvalidated)
  }

  func test_updateCategoryTitle() {
    let category = JCategory(
      title: "Category Title",
      icon: Icon(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? DataProvider.add(category: category)
    try? category.update(title: "New Category Title")
    let founded = try? DataProvider.findCategory(by: category._id)
    XCTAssertEqual(category.title, founded?.title)
  }

  func test_selectCategoryIcon() {
    let category = JCategory(
      title: "Category Title",
      icon: Icon(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? DataProvider.add(category: category)
    try? category.select(icon: Icon(name: .cart, type: .system))
    let founded = try? DataProvider.findCategory(by: category._id)
    XCTAssertEqual(category.icon?._id, founded?.icon?._id)
  }

  func test_selectCategoryColorTheme() {
    let category = JCategory(
      title: "Category Title",
      icon: Icon(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? DataProvider.add(category: category)
    try? category.select(colorTheme: .blue)
    let founded = try? DataProvider.findCategory(by: category._id)
    XCTAssertEqual(category.colorTheme, founded?.colorTheme)
  }
}