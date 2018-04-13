//
//  Rider.swift
//  rms
//
//  Created by Artiles, Laura on 10/20/17.
//  Copyright © 2017 Laura Artiles. All rights reserved.
//

import Foundation

struct Rider {
  let name: String
  let route: String
  let year: String
  let totalMiles: Double
}

// MARK: Fake data

extension Rider {
  init(named name: String, route: String) {
    self.name = name
    self.route = route
    year = "2018"
    totalMiles = 1239.0
  }
}

// MARK: Decodable

extension Rider: Decodable {
  private enum CodingKeys: String, CodingKey {
    case name
    case route
    case year
    case totalMiles
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
    route = try container.decode(String.self, forKey: .route)
    year = try container.decode(String.self, forKey: .year)
    totalMiles = try container.decode(Double.self, forKey: .totalMiles)
  }
}
