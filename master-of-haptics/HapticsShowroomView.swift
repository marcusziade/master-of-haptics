import SwiftUI

struct HapticsShowroomView: View {

    @State private var impactIntensity: Float = 1.0

    var body: some View {
        List {
            Section("Selection haptic") {
                Button {
                    UISelectionFeedbackGenerator().selectionChanged()
                } label: {
                    Text("Selection")
                        .foregroundColor(.primary)
                }
            }

            Section("Impact haptics") {
                HapticIntensityView(impactIntensity: $impactIntensity)

                ForEach(UIImpactFeedbackGenerator.FeedbackStyle.allCases) { style in
                    Button {
                        UIImpactFeedbackGenerator(style: style)
                            .impactOccurred(
                                intensity: CGFloat(impactIntensity)
                            )
                    } label: {
                        Text(style.title)
                            .foregroundColor(.primary)
                            .fontWeight(style.font)
                    }
                }
            }

            Section("Notification haptics") {
                ForEach(UINotificationFeedbackGenerator.FeedbackType.allCases) { type in
                    Button {
                        UINotificationFeedbackGenerator().notificationOccurred(type)
                    } label: {
                        Text(type.title)
                            .foregroundColor(type.color)
                    }
                }
            }

            Link(
                "Human Interface Guidelines - Haptics",
                destination: URL(
                    string:
                        "https://developer.apple.com/design/human-interface-guidelines/ios/user-interaction/haptics/"
                )!
            )
        }
    }
}

struct HapticsShowroomView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HapticsShowroomView()
                .previewDevice("iPod touch (7th generation)")
            HapticsShowroomView()
                .previewDevice("iPhone 8")
            HapticsShowroomView()
                .previewDevice("iPhone 13 Pro Max")
        }
    }
}


