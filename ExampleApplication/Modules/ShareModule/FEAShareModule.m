//
// Created by Aleksander Balicki on 12/02/14.
// Copyright (c) 2014 Wikia. All rights reserved.
//
//


#import "FEAShareModule.h"


@implementation FEAShareModule {

}


- (void)registerActions:(FacilaDispatcher *)registrationDispatcher {

    [registrationDispatcher registerAction:@"share"
                                 withBlock:^(NSDictionary *params, FacilaDispatcher *dispatcher) {

                                     NSArray *items = @[params[@"domain"], params[@"name"]];
                                     UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];

                                     [dispatcher.layout presentViewController:activityViewController animated:YES completion:nil];
                                 }];
}
@end