
// A UIView that shows a speech bubble
@interface SpeechBubbleView : UIView 
{
	NSString* text;
}

// Calculates how big the speech bubble needs to be to fit the specified text
+ (CGSize)sizeForText:(NSString*)text;

// Configures the speech bubble
- (void)setText:(NSString*)text;

@end
