//
//  PlayWithStringsTests.m
//  PlayWithStringsTests
//
//  Created by Kate Polyakova on 1/15/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "SpaceUnit.h"

@interface PlayWithStringsTests : XCTestCase

@end

@implementation PlayWithStringsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testParseCorrectData01 {

    NSString * string = @"quest.i502/17@M-22(X)2012#18297236";
    SpaceUnit* unit = [[SpaceUnit alloc] initWithUniqueID: string];

    XCTAssertNotNil(unit, "Correct data %@ should be successful parsed", string);

    NSLog(@"%@", unit.id);
    NSLog(@"%@", unit.name);
    NSLog(@"%@", unit.specificationId);
    NSLog(@"%@", unit.groupNumber);
    NSLog(@"%@", unit.modelSpecifier);
    NSLog(@"%@", unit.type);
    NSLog(@"%@", unit.year);

    XCTAssertTrue([@"18297236" isEqualToString: unit.id]);
    XCTAssertTrue([@"quest" isEqualToString: unit.name]);
    XCTAssertTrue(unit.year==2012);
    XCTAssertTrue([@"i502" isEqualToString: unit.specificationId]);
    XCTAssertTrue([@(17) isEqualToNumber: unit.groupNumber]);
    XCTAssertTrue([@"M-22" isEqualToString: unit.modelSpecifier]);
    XCTAssertTrue(unit.type==TypeExperimental);

}

-(void) testPrint {
    NSString * string = @"quest.i502/17@M-22(X)2012#18297236";
    //NSString * string =@"liga.b22/1024@L-01(Rt)2015#18297235";
    //NSString * string =@"east.i504/2@ML-26(M)2014#18297232";

    NSArray *nameInArray = [string componentsSeparatedByString:@"."];
    NSLog(@"%@", nameInArray[0]);

    NSArray *specificationIdInArray = [nameInArray[1] componentsSeparatedByString:@"/"];
    NSLog(@"%@", specificationIdInArray[0]);

    NSArray *groupNumberInArray = [specificationIdInArray[1] componentsSeparatedByString:@"@"];
    NSLog(@"%@", groupNumberInArray[0]);

    NSArray *modelSpecifierInArray = [groupNumberInArray[1] componentsSeparatedByString:@"("];
    NSLog(@"%@", modelSpecifierInArray[0]);

    NSArray *typeInArray = [modelSpecifierInArray[1] componentsSeparatedByString:@")"];
    NSLog(@"%@", typeInArray[0]);

    NSArray *yearInArray = [typeInArray[1] componentsSeparatedByString:@"#"];
    NSLog(@"%@", yearInArray[0]);
    NSLog(@"%@", yearInArray[1]);

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
