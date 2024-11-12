//
//  LoginRequest.swift
//  PiControlRestMessages
//
//  Created by Thomas Bonk on 09.11.24.
//  Copyright 2024 Thomas Bonk
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

/**
 This struct is used to login via the URI `/login`.
 
 The deviceId os passed, everything else is handled via the `Authorization` header field
 of the HTTP request. The follwoing characteristics are handled:
 
 - Header not present or empty: The server answers with a `LoginResponse` that has further instructions.
 - Bearer: JWT token that is used. If it is expired the server answers with a `LoginResponse` that has
   further instructions.
 - Basic: DeviceId/Password combination Bas64 encoded: base64(<deviceId>:<password>). This is only valid
   if no owner has been registered, yet. If a ownder has already been registered, the login fails.
 - Code: Registration code Base64 encoded: base64(<deviceId>:<code>). This is only valid for additional
   users.
 */
public struct LoginRequest: Codable {
    
}

public extension LoginRequest {
    func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    static func decode(from data: Data) throws -> Self {
        return try JSONDecoder().decode(Self.self, from: data)
    }
}
