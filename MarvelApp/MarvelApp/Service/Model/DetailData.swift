//
//  DetailData.swift
//  MarvelApp
//
//  Created by Asit Aslan on 2.02.2022.
//  Copyright © 2022 Asit Aslan. All rights reserved.
//

import Foundation

// MARK: - StatusDetailData
class Detail: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHtml: String?
    let etag: String?
    let data: DetailData?

    enum CodingKeys: String, CodingKey {
        case code, status, copyright, attributionText
        case attributionHtml = "attributionHTML"
        case etag, data
    }

    init(code: Int?, status: String?, copyright: String?, attributionText: String?, attributionHtml: String?, etag: String?, data: DetailData?) {
        self.code = code
        self.status = status
        self.copyright = copyright
        self.attributionText = attributionText
        self.attributionHtml = attributionHtml
        self.etag = etag
        self.data = data
    }
}

// MARK: - StatusData
class DetailData: Codable {
    let offset, limit, total, count: Int?
    let results: [DetailResult]?

    init(offset: Int?, limit: Int?, total: Int?, count: Int?, results: [DetailResult]?) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}

// MARK: - StatusResult
class DetailResult: Codable {
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
class Comics: Codable {
    let available: Int?
    let collectionUri: String?
    let items: [ComicsItem]?
    let returned: Int?

    enum CodingKeys: String, CodingKey {
        case available
        case collectionUri = "collectionURI"
        case items, returned
    }

    init(available: Int?, collectionUri: String?, items: [ComicsItem]?, returned: Int?) {
        self.available = available
        self.collectionUri = collectionUri
        self.items = items
        self.returned = returned
    }
}


// MARK: - StatusStories
class Stories: Codable {
    let available: Int?
    let collectionUri: String?
    let items: [Item]?
    let returned: Int?

    enum CodingKeys: String, CodingKey {
        case available
        case collectionUri = "collectionURI"
        case items, returned
    }

    init(available: Int?, collectionUri: String?, items: [Item]?, returned: Int?) {
        self.available = available
        self.collectionUri = collectionUri
        self.items = items
        self.returned = returned
    }
}

// MARK: - StatusStoriesItem
class Item: Codable {
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

// MARK: - StatusComicsItem
class ComicsItem: Codable {
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
