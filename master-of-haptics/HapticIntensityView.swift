import SwiftUI

struct HapticIntensityView: View {

    @Binding var impactIntensity: Float

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                Label(formatter.string(for: impactIntensity)!, systemImage: "bolt.circle.fill")

                Text("Haptic intensity")
                    .font(.caption)
            }

            Slider(value: $impactIntensity, in: 0...1)
        }
        .padding(.vertical)
    }

    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumIntegerDigits = 0
        formatter.maximumIntegerDigits = 100
        return formatter
    }()
}

struct SliderView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            HapticIntensityView(impactIntensity: .constant(1.0))
                .preferredColorScheme(.dark)
            HapticIntensityView(impactIntensity: .constant(0.3))
                .preferredColorScheme(.light)
        }
        .previewLayout(.sizeThatFits)
    }
}


