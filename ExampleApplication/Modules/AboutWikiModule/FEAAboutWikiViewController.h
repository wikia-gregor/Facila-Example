//
// Created by Aleksander Balicki on 11/02/14.
// Copyright (c) 2014 Wikia. All rights reserved.
//
//


#import <Foundation/Foundation.h>


@interface FEAAboutWikiViewController : UIViewController
@property(nonatomic, strong) NSDictionary *wikiaDict;

- (instancetype)initWithWikiId:(NSNumber *)wikiId;
@end