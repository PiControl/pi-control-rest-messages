//
//  LoginResponse.swift
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

public enum LoginResult: String, Codable {
    case success            = "success"
    case failure            = "failure"
    case sendCredentials    = "sendCredentials"
    case sendCode           = "sendCode"
    case sendToken          = "sendToken"
}

/**
 Response for a `LoginRequest`.
 */
public struct LoginResponse: Codable {
    
    // MARK: - Public Properties
    
    /// Result of the `LoginRequest`
    public let result: LoginResult
    /// A message according to the result.
    public let message: String
    /// The JWT token; is available if result is `success` and no token was available before.
    public let token: String?
    /// Base64 encoded MQTT credentials
    public let mqttCredentials: String?
    
    
    // MARK: - Initialization
    
    public init(result: LoginResult, message: String, token: String? = nil, mqttCredentials: String? = nil) {
        self.result = result
        self.message = message
        self.token = token
        self.mqttCredentials = mqttCredentials
    }
}

public extension LoginResponse {
    func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    static func decode(from data: Data) throws -> Self {
        return try JSONDecoder().decode(Self.self, from: data)
    }
}
