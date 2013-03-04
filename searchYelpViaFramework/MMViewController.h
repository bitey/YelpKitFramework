//
//  MMViewController.h
//  searchYelpViaFramework
//
//  Created by StopBitingMe on 3/2/13.
//  Copyright (c) 2013 StopBitingMe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YelpKit/YelpKit.h>
#import "APICredentials.h"
@interface MMViewController : UIViewController

- (IBAction)searchButtonPressed:(id)sender;
- (void)connectToYelp:(NSString*)urlString;

@end
