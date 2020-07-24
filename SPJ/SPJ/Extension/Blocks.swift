//
//  Blocks.swift
//  SPJExtensions
//
//  Created by Shine memala on 19/06/2020.
//  Copyright © 2020 Spectrone. All rights reserved.
//

import Foundation

public typealias ArrayBlock = (_ responseObject: [NSDictionary]?) -> Void
public typealias DictBlock = (_ responseObject: NSDictionary?) -> Void
public typealias ErrorBlock = (_ error: NSError?) -> Void
public typealias BoolBlock = (_ status: Bool?) -> Void
public typealias StringBlock = (_ response: String) -> Void
public typealias SuccessBlock = () -> Void
public typealias ErrorBlockWithId = (_ response: String?, _ id: Int) -> Void
public typealias IntBlock = ( _ id: Int) -> Void
