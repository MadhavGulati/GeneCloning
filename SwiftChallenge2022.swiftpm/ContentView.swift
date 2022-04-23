import SwiftUI

struct ContentView: View {
    @State var onboardingBool:Bool = true
    var body: some View {
        if onboardingBool {
            Onboarding(onboardingBool: $onboardingBool).preferredColorScheme(.light)
        }
        else {
            SceneView(onboardingBool: $onboardingBool)
                .preferredColorScheme(.light)
        }
    }
}




//This code from User 9607863 "George" on StackOverFlow:
//https://stackoverflow.com/questions/56490250/dynamically-hiding-view-in-swiftui
//Used in order to show/hide views programmatically
extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
