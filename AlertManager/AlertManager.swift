//
//  AlertManager.swift
//  AlertManager
//
//  Created by İlker Kaya on 8.10.2024.
//

import SwiftUI

enum AlertType {
    case warning
    case info
    case confirmation
}

class AlertManager: ObservableObject {
    @Published var isPresented: Bool = false
    var alert: Alert?
    
    func show(
        type: AlertType,
        title: String,
        message: String,
        primaryButtonTitle: String = "Tamam",
        primaryButtonColor: Color = .blue,
        secondaryButtonTitle: String? = nil,
        secondaryButtonColor: Color = .gray,
        onPrimaryButtonTap: @escaping () -> Void = {},
        onSecondaryButtonTap: (() -> Void)? = nil
    ) {
        self.alert = AlertManager.createAlert(
            type: type,
            title: title,
            message: message,
            primaryButtonTitle: primaryButtonTitle,
            primaryButtonColor: primaryButtonColor,
            secondaryButtonTitle: secondaryButtonTitle,
            secondaryButtonColor: secondaryButtonColor,
            onPrimaryButtonTap: onPrimaryButtonTap,
            onSecondaryButtonTap: onSecondaryButtonTap
        )
        self.isPresented = true
    }
    
    static func createAlert(
        type: AlertType,
        title: String,
        message: String,
        primaryButtonTitle: String = "Tamam",
        primaryButtonColor: Color = .blue,
        secondaryButtonTitle: String? = nil,
        secondaryButtonColor: Color = .gray,
        onPrimaryButtonTap: @escaping () -> Void = {},
        onSecondaryButtonTap: (() -> Void)? = nil
    ) -> Alert {
        switch type {
        case .warning:
            return Alert(
                title: Text(title),
                message: Text(message),
                primaryButton: .destructive(Text(primaryButtonTitle).foregroundColor(primaryButtonColor), action: onPrimaryButtonTap),
                secondaryButton: secondaryButtonTitle != nil ? .cancel(Text(secondaryButtonTitle!).foregroundColor(secondaryButtonColor), action: onSecondaryButtonTap) : .cancel()
            )
            
        case .info:
            return Alert(
                title: Text(title),
                message: Text(message),
                dismissButton: .default(Text(primaryButtonTitle).foregroundColor(primaryButtonColor), action: onPrimaryButtonTap)
            )
            
        case .confirmation:
            return Alert(
                title: Text(title),
                message: Text(message),
                primaryButton: .default(Text(primaryButtonTitle).foregroundColor(primaryButtonColor), action: onPrimaryButtonTap),
                secondaryButton: secondaryButtonTitle != nil ? .cancel(Text(secondaryButtonTitle!).foregroundColor(secondaryButtonColor), action: onSecondaryButtonTap) : .cancel()
            )
        }
    }
}
