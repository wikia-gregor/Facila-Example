//
// Created by Aleksander Balicki on 11/02/14.
// Copyright (c) 2014 Wikia. All rights reserved.
//
//


#import "FEAAboutWikiViewController.h"


@interface FEAAboutWikiViewController ()
@property(nonatomic, strong) NSNumber *wikiId;
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UITextView *textView;
@end

@implementation FEAAboutWikiViewController {

}


- (instancetype)initWithWikiId:(NSNumber *)wikiId {

    self = [super init];
    if (self) {
        self.wikiId = wikiId;
    }

    return self;
}

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)viewDidLoad {
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.imageView];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.textView];

    [self loadData];
}

- (void)loadData {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.wikia.com/api/v1/Wikis/Details?ids=%@", self.wikiId]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *respDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSDictionary *wikiDictionary = respDictionary[self.wikiId];
        self.textView.text = wikiDictionary[@"desc"];
        [self loadImage:wikiDictionary[@"image"]];
    }];
}

- (void)loadImage:(NSString *)imageUrl {
    NSURL *url = [NSURL URLWithString:imageUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.imageView.image = [[UIImage alloc] initWithData:data];
    }];
}

- (void)viewDidLayoutSubviews {

    self.imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, ceilf((2./3.)*self.view.bounds.size.width));
    self.textView.frame = CGRectMake(0, ceilf((2./3.)*self.view.bounds.size.width), self.view.bounds.size.width, ceilf((1./3.)*self.view.bounds.size.width));
}

@end