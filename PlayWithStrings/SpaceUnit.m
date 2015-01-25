//
// Created by Kate Polyakova on 1/15/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "SpaceUnit.h"


@implementation SpaceUnit {

}

//- (instancetype)initWithUniqueId:(NSString *)uniqueID {
//    self = [super init];
//    if (self) {
//        NSArray *nameInArray = [uniqueID componentsSeparatedByString:@"."];
//        _name = nameInArray[0];
//        NSArray *specificationIdInArray = [nameInArray[1] componentsSeparatedByString:@"/"];
//        _specificationId = specificationIdInArray[0];
//        NSArray *groupNumberInArray = [specificationIdInArray[1] componentsSeparatedByString:@"@"];
//        _groupNumber = @([groupNumberInArray[0] intValue]);
//        NSArray *modelSpecifierInArray = [groupNumberInArray[1] componentsSeparatedByString:@"("];
//        _modelSpecifier = modelSpecifierInArray[0];
//        NSArray *typeInArray = [modelSpecifierInArray[1] componentsSeparatedByString:@")"];
//        //_type = typeInArray[0];
//        NSString *type = typeInArray[0];
//        if ([@"X" isEqualToString:type]) {
//            _type = TypeExperimental;    }
//        else if ([@"Rt" isEqualToString:type]) {
//            _type = TypeRealTime;              }
//        else if ([@"M" isEqualToString:type]) {
//            _type = TypeModified;             }
//        NSArray *yearInArray = [typeInArray[1] componentsSeparatedByString:@"#"];
//        _year = (NSUInteger) [yearInArray[0] intValue];
//        _id = yearInArray[1];
//    }
//    return self;
//}
//
//+ (instancetype)unitWithUniqueId:(NSString *)uniqueID {
//    return [[self alloc] initWithUniqueID:uniqueID];
//}


// name.specificationId/groupNumber@modelSpecifier(type)year#id;
- (id)initWithUniqueId: (NSString*) string{
    self = [super init];
    if (self){
        self = [[self class] parseSpaceUnitFromId: string];
    }
    return self;    
}

+ (instancetype)parseSpaceUnitFromId: (NSString*) string {

    if (!string) {
        return nil;
    }

    SpaceUnit *result = [[SpaceUnit alloc] init];

    // parse name
    NSRange rangeOfDot = [string rangeOfString:@"."];

    if (rangeOfDot.location != NSNotFound) {
        result.name = [string substringToIndex:rangeOfDot.location];
    }

    //parse specificationId
    NSRange rangeOfSlash = [string rangeOfString:@"/"];

    if (rangeOfDot.location != NSNotFound && rangeOfSlash.location != NSNotFound && rangeOfDot.location < rangeOfSlash.location) {
        NSUInteger len = rangeOfSlash.location - rangeOfDot.location - 1;
        NSRange specificationIdRange = NSMakeRange(rangeOfDot.location + 1, len);
        result.specificationId = [string substringWithRange:specificationIdRange];
    }

    // parse groupNumber
    NSRange rangeOfAtt = [string rangeOfString:@"@"];

    if (rangeOfSlash.location != NSNotFound && rangeOfAtt.location != NSNotFound && rangeOfSlash.location < rangeOfAtt.location) {
        NSUInteger len = rangeOfAtt.location - rangeOfSlash.location - 1;
        NSRange groupRange = NSMakeRange(rangeOfSlash.location + 1, len);
        NSString *groupNumberAsString = [string substringWithRange:groupRange];
        result.groupNumber = @([groupNumberAsString intValue]);
        //      аналогично result.groupNumber = [NSNumber numberWithInt:[groupNumberAsString intValue]];
    }

    //parse modelSpecifier
    NSRange rangeOfOpen = [string rangeOfString:@"("];

    if (rangeOfAtt.location != NSNotFound && rangeOfOpen.location != NSNotFound && rangeOfAtt.location < rangeOfOpen.location) {
        NSUInteger len = rangeOfOpen.location - rangeOfAtt.location - 1;
        NSRange modelSpecifierRange = NSMakeRange(rangeOfAtt.location + 1, len);
        result.modelSpecifier = [string substringWithRange:modelSpecifierRange];
    }

    // parse type
    NSRange rangeOfClose = [string rangeOfString:@")"];

    if (rangeOfOpen.location != NSNotFound && rangeOfClose.location != NSNotFound && rangeOfOpen.location < rangeOfClose.location) {
        NSUInteger len = rangeOfClose.location - rangeOfOpen.location - 1;
        NSRange typeRange = NSMakeRange(rangeOfOpen.location + 1, len);
        NSString *typeAsString = [string substringWithRange:typeRange];
        if ([@"X" isEqualToString:typeAsString]) {
            result.type = TypeExperimental;
        } else if ([@"Rt" isEqualToString:typeAsString]) {
            result.type = TypeRealTime;
        } else if ([@"M" isEqualToString:typeAsString]) {
            result.type = TypeModified;
        }
     }

    // parse year
    NSRange rangeOfSharp = [string rangeOfString:@"#"];

    if (rangeOfClose.location != NSNotFound && rangeOfSharp.location != NSNotFound && rangeOfClose.location < rangeOfSharp.location) {
        NSUInteger len = rangeOfSharp.location - rangeOfClose.location - 1;
        NSRange year = NSMakeRange(rangeOfClose.location + 1, len);
        NSString *yearAsString = [string substringWithRange:year];
        result.year = (NSUInteger) [yearAsString intValue];
    }

    // parse id
    if (rangeOfSharp.location != NSNotFound) {
        result.id = [string substringFromIndex:rangeOfSharp.location + 1];
    }

//    if (result.name && result.specificationId && result.groupNumber && result.modelSpecifier && result.type && result.year && result.id) {
//        return result;
//    }

    return result;
}

@end

