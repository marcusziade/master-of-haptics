//
//  Haptics+Ext.swift
//  master-of-haptics
//
//  Created by Marcus Ziadé on 23.10.2021.
//

import SwiftUI
import UIKit

// MARK: - UIImpactFeedbackGenerator

extension UIImpactFeedbackGenerator.FeedbackStyle: CaseIterable, Identifiable {
    
    public var id: Int {
        rawValue
    }
    
    public static var allCases: [UIImpactFeedbackGenerator.FeedbackStyle] {
        [.light, .medium, .heavy, .rigid, .soft]
    }
    
    public var title: String {
        switch self {
        case .light: return "Light"
        case .medium: return "Medium"
        case .heavy: return "Heavy"
        case .rigid: return "Rigid"
        case .soft: return "Soft"
        @unknown default: return "Unknown"
        }
    }
    
    public var font: Font.Weight {
        switch self {
        case .light: return .light
        case .medium: return .medium
        case .heavy: return .heavy
        case .rigid: return .regular
        case .soft: return .black
        @unknown default: return .regular
        }
    }
}

// MARK: - UINotificationFeedbackGenerator

extension UINotificationFeedbackGenerator.FeedbackType: CaseIterable, Identifiable {
    
    public var id: Int {
        rawValue
    }
    
    public static var allCases: [UINotificationFeedbackGenerator.FeedbackType] {
        [.success, .warning, .error]
    }
    
    public var title: String {
        switch self {
        case .success: return "Success"
        case .warning: return "Warning"
        case .error: return "Error"
        @unknown default: return "Unknown"
        }
    }
    
    public var color: SwiftUI.Color {
        switch self {
        case .success: return .green
        case .warning: return .yellow
        case .error: return .red
        @unknown default: return .gray
        }
    }
}
