//
//  ListContent.swift
//  Dashbord
//
//  Created by Emmanuelle  Dennemont on 25/06/2024.
//


import Foundation



// Modèle enum pour représenter les types de données
enum DataType: String, CaseIterable {
    case vente = "Vente"
    case service = "Service"
    case evenement = "Événement"
}

// Extension pour l'icône associée à chaque type de données
extension DataType {
    func iconName() -> String {
        switch self {
        case .vente:
            return "washer.fill"
        case .service:
            return "wrench.and.screwdriver.fill"
        case .evenement:
            return "iphone.gen1"
        }
    }
}
