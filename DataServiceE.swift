//
//  DataService.swift
//  ActItOut
//
//  Created by Sebastian Molina on 7/23/23.
//

import Foundation

struct DataServiceE {
    
    func getDataE() -> [Cover] {
        
        return [Cover(imageName: "Mime", imageName2: "Wild", imageName3: "Sing"),
                Cover(imageName: "Lunch", imageName2: "Lights", imageName3: "Feeling"),
                Cover(imageName: "Legends", imageName2: "Spotlight", imageName3: "Once")]
        
    }
}

struct DataServicS {
    
    func getDataS() -> [Cover] {
        
        return [Cover(imageName: "Mania", imageName2: "Manada", imageName3: "Cantalo"),
                Cover(imageName: "Comer", imageName2: "Luces", imageName3: "Locura"),
                Cover(imageName: "Leyendas", imageName2: "Bajo", imageName3: "Erase")]
        
    }
}

struct PurchaseDataE {
    
    func getPurchaseE() -> [Purchase] {
        
        return [Purchase(imageName: "Legends"),
                Purchase(imageName: "Spotlight"),
                Purchase(imageName: "Once")]
    }
}

struct PurchaseDataS {
    
    func getPurchaseS() -> [Purchase] {
        
        return [Purchase(imageName: "Leyendas"),
                Purchase(imageName: "Bajo"),
                Purchase(imageName: "Erase")]
    }
}


