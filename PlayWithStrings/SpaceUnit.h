//
// Created by Kate Polyakova on 1/15/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SpaceUinitType) {TypeExperimental , TypeRealTime, TypeModified};

@interface SpaceUnit : NSObject

@property (nonatomic, strong) NSString* id;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* specificationId;
@property (nonatomic, strong) NSNumber* groupNumber;
@property (nonatomic, strong) NSString* modelSpecifier;
@property (nonatomic) SpaceUinitType type;
@property (nonatomic) NSUInteger year;
@property (nonatomic, strong) NSString* uniqueID;

- (instancetype)initWithUniqueID:(NSString *)uniqueID;
+ (instancetype)unitWithUniqueID:(NSString *)uniqueID;




@end