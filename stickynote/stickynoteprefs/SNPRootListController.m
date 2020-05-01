#include "SNPRootListController.h"

@implementation SNPRootListController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	NSMutableDictionary *preferences = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.gabrielsiu.stickynoteprefs.plist"];
	if (![preferences[@"useCustomNoteColor"] boolValue]) {
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"noteColorCell"]] animated:NO];
	}
	if (![preferences[@"useCustomFontColor"] boolValue]) {
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"fontColorCell"]] animated:NO];
	}
	if (![preferences[@"useCustomAlpha"] boolValue]) {
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"alphaCell"]] animated:NO];
	}
	if (![preferences[@"useCustomDuration"] boolValue]) {
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"durationCell"]] animated:NO];
	}
}

- (void)reloadSpecifiers {
	[super reloadSpecifiers];
	
	NSMutableDictionary *preferences = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.gabrielsiu.stickynoteprefs.plist"];
	if (![preferences[@"useCustomNoteColor"] boolValue]) {
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"noteColorCell"]] animated:NO];
	}
	if (![preferences[@"useCustomFontColor"] boolValue]) {
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"fontColorCell"]] animated:NO];
	}
	if (![preferences[@"useCustomAlpha"] boolValue]) {
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"alphaCell"]] animated:NO];
	}
	if (![preferences[@"useCustomDuration"] boolValue]) {
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[@"durationCell"]] animated:NO];
	}
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];

		NSArray *chosenIDs = @[@"noteColorCell", @"fontColorCell", @"alphaCell", @"durationCell"];
		self.savedSpecifiers = (!self.savedSpecifiers) ? [[NSMutableDictionary alloc] init] : self.savedSpecifiers;
		for (PSSpecifier *specifier in _specifiers) {
			if ([chosenIDs containsObject:[specifier propertyForKey:@"id"]]) {
				[self.savedSpecifiers setObject:specifier forKey:[specifier propertyForKey:@"id"]];
			}
		}
	}

	return _specifiers;
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier {
	[super setPreferenceValue:value specifier:specifier];

	NSString *key = [specifier propertyForKey:@"key"];
	NSString *prevID;
	NSString *chosenID;

	if ([key isEqualToString:@"useCustomNoteColor"]) {
		prevID = @"useCustomNoteColorCell";
		chosenID = @"noteColorCell";
	} else if ([key isEqualToString:@"useCustomFontColor"]) {
		prevID = @"useCustomFontColorCell";
		chosenID = @"fontColorCell";
	} else if ([key isEqualToString:@"useCustomAlpha"]) {
		prevID = @"useCustomAlphaCell";
		chosenID = @"alphaCell";
	} else if ([key isEqualToString:@"useCustomDuration"]) {
		prevID = @"useCustomDurationCell";
		chosenID = @"durationCell";
	} else {
		return;
	}

	if (![value boolValue]) {
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[chosenID]] animated:YES];
	} else if (![self containsSpecifier:self.savedSpecifiers[chosenID]]) {
		[self insertContiguousSpecifiers:@[self.savedSpecifiers[chosenID]] afterSpecifierID:prevID animated:YES];
	}
}

# pragma mark - Actions

- (void)openTwitter {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/gabrielsiu_dev"] options:@{} completionHandler:nil];
}

@end
