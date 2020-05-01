#include "SNPAcknowledgementsController.h"

@implementation SNPAcknowledgementsController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Acknowledgements" target:self];
	}

	return _specifiers;
}

# pragma mark - Actions

- (void)openTweak {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/wvabrinskas"] options:@{} completionHandler:nil];
}

- (void)openTwitter {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/wvabrinskas"] options:@{} completionHandler:nil];
}

@end
