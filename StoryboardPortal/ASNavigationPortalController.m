//
//  ASNavigationPortalController.m
//  StoryboardPortal
//
//  Created by Daniel Dyba on 10/31/13.
//  Copyright (c) 2013 Aperture Science. All rights reserved.
//

#import "ASNavigationPortalController.h"

@interface ASNavigationPortalController ()

@property (nonatomic, strong) UIViewController *destinationViewController;

@end

@implementation ASNavigationPortalController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self validatePresenceOfStoryboardName];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:self.storyboardName
                                                         bundle:nil];
    UIViewController *controller = [storyboard instantiateInitialViewController];
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

@end
