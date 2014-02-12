//
//  FEAAppDelegate.h
//  ExampleApplication
//
//  Created by Gregor on 16.01.2014.
//  Copyright (c) 2014 Wikia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FacilaDispatcher;

@interface FEAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) FacilaDispatcher *dispatcher;

@end
