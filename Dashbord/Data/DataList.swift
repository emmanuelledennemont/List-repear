//
//  DataList.swift
//  Dashbord
//
//  Created by Emmanuelle  Dennemont on 25/06/2024.
//

// DataModel.swift

import Foundation

// Structure pour représenter chaque élément de données
struct DataItem {
    var id = UUID()
    var title: String
    var sub: String
    var date: Date?
    var type: DataType
}

// Fonction de génération des données d'exemple
func generateData() -> [DataItem] {
    return [
        DataItem(title: "Repartout", sub: "gros electro", date: Date(), type: .vente),
        DataItem(title: "Réparation", sub: "téléphone", date: Date(), type: .service),
        DataItem(title: "Conférence", sub: "Tech Summit", date: Date(), type: .evenement)
    ]
}
