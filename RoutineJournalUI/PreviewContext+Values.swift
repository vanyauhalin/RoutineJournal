#if DEBUG
import SwiftUI

extension PreviewContext {
  public struct Values: View {
    public let values: [String?]

    public var valuesEnumerated: [EnumeratedSequence<[String?]>.Element] {
      Array(values.enumerated())
    }

    public var body: some View {
      VStack(alignment: .leading, spacing: .zero) {
        ForEach(valuesEnumerated, id: \.offset) { index, value in
          HStack(alignment: .top, spacing: .zero) {
            Text("v\(index): ")
            Text(value ?? "nil")
          }
        }
      }
    }

    public init(values: [String?]) {
      self.values = values
    }
  }
}
#endif
