//
//  ASPortalController.m
//  StoryboardPortal
//
//  Created by Daniel Dyba on 10/31/13.
//  Copyright (c) 2013 Aperture Science. All rights reserved.
//

#import "ASPortalController.h"

@interface ASPortalController ()

@property (nonatomic, strong) UINavigationController *destinationViewController;

@end

@implementation ASPortalController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self validatePresenceOfStoryboardName];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:self.storyboardName
                                                         bundle:nil];
    UINavigationController *controller = [storyboard instantiateInitialViewController];
    self.destinationViewController = controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addChildViewController:self.destinationViewController];
    [self.view addSubview:self.destinationViewController.view];
    [self.destinationViewController didMoveToParentViewController:self];
}

# pragma mark - Validations

- (void)validatePresenceOfStoryboardName {
    NSAssert([self.storyboardName length],
             @"The storyboardName runtime attribute must be defined.");
}

- (void)returnThroughPortal {
    NSLog(@"Going through the portal now...");
}

@end
