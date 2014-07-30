//
//  TrieNode.swift
//  scrabbli-swift
//
//  Created by Kristen Mills on 7/29/14.
//  Copyright (c) 2014 Kristen Mills. All rights reserved.
//

import Foundation

class TrieNode {

  var value: Character
  var children: [Character: TrieNode]
  var terminal: Bool

  init(value: Character) {
    self.value = value
    self.children = [:]
    self.terminal = false
  }

  func walk(value: Character) -> TrieNode? {
    if let child = children[value] {
      return children[value]
    } else {
      return nil
    }
  }

  func isLeaf() -> Bool {
    return children.isEmpty
  }

}

// Stupid way to make characters Hashable
extension Character: Hashable {
  public var hashValue: Int {
  return String(self).hashValue
  }
}