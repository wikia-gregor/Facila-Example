//
// Created by Aleksander Balicki on 12/02/14.
// Copyright (c) 2014 Wikia. All rights reserved.
//
//


#import "FEAAboutWikiModule.h"
#import "FEAAboutWikiViewController.h"

NSString *const openAboutWikiURL = @"openAboutWiki";

@implementation FEAAboutWikiModule {

}


- (void)registerActions:(FacilaDispatcher *)registrationDispatcher {

    [registrationDispatcher registerAction:openAboutWikiURL
                                 withBlock:^(NSDictionary *params, FacilaDispatcher *dispatcher) {

        [dispatcher.layout pushViewController:[[FEAAboutWikiViewController alloc] initWithWikiId:params[@"id"]] animated:YES];

    }];
}

- (void)handleAction:(NSString *)actionName params:(NSDictionary *)params {

}

@end