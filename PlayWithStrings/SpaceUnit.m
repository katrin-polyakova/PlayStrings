//
// Created by Kate Polyakova on 1/15/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "SpaceUnit.h"


@implementation SpaceUnit {

}

- (instancetype)initWithUniqueID:(NSString *)uniqueID {
    self = [super init];
    if (self) {
        NSArray *nameInArray = [uniqueID componentsSeparatedByString:@"."];
        _name = nameInArray[0];
        NSArray *specificationIdInArray = [nameInArray[1] componentsSeparatedByString:@"/"];
        _specificationId = specificationIdInArray[0];
        NSArray *groupNumberInArray = [specificationIdInArray[1] componentsSeparatedByString:@"@"];
        _groupNumber = groupNumberInArray[0];
        NSArray *modelSpecifierInArray = [groupNumberInArray[1] componentsSeparatedByString:@"("];
        _modelSpecifier = modelSpecifierInArray[0];
        NSArray *typeInArray = [modelSpecifierInArray[1] componentsSeparatedByString:@")"];
        _type = typeInArray[0];
//        NSString *type = typeInArray[0];
//        if ( type == @"X") {
//            _type = TypeExperimental;
//        }
//        else if (type == @"Rt") {
//            _type = TypeRealTime;
//        }
//        else if (type == @"M") {
//            _type = TypeModified;
//        }
        NSArray *yearInArray = [typeInArray[1] componentsSeparatedByString:@"#"];
        _year = yearInArray[0];
        _id = yearInArray[1];
    }
    return self;
}

+ (instancetype)unitWithUniqueID:(NSString *)uniqueID {
    return [[self alloc] initWithUniqueID:uniqueID];
}


@end