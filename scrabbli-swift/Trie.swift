//
//  Trie.swift
//  scrabbli-swift
//
//  Created by Kristen Mills on 7/29/14.
//  Copyright (c) 2014 Kristen Mills. All rights reserved.
//

import Foundation

class Trie {

  var root: TrieNode

  init() {
    self.root = TrieNode(value: nil)
  }

  func add(#word: String) {
    var node = root

    for char in word {
      if let temp = node.walk(char) {
        node = temp
      } else {
        node.children[char] = TrieNode(value: char)
        node = node.walk(char)!
      }
    }
    node.terminal = true
  }

  func delete(#word: String) {
    var node = root

    for char in word {
      if let temp = node.walk(char) {
        node = temp
      } else {
        return
      }
    }
    node.terminal = false
  }

  func isWord(word: String) -> Bool {
    var node = root

    for char in word {
      if let temp = node.walk(char) {
        node = temp
      } else {
        return false
      }
    }
    return node.terminal
  }
}