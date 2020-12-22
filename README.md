# NGSwiftUIDoubleSheetExample
This code demonstrates an issue where when using two SwiftUI `.sheet` modifiers in an AppKit project, only the second actually controls a sheet.

To reproduce the issue:

1. Clone [https://github.com/noahsark769/NGSwiftUIDoubleSheetExample](https://github.com/noahsark769/NGSwiftUIDoubleSheetExample) and open the xcodeproj
2. Run the project
3. Click the "Present Sheet 1" button

Expected: The sheet is presented
Actual: Nothing happens

Note: The relevant code is small enough that I'll reproduce it here:

```swift
struct ContentView: View {
    @State var isPresenting1 = false
    @State var isPresenting2 = false

    var body: some View {
        VStack {
            Button("Present Sheet 1") {
                self.isPresenting1 = true
            }
            Button("Present Sheet 2") {
                self.isPresenting2 = true
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: self.$isPresenting1, content: {
            Button("Dismiss") {
                self.isPresenting1 = false
            }
            .frame(width: 200, height: 200).background(Color.red)
        })
        .sheet(isPresented: self.$isPresenting2, content: {
            Button("Dismiss") {
                self.isPresenting2 = false
            }
            .frame(width: 200, height: 200).background(Color.red)
        })
    }
}
```

Note: The same technique worked correctly on macOS 10.15 (Catalina). This issue was reproduced with Xcode 12.3 on macOS Big Sur 11.0.
