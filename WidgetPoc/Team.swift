import Foundation

public struct Team {
  public let emoji: String
  public let name: String
  public let description: String
}

extension Team: Identifiable {
  public var id: String {
    name
  }
}
