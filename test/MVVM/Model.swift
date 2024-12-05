//
//  Model.swift
//  test
//
//  Created by Devis on 05/12/2024.
//

import SwiftUI

struct Car: Identifiable, Codable{
    var id = UUID()
    var name: String
    var condition: String
    var color: String
}
