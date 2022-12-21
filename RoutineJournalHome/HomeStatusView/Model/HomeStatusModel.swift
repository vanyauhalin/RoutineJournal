import Foundation

public final class HomeStatusModel {
  public typealias Model = HomeStatusModel

  public static let dateformatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d"
    return formatter
  }()

  public let date = Date.now

  public var status: String {
    Model.dateformatter.string(from: date)
  }

  public init() {}
}
