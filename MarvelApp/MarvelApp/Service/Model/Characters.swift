
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let statusProfileMe = try? newJSONDecoder().decode(StatusProfileMe.self, from: jsonData)

import Foundation

// MARK: - StatusProfileMe
class Characters: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHtml: String?
    let etag: String?
    var data: StatusData?
    
    enum CodingKeys: String, CodingKey {
        case code, status, copyright, attributionText
        case attributionHtml = "attributionHTML"
        case etag, data
    }
    
    init(code: Int?, status: String?, copyright: String?, attributionText: String?, attributionHtml: String?, etag: String?, data: StatusData?) {
        self.code = code
        self.status = status
        self.copyright = copyright
        self.attributionText = attributionText
        self.attributionHtml = attributionHtml
        self.etag = etag
        self.data = data
    }
}

// MARK: - Data
class StatusData: Codable {
    var offset, limit, total, count: Int?
    var results: [CharactersResult]?
    
    init(offset: Int?, limit: Int?, total: Int?, count: Int?, results: [CharactersResult]?) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}

// MARK: - Result
class CharactersResult: Codable {
    let id: Int?
    let name, resultDescription: String?
    let modified: String?
    let thumbnail: StatusThumbnail?
    let resourceUri: String?
    let comics, series: StatusComics?
    let stories: StatusStories?
    let events: StatusComics?
    let urls: [StatusURL]?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail
        case resourceUri = "resourceURI"
        case comics, series, stories, events, urls
    }
    
    init(id: Int?, name: String?, resultDescription: String?, modified: String?, thumbnail: StatusThumbnail?, resourceUri: String?, comics: StatusComics?, series: StatusComics?, stories: StatusStories?, events: StatusComics?, urls: [StatusURL]?) {
        self.id = id
        self.name = name
        self.resultDescription = resultDescription
        self.modified = modified
        self.thumbnail = thumbnail
        self.resourceUri = resourceUri
        self.comics = comics
        self.series = series
        self.stories = stories
        self.events = events
        self.urls = urls
    }
}

// MARK: - StatusComics
class StatusComics: Codable {
    let available: Int?
    let collectionUri: String?
    let items: [StatusComicsItem]?
    let returned: Int?
    
    enum CodingKeys: String, CodingKey {
        case available
        case collectionUri = "collectionURI"
        case items, returned
    }
    
    init(available: Int?, collectionUri: String?, items: [StatusComicsItem]?, returned: Int?) {
        self.available = available
        self.collectionUri = collectionUri
        self.items = items
        self.returned = returned
    }
}

// MARK: - StatusComicsItem
class StatusComicsItem: Codable {
    let resourceUri: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case resourceUri = "resourceURI"
        case name
    }
    
    init(resourceUri: String?, name: String?) {
        self.resourceUri = resourceUri
        self.name = name
    }
}

// MARK: - StatusStories
class StatusStories: Codable {
    let available: Int?
    let collectionUri: String?
    let items: [StatusStoriesItem]?
    let returned: Int?
    
    enum CodingKeys: String, CodingKey {
        case available
        case collectionUri = "collectionURI"
        case items, returned
    }
    
    init(available: Int?, collectionUri: String?, items: [StatusStoriesItem]?, returned: Int?) {
        self.available = available
        self.collectionUri = collectionUri
        self.items = items
        self.returned = returned
    }
}

// MARK: - StatusStoriesItem
class StatusStoriesItem: Codable {
    let resourceUri: String?
    let name, type: String?
    
    enum CodingKeys: String, CodingKey {
        case resourceUri = "resourceURI"
        case name, type
    }
    
    init(resourceUri: String?, name: String?, type: String?) {
        self.resourceUri = resourceUri
        self.name = name
        self.type = type
    }
}

// MARK: - StatusThumbnail
class StatusThumbnail: Codable {
    let path: String?
    let thumbnailExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    init(path: String?, thumbnailExtension: String?) {
        self.path = path
        self.thumbnailExtension = thumbnailExtension
    }
}

// MARK: - StatusURL
class StatusURL: Codable {
    let type: String?
    let url: String?
    
    init(type: String?, url: String?) {
        self.type = type
        self.url = url
    }
}

