//
// Created by Aleksander Balicki on 12/02/14.
// Copyright (c) 2014 Wikia. All rights reserved.
//
//


#import "FEAOpenWikiSafariModule.h"


@implementation FEAOpenWikiSafariModule {

}

- (void)registerActions:(FacilaDispatcher *)dispatcher {

    [dispatcher registerAction:@"openWiki" withBlock:^(NSDictionary *params, FacilaDispatcher *dispatcher) {
        NSString *string = params[@"url"];

        if (![string hasPrefix:@"http"]) {
            string = [NSString stringWithFormat:@"http://%@", string];
        }

        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
    }];
}

@end