//
// Created by Aleksander Balicki on 13/02/14.
// Copyright (c) 2014 Wikia. All rights reserved.
//
//


#import "FEAOpenWikiWebviewModule.h"
#import "FEAOpenWikiWebviewViewController.h"


@implementation FEAOpenWikiWebviewModule {

}

- (void)registerActions:(FacilaDispatcher *)dispatcher {

    [dispatcher registerAction:@"openWiki" withBlock:^(NSDictionary *params, FacilaDispatcher *dispatcher) {
        NSString *string = params[@"url"];

        if (![string hasPrefix:@"http"]) {
            string = [NSString stringWithFormat:@"http://%@", string];
        }

        FEAOpenWikiWebviewViewController *controller = [[FEAOpenWikiWebviewViewController alloc] initWithURL:string];
        [dispatcher.layout pushViewController:controller animated:YES];
    }];
}
@end