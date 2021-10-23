//
//  HapticShowroomView.swift
//  master-of-haptics
//
//  Created by Marcus Ziadé on 23.10.2021.
//

import SwiftUI

struct HapticShowroomView: View {

    @State private var impactIntensity: Float = 0.5

    var body: some View {
        List {
            Section {
                Button { UISelectionFeedbackGenerator().selectionChanged() } label: {
                    Text("Selection").foregroundColor(.primary)
                }
            } header: {
                Text("Selection")
            }

            Section {
                Slider(value: $impactIntensity, in: 0...1)
                Label(String(impactIntensity), systemImage: "bolt.circle.fill")

                ForEach(UIImpactFeedbackGenerator.FeedbackStyle.allCases, id: \.self) { style in
                    Button {
                        UIImpactFeedbackGenerator(style: style).impactOccurred(intensity: CGFloat(impactIntensity))
                    } label: {
                        Text(style.title).foregroundColor(.primary).fontWeight(style.font)
                    }
                }
            } header: {
                Text("Impact")
            }

            Section {
                ForEach(UINotificationFeedbackGenerator.FeedbackType.allCases, id: \.self) { style in
                    Button { UINotificationFeedbackGenerator().notificationOccurred(style) } label: {
                        Text(style.title).foregroundColor(style.color)
                    }
                }
            } header: {
                Text("Notifications")
            }

            Link("Human Interface Guidelines - Haptics",
                 destination: URL(string: "https://developer.apple.com/design/human-interface-guidelines/ios/user-interaction/haptics/")!
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HapticShowroomView()
            .preferredColorScheme(.dark)
    }
}
