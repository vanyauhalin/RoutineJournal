import SwiftUI

struct LayoutSettingsView<Content>: View where Content: View {
  @ViewBuilder var content: () -> Content
  @State var mounted = false

  var body: some View {
    ZStack {
      Color
        .clear
        .frame(width: 0, height: 0)
        .padding([.leading])
        .hidden()
        .readSize { size in
          LayoutSettings.padding = size.width
        }
        .onAppear {
          mounted = true
        }

      if mounted {
        content()
      }
    }
  }
}

struct LayoutSettingsView_Previews: PreviewProvider {
  static var previews: some View {
    LayoutSettingsView {
      Text("padding: \(LayoutSettings.padding)")
    }
  }
}
