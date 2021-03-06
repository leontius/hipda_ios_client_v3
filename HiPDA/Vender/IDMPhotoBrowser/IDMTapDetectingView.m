//
//  IDMTapDetectingView.m
//  IDMPhotoBrowser
//
//  Created by Michael Waterfall on 04/11/2009.
//  Copyright 2009 d3i. All rights reserved.
//

#import "IDMTapDetectingView.h"

@implementation IDMTapDetectingView

- (id)init {
	if ((self = [super init])) {
		self.userInteractionEnabled = YES;
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		self.userInteractionEnabled = YES;
	}
	return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	NSUInteger tapCount = touch.tapCount;
	switch (tapCount) {
		case 1:
			[self handleSingleTap:touch];
			break;
		case 2:
			[self handleDoubleTap:touch];
			break;
		case 3:
			[self handleTripleTap:touch];
			break;
		default:
			break;
	}
	[[self nextResponder] touchesEnded:touches withEvent:event];
}

- (void)handleSingleTap:(UITouch *)touch {
	if ([self.tapDelegate respondsToSelector:@selector(view:singleTapDetected:)])
		[self.tapDelegate view:self singleTapDetected:touch];
}

- (void)handleDoubleTap:(UITouch *)touch {
	if ([self.tapDelegate respondsToSelector:@selector(view:doubleTapDetected:)])
		[self.tapDelegate view:self doubleTapDetected:touch];
}

- (void)handleTripleTap:(UITouch *)touch {
	if ([self.tapDelegate respondsToSelector:@selector(view:tripleTapDetected:)])
		[self.tapDelegate view:self tripleTapDetected:touch];
}
- (void)dealloc
{
    
}
@end
