//
//  EmploeeViewModel.swift
//  EasyLunch
//
//  Created by Hayk Sakulyan on 12.05.23.
//

import Foundation
import Alamofire

class EmploeeViewModel {
    
    let api = "https://dummy.restapiexample.com"
    let getAllEmployeeData = "/api/v1/employees" //GET
    let getSingleEmployeeData = "/api/v1/employee/1" //GET
    let createNewRecord = "/api/v1/create" //POST
    let updateEmployeeData = "/api/v1/update/21" //PUT
    let deleteEmployeerecord = "/api/v1/delete/2" //DELETE
    
    func endpointGenerator(endpoint: String) -> String {
        let path = api + endpoint
        return path
    }
    
    
    
    func getEmploeeList() {
        
                AF.request(endpointGenerator(endpoint: getAllEmployeeData), method: .get, parameters: nil, headers: ["Content-Type" : "application/json"]).responseJSON { response in
                    print(response)
//                    switch response.response?.statusCode {
//                    case 200...300:
//                        print("")
//                    case 302...400:
//                        print("")
//                    case 400...499:
//                        print("")
//                    default:
//                        break
//                    }
                }
        
//        AF.request(endpointGenerator(endpoint: getAllEmployeeData), method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
//
//            switch response.result {
//            case .success(let data):
//                print("")
//            case .failure(let error):
//                print("")
//            }
//        }
    }
}