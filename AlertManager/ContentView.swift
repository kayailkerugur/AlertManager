//
//  ContentView.swift
//  AlertManager
//
//  Created by İlker Kaya on 8.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var alertManager = AlertManager()

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Alert Manager")
                    .font(.title.bold())
                    .padding(.top)
                
                Spacer()
                
                Button("Uyarı Türü: Uyarmak (Warning)") {
                    alertManager.show(
                        type: .warning,
                        title: "Uyarı",
                        message: "Bu bir uyarı uyarısıdır!",
                        primaryButtonTitle: "Tamam",
                        secondaryButtonTitle: "Vazgeç",
                        onPrimaryButtonTap:  {
                            print("Tamam'a basıldığında yapılacak işlemler")
                        },
                        onSecondaryButtonTap:  {
                            print("Vazgeç'e basıldığında yapılacak işlemler")
                        })
                    
                    // Eğer vazgeç butonun gözükmemesini istiyorsanız secondaryButtonTitle ve onSecondaryButtonTap parametrelerini kaldırın, bunu diğer alert modları için yapabilirsiniz.
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width - 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 1)
                )
                
                
                Button("Uyarı Türü: Bilgilendirme (Information)") {
                    alertManager.show(
                        type: .info,
                        title: "Bilgilendirme",
                        message: "Bu bir bilgilendirmedir!",
                        primaryButtonTitle: "Tamam")
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width - 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 1)
                )
                .padding(.top)
                
                Button("Uyarı Türü: Doğrulama (Confirmation)") {
                    alertManager.show(
                        type: .confirmation,
                        title: "Doğrula",
                        message: "Bu bir doğrulama uyarısıdır!",
                        primaryButtonTitle: "Tamam",
                        secondaryButtonTitle: "Vazgeç",
                        onPrimaryButtonTap:  {
                            print("Tamam'a basıldığında yapılacak işlemler")
                        },
                        onSecondaryButtonTap:  {
                            print("Vazgeç'e basıldığında yapılacak işlemler")
                        })
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width - 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 1)
                )
                .padding(.top)
                
                Spacer()
            }
        }
        .alertWithManager(manager: alertManager)
    }
}

#Preview {
    ContentView()
}
