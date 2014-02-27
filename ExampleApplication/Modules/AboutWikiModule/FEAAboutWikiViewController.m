//
// Created by Aleksander Balicki on 11/02/14.
// Copyright (c) 2014 Wikia. All rights reserved.
//
//


#import "FEAAboutWikiViewController.h"
#import "FEAAppDelegate.h"

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
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectZero];
    self.textView.editable = NO;
    [self.view addSubview:self.textView];

    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.imageView addGestureRecognizer:tapGestureRecognizer];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareAction:)];

    [self loadData];
}

- (void)shareAction:(id)shareAction {
    [((FEAAppDelegate *) [UIApplication sharedApplication].delegate).dispatcher callAction:@"share" withParams:self.wikiaDict];
}

- (void)tapAction:(id)tapAction {
    [((FEAAppDelegate *) [UIApplication sharedApplication].delegate).dispatcher callAction:@"openWiki" withParams:@{@"url":self.wikiaDict[@"domain"]}];
}

- (void)loadData {
    self.textView.text = self.wikiaDict[@"desc"];

    NSURL *url = [NSURL URLWithString:self.wikiaDict[@"image"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.imageView.image = [[UIImage alloc] initWithData:data];
    }];
}

- (void)viewDidLayoutSubviews {

    self.imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, ceilf((2./3.)*self.view.bounds.size.height));
    self.textView.frame = CGRectMake(0, ceilf((2./3.)*self.view.bounds.size.height), self.view.bounds.size.width, ceilf((1./3.)*self.view.bounds.size.height));
}

@end