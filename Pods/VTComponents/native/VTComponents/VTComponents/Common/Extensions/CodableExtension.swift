//
//  CodableExtensions.swift
//
//  Created by Imthath M on 21/02/19.
//  No Copyright.
//

import Foundation

private let encoder = JSONEncoder()
private let decoder = JSONDecoder()

extension Encodable {
    public var jsonString: String? {
        do {
            return String(data: try encoder.encode(self), encoding: .utf8)
        } catch {
            return nil
        }
    }

    public var jsonData: Data? {
        return try? encoder.encode(self)
    }

    public var dictionary: [String: Any]? {
        return (try? JSONSerialization.jsonObject(with: encoder.encode(self),
                                                  options: .allowFragments))
                .flatMap { $0 as? [String: Any] }
    }
}

extension Decodable {
    public init?(from jsonString: String) {
        let data = Data(jsonString.utf8)
        guard let object = try? decoder.decode(Self.self, from: data) else { return nil }
        self = object
    }

    public init?(from jsonData: Data) {
        guard let object = try? decoder.decode(Self.self, from: jsonData) else { return nil }
        self = object
    }
}

public protocol Imitable: Codable {
    var copy: Self? { get }
}

extension Imitable {
    public var copy: Self? {
        guard let data = try? encoder.encode(self) else { return nil }
        return try? decoder.decode(Self.self, from: data)
    }
}

public protocol Distinguishable: Codable {
    func isDistinct(from other: Self) -> Bool
}

extension Distinguishable {
    public func isDistinct(from other: Self) -> Bool {
        return self.jsonData != other.jsonData
    }
}

extension Data {
    public var dictionary: [String: Any]? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: .mutableLeaves) as? [String: Any]
        } catch {
            return nil
        }
    }
}
