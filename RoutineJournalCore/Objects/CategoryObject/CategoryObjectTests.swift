@testable import RoutineJournalCore
import XCTest

class CategoryObjectTests: XCTestCase {
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

  func test_categoryObjectInitialization() {
    let title = "Category Title"
    let icon = IconObject(name: .airplane, type: .system)
    let colorTheme = ColorTheme.amber
    let category = CategoryObject(
      title: title,
      icon: icon,
      colorTheme: colorTheme
    )
    XCTAssertNotNil(category._id)
    XCTAssertEqual(category.title, title)
    XCTAssertEqual(category.icon?._id, icon._id)
    XCTAssertEqual(category.colorTheme, colorTheme)
  }

  func test_updateCategoryObjectTitle() {
    let category = CategoryObject(
      title: "Category Title",
      icon: IconObject(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? category.add()
    let title = "New Category Title"
    try? category.update(title: title)
    XCTAssertEqual(category.title, title)
  }

  func test_selectCategoryObjectIcon() {
    let category = CategoryObject(
      title: "Category Title",
      icon: IconObject(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? category.add()
    let icon = IconObject(name: .cart, type: .system)
    try? category.select(icon: icon)
    XCTAssertEqual(category.icon?._id, icon._id)
  }

  func test_selectCategoryObjectColorTheme() {
    let category = CategoryObject(
      title: "Category Title",
      icon: IconObject(name: .airplane, type: .system),
      colorTheme: .amber
    )
    try? category.add()
    let colorTheme = ColorTheme.blue
    try? category.select(colorTheme: colorTheme)
    XCTAssertEqual(category.colorTheme, colorTheme)
  }
}
