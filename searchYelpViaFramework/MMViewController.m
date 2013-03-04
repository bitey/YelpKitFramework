//
//  MMViewController.m
//  searchYelpViaFramework
//
//  Created by StopBitingMe on 3/2/13.
//  Copyright (c) 2013 StopBitingMe. All rights reserved.
//

//THINGS TO DO
//Create a new class that will store all business information
//Make a CLLocationManager - He will be talking to Location Services
//Display the results in a view
//Possibly Display the results on a map

//Questions
//How do you display dataDictionary outside the block?

#import "MMViewController.h"
#import <MapKit/MapKit.h>


@interface MMViewController ()
{
    IBOutlet UITextField *searchFieldTextField;
    IBOutlet UILabel *businessNameOutlet;
    IBOutlet UILabel *addressOutlet;
    
}
@property (strong, nonatomic) APICredentials *credentials;
@property (strong, nonatomic) NSDictionary *dataDictionary;

@end

@implementation MMViewController
@synthesize credentials;
@synthesize dataDictionary;



- (void)viewDidLoad
{
    [super viewDidLoad];
    credentials = [[APICredentials alloc]init];
    dataDictionary = [[NSDictionary alloc]init];
    credentials.ywsid = @"0mtAebqxwAxzHVOPI_OIyQ";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButtonPressed:(id)sender
{
    NSString *searchString = searchFieldTextField.text;
    NSString *urlString = [NSString stringWithFormat:@"http://api.yelp.com/business_review_search?term=%@&ywsid=%@&&tl_lat=37.9&tl_long=-122.5&br_lat=37.788022&br_long=-122.399797", searchString, self.credentials.ywsid];
    [self connectToYelp:urlString];
}

-(void)connectToYelp:(NSString*)urlString
{
    YKURL *apiURL = [[YKURL alloc]initWithURLString:urlString];
    
    [YKJSONRequest requestWithURL:apiURL
                      finishBlock:^void (id obj)
                                  {
                                      dataDictionary = (NSDictionary*) obj;
                                      businessNameOutlet.text = [[[dataDictionary objectForKey:@"businesses"] objectAtIndex:0]objectForKey:@"name"];
                                      addressOutlet.text = [[[dataDictionary objectForKey:@"businesses"] objectAtIndex:0]objectForKey:@"address1"];
                                  }
                        failBlock:^void (YKHTTPError *anotherError)
                                  {
                                      
                                  }];
    NSLog(@"%@", dataDictionary);
    
}

@end
