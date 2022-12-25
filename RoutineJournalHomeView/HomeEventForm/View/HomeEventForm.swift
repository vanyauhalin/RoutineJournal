import RoutineJournalEventForm
import RoutineJournalUI
import SwiftUI

public struct HomeEventForm: ToolbarContent {
  public typealias Model = HomeEventFormModel

  @ObservedObject
  public var model: Model

  public var body: some ToolbarContent {
    ToolbarItem(placement: .navigationBarTrailing) {
      Button(
        action: {
          model.show()
        },
        label: {
          Image(systemName: Model.systemName)
        }
      )
      .sheet(isPresented: $model.showing) {
        EventForm
          .render()
      }
    }
  }

  public init() {
    self.model = Model()
  }
}

struct HomeEventForm_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Text("content")
        .toolbar {
          HomeEventForm()
        }
    }
  }
}
