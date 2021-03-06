//
//  Anime.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/04.
//

import Foundation

struct AnimeResponse: Decodable {
    let animes: [Anime]

    private enum CodingKeys: String, CodingKey {
        case animes = "works"
    }
}

struct Anime: Decodable {
    let id: Int
    let title: String
    let images: Images
    let officialSiteUrl: String

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case images
        case officialSiteUrl = "official_site_url"
    }

    func getRecommendedImageURL() -> String? {
        if let imageUrl = images.items["recommended_url"] as? String {
            return imageUrl
        }
        return nil
    }
}

///////////////////////////////////////////////////////////////////////////////////

// imagesを[String:Any]としてデコードするため
// 参考URL
// https://rizumita.medium.com/swift%E3%81%AEcodable%E3%81%A7-string-any-%E3%82%84-any-%E3%81%AE%E3%83%97%E3%83%AD%E3%83%91%E3%83%86%E3%82%A3%E3%82%92%E3%83%87%E3%82%B3%E3%83%BC%E3%83%89%E3%81%99%E3%82%8B-f8701884b09b

struct Images: Decodable {
    let items: [String:Any]
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKeys.self)
        items = try container.decode([String:Any].self)
    }
}

struct AnyCodingKeys: CodingKey {
    var stringValue: String
    var intValue: Int?

    init?(stringValue: String) { self.stringValue = stringValue }

    init?(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
    }
}

extension KeyedDecodingContainer {
    func decode(_ type: [Any].Type, forKey key: K) throws -> [Any] {
        var container = try self.nestedUnkeyedContainer(forKey: key)
        return try container.decode(type)
    }

    func decodeIfPresent(_ type: [Any].Type, forKey key: K) throws -> [Any]? {
        guard contains(key) else { return .none }
        return try decode(type, forKey: key)
    }

    func decode(_ type: [String:Any].Type, forKey key: K) throws -> [String:Any] {
        let container = try nestedContainer(keyedBy: AnyCodingKeys.self, forKey: key)
        return try container.decode(type)
    }

    func decodeIfPresent(_ type: [String:Any].Type, forKey key: K) throws -> [String:Any]? {
        guard contains(key) else { return .none }
        return try decode(type, forKey: key)
    }

    func decode(_ type: [String:Any].Type) throws -> [String:Any] {
        var dictionary = [String:Any]()

        allKeys.forEach { key in
            if let value = try? decode(Bool.self, forKey: key) {
                dictionary[key.stringValue] = value
            } else if let value = try? decode(String.self, forKey: key) {
                dictionary[key.stringValue] = value
            } else if let value = try? decode(Int64.self, forKey: key) {
                dictionary[key.stringValue] = value
            } else if let value = try? decode(Double.self, forKey: key) {
                dictionary[key.stringValue] = value
            } else if let value = try? decode([String:Any].self, forKey: key) {
                dictionary[key.stringValue] = value
            } else if let value = try? decode([Any].self, forKey: key) {
                dictionary[key.stringValue] = value
            }
        }

        return dictionary
    }
}

extension UnkeyedDecodingContainer {
    mutating func decode(_ type: [Any].Type) throws -> [Any] {
        var array = [Any]()

        while isAtEnd == false {
            if let value = try? decode(Bool.self) {
                array.append(value)
            } else if let value = try? decode(String.self) {
                array.append(value)
            } else if let value = try? decode(Int64.self) {
                array.append(value)
            } else if let value = try? decode(Double.self) {
                array.append(value)
            } else if let value = try? decode([String:Any].self) {
                array.append(value)
            } else if let value = try? decode([Any].self) {
                array.append(value)
            }
        }

        return array
    }

    mutating func decode(_ type: [String:Any].Type) throws -> [String:Any] {
        let nestedContainer = try self.nestedContainer(keyedBy: AnyCodingKeys.self)
        return try nestedContainer.decode(type)
    }
}
