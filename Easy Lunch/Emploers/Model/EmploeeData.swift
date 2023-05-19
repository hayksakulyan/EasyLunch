//
//  EmploeeData.swift
//  EasyLunch
//
//  Created by Hayk Sakulyan on 14.05.23.
//

import Foundation

struct EmploeeData: Codable {
    let data: [Emploee]
    let message: String
    let status: String
}

struct Emploee: Codable {
    
    let employee_age: UInt
    let employee_name: String
    let employee_salary: Double
    let id: UInt
    let profile_image: String
    
}
