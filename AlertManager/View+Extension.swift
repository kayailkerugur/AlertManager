//
//  View+Extension.swift
//  AlertManager
//
//  Created by İlker Kaya on 8.10.2024.
//

import SwiftUI

extension View {
    func alertWithManager(manager: AlertManager) -> some View {
        self.alert(isPresented: Binding<Bool>(
            get: { manager.isPresented },
            set: { newValue in
                manager.isPresented = newValue
            })
        ) {
            manager.alert ?? Alert(title: Text("Error"), message: Text("Unknown Error"), dismissButton: .default(Text("OK")))
        }
    }
}
