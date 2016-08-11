//
//  PersonalTailor.m
//  GJYBlockMovementColletionView
//
//  Created by GJYipode on 16/8/11.
//  Copyright © 2016年 GJYipode. All rights reserved.
//

#import "PersonalTailor.h"
#import <objc/runtime.h>

@implementation PersonalTailor

#pragma  mark - runtime
//  获取相应的数据
+ (instancetype) personalModelWithDict: (NSDictionary *) dict{
    
    id obj = [[self alloc] init];
    
    NSArray *properties = [self loadProperties];
    
    for (NSString *key in properties) {
        if (dict[key]) {
            [obj setValue:dict[key] forKey:key];
        }
    }
    return obj;
}

+(NSArray *) loadProperties{
    unsigned int count = 0;
    ///  返回值是所有属性的数组
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; ++i) {
        //        从数据中获取属性
        objc_property_t pty = properties[i];
        //        拿到属性
        const char *cname = property_getName(pty);
        [arrayM addObject:[NSString stringWithUTF8String:cname]];
    }
    //    释放属性数组
    free(properties);
    
    return arrayM;
    
}

static PersonalTailor * _instance = nil;

+ (instancetype)detailListModel{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init] ;
    }) ;
    
    return _instance ;
    
}

@end
