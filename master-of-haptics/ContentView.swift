//
//  ContentView.swift
//  master-of-haptics
//
//  Created by Marcus Ziadé on 23.10.2021.
//

import Combine
import SwiftUI

struct HapticShowroomView: View {

    @State private var selectionIntensity: Float = 0.5
    @State private var impactIntensity: Float = 0.5
    @State private var notificationIntensity: Float = 0.5

    var body: some View {
        List {
            Section {
                Slider(value: $selectionIntensity, in: 0...1)
                Label(String(selectionIntensity), systemImage: "bolt.circle.fill")

                Button { UISelectionFeedbackGenerator().selectionChanged() } label: {
                    Text("Selection").foregroundColor(.primary)
                }
            } header: { Text("Selection") }


            Section {
                Slider(value: $impactIntensity, in: 0...1)
                Label(String(impactIntensity), systemImage: "bolt.circle.fill")

                ForEach(UIImpactFeedbackGenerator.FeedbackStyle.allCases, id: \.self) { style in
                    Button {
                        UIImpactFeedbackGenerator(style: style).impactOccurred(intensity: CGFloat(impactIntensity))
                    } label: { Text(style.title).foregroundColor(.primary).fontWeight(style.font) }
                }
            } header: { Text("Impact") }

            Section {
                Slider(value: $notificationIntensity, in: 0...1)
                Label(String(notificationIntensity), systemImage: "bolt.circle.fill")

                ForEach(UINotificationFeedbackGenerator.FeedbackType.allCases, id: \.self) { style in
                    Button { UINotificationFeedbackGenerator().notificationOccurred(style) } label: {
                        Text(style.title).foregroundColor(style.color)
                    }
                }
            } header: { Text("Notifications") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HapticShowroomView()
            .preferredColorScheme(.dark)
    }
}
