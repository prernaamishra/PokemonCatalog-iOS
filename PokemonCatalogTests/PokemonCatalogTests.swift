//
//  PokemonCatalogTests.swift
//  PokemonCatalogTests
//
//  Created by Prerna Mishra on 10/20/20.
//  Copyright © 2020 Prerna Mishra. All rights reserved.
//

import XCTest
@testable import PokemonCatalog

class PokemonCatalogTests: XCTestCase {
    var sut: URLSession!

    override func setUp() {
      super.setUp()
      sut = URLSession(configuration: .default)
    }

    override func tearDown() {
      sut = nil
      super.tearDown()
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToiTunesGetsHTTPStatusCode200() {
      // given
      let url =
        URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
      // 1
      let promise = expectation(description: "Status code: 200")

      // when
      let dataTask = sut.dataTask(with: url!) { data, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            // 2
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      // 3
      wait(for: [promise], timeout: 5)
    }

}
