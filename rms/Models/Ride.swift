//
//  Ride.swift
//  rms
//
//  Created by Artiles, Laura on 10/20/17.
//  Copyright © 2017 Laura Artiles. All rights reserved.
//

import Foundation

struct Ride {
  let description: String?
  let distance: Double
  let duration: String
  let pace: Double
}

// MARK: Fake data

extension Ride {
  init(for day: String) {
    description = "\(day) Morning Ride"
    distance = 30.0
    pace = 15
    duration = "2:00:00"
  }
}

// MARK: Decodable

extension Ride: Decodable {
  private enum CodingKeys: String, CodingKey {
    case description
    case distance
    case duration
    case pace
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    description = try container.decodeIfPresent(String.self, forKey: .description)
    distance = try container.decode(Double.self, forKey: .distance)
    duration = try container.decode(String.self, forKey: .duration)
    pace = try container.decode(Double.self, forKey: .pace)
  }
}
