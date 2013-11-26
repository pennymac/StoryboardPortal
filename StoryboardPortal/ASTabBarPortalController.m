//
//  PMTabBarPortalController.m
//  StoryboardPortal
//
//  Created by Daniel Dyba on 10/30/13.
//  Copyright (c) 2013 Aperture Science. All rights reserved.
//

#import "ASTabBarPortalController.h"

@interface ASTabBarPortalController ()

@property (nonatomic, strong) UITabBarController *destinationViewController;

@end

@implementation ASTabBarPortalController

- (void)awakeFromNib {
    [super awakeFromNib];

    [self validatePresenceOfStoryboardName];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:self.storyboardName
                                                         bundle:nil];
    UITabBarController *controller = [storyboard instantiateInitialViewController];
    self.destinationViewController = controller;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addChildViewController:self.destinationViewController];
    [self.view addSubview:self.destinationViewController.view];
    [self.destinationViewController didMoveToParentViewController:self];

    [self validateTabIndex];

    self.destinationViewController.selectedIndex = _selectedTabIndex;
}

# pragma mark - Validations

- (void)validateTabIndex {
    if (!_selectedTabIndex) _selectedTabIndex = 0;

    BOOL hasValidTabIndex = _selectedTabIndex < [_destinationViewController.viewControllers count] && _selectedTabIndex >= 0;

    NSAssert(hasValidTabIndex,
             @"The selectedTabIndex runtime attribute must be an integer that is "
             @"0 or one less than the number of viewControllers in the destination "
             @"TabBarController");
}

- (void)validatePresenceOfStoryboardName {
    NSAssert([self.storyboardName length],
             @"The storyboardName runtime attribute must be defined.");
}

@end
