//
//  APICredentials.h
//  searchYelpViaFramework
//
//  Created by StopBitingMe on 3/2/13.
//  Copyright (c) 2013 StopBitingMe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APICredentials : NSObject
@property (strong, nonatomic) NSString *ywsid;
@property (strong, nonatomic) NSString *consumerKey;
@property (strong, nonatomic) NSString *consumerSecret;
@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) NSString *tokenSecret;


@end


