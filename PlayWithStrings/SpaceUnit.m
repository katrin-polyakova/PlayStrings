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
        _groupNumber = @([groupNumberInArray[0] intValue]);
        NSArray *modelSpecifierInArray = [groupNumberInArray[1] componentsSeparatedByString:@"("];
        _modelSpecifier = modelSpecifierInArray[0];
        NSArray *typeInArray = [modelSpecifierInArray[1] componentsSeparatedByString:@")"];
        //_type = typeInArray[0];
        NSString *type = typeInArray[0];
        if ([@"X" isEqualToString:type]) {
            _type = TypeExperimental;    }
        else if ([@"Rt" isEqualToString:type]) {
            _type = TypeRealTime;              }
        else if ([@"M" isEqualToString:type]) {
            _type = TypeModified;             }
        NSArray *yearInArray = [typeInArray[1] componentsSeparatedByString:@"#"];
        _year = (NSUInteger) [yearInArray[0] intValue];
        _id = yearInArray[1];
    }
    if (self.name && self.id && self.specificationId && self.groupNumber && self.modelSpecifier && self.type && self.year) {
        return self;
    }
    return nil;
}

+ (instancetype)unitWithUniqueID:(NSString *)uniqueID {
    return [[self alloc] initWithUniqueID:uniqueID];
}


@end