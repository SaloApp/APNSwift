//===----------------------------------------------------------------------===//
//
// This source file is part of the APNSwift open source project
//
// Copyright (c) 2022 the APNSwift project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of APNSwift project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

struct APNSLiveActivityNotificationAPSStorage<ContentState: Encodable & Sendable>: Encodable {
    enum CodingKeys: String, CodingKey {
        case timestamp = "timestamp"
        case event = "event"
        case contentState = "content-state"
        case dismissalDate = "dismissal-date"
        case staleDate = "stale-date"
        case attributesType = "attributes-type"
        case relevanceScore = "relevance-score"
        case attributes
        case alert
    }

    var timestamp: Int
    var event: String
    var contentState: ContentState
    var dismissalDate: Int?
    var staleDate: Int?
    var relevanceScore: Int?
    var attributesType: String?
    var attributes: [String: String]?
    var alert: Alert?

    init(
        timestamp: Int,
        event: String,
        contentState: ContentState,
        dismissalDate: Int?,
        staleDate: Int?,
        relevanceScore: Int?,
        attributesType: String?
    ) {
        self.timestamp = timestamp
        self.contentState = contentState
        self.dismissalDate = dismissalDate
        self.staleDate = staleDate
        self.event = event
        self.attributesType = attributesType
        self.attributes = attributesType != nil ? [:] : nil
        self.alert = attributesType != nil ? .init(title: "", body: "") : nil
        self.relevanceScore = relevanceScore
    }
    
    // required for start event
    struct Alert: Encodable {
        let title: String
        let body: String
    }
}
