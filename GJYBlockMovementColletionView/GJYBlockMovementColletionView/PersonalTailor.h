//
//  PersonalTailor.h
//  GJYBlockMovementColletionView
//
//  Created by GJYipode on 16/8/11.
//  Copyright © 2016年 GJYipode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonalTailor : NSObject

@property (nonatomic , strong) NSArray *nav;

@property (nonatomic , strong) NSArray *prefer;

+ (instancetype) personalModelWithDict: (NSDictionary *) dict;
@end
