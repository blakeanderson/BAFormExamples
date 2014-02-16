//
//  BATextField.m
//  SimpleForm
//
//  Created by Blake on 10/27/13.
//  Copyright (c) 2013 BlakeAnderson. All rights reserved.
//

#import "BATextField.h"

@implementation BATextField

- (id)initWithFrame:(CGRect)frame
{
	return [self initWithFrame:frame withPlaceholderText:@""];
}

- (id)initWithFrame:(CGRect)frame withPlaceholderText:(NSString*)text
{
	self = [super initWithFrame:frame];
	if (self) {
		self.keyboardType = UIKeyboardTypeAlphabet;
		self.autocapitalizationType = UITextAutocapitalizationTypeNone;
		self.autocorrectionType = UITextAutocorrectionTypeNo;
		self.textColor = [UIColor blackColor];
		self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
		self.returnKeyType = UIReturnKeyNext;
		self.placeholder = text;
		
		NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:18], NSForegroundColorAttributeName : [UIColor lightGrayColor]};
		
		self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:text attributes:attributes];
	}
	return self;
}

@end
