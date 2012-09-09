
#import "SpeechBubbleView.h"

static UIFont* font = nil;
static UIImage* lefthandImage = nil;

const CGFloat VertPadding = 4;       // additional padding around the edges
const CGFloat HorzPadding = 4;

const CGFloat TextLeftMargin = 17;   // insets for the text
const CGFloat TextRightMargin = 15;
const CGFloat TextTopMargin = 10;
const CGFloat TextBottomMargin = 14;

const CGFloat MinBubbleWidth = 100;   // minimum width of the bubble
const CGFloat MinBubbleHeight = 40;  // minimum height of the bubble

const CGFloat WrapWidth = 280;       // maximum width of text in the bubble

@implementation SpeechBubbleView

+ (void)initialize
{
	if (self == [SpeechBubbleView class])
	{
		font = [UIFont systemFontOfSize:[UIFont systemFontSize]];

		lefthandImage = [[UIImage imageNamed:@"imagen_comentario"]
			stretchableImageWithLeftCapWidth:20 topCapHeight:19];
	}
}

+ (CGSize)sizeForText:(NSString*)text
{
	CGSize textSize = [text sizeWithFont:font
		constrainedToSize:CGSizeMake(WrapWidth, 9999)
		lineBreakMode:UILineBreakModeWordWrap];

	CGSize bubbleSize;
	bubbleSize.width = textSize.width + TextLeftMargin + TextRightMargin;
	bubbleSize.height = textSize.height + TextTopMargin + TextBottomMargin;

	if (bubbleSize.width < MinBubbleWidth)
		bubbleSize.width = MinBubbleWidth;

	if (bubbleSize.height < MinBubbleHeight)
		bubbleSize.height = MinBubbleHeight;

	bubbleSize.width += HorzPadding*2;
	bubbleSize.height += VertPadding*2;

	return bubbleSize;
}

- (void)drawRect:(CGRect)rect
{
	[self.backgroundColor setFill];
	UIRectFill(rect);

	CGRect bubbleRect = CGRectInset(self.bounds, VertPadding, HorzPadding);

	CGRect textRect;
	textRect.origin.y = bubbleRect.origin.y + TextTopMargin;
	textRect.size.width = bubbleRect.size.width - TextLeftMargin - TextRightMargin;
	textRect.size.height = bubbleRect.size.height - TextTopMargin - TextBottomMargin;

    [lefthandImage drawInRect:bubbleRect];
	textRect.origin.x = bubbleRect.origin.x + TextLeftMargin;

	[[UIColor blackColor] set];
	[text drawInRect:textRect withFont:font lineBreakMode:UILineBreakModeWordWrap];
}

- (void)setText:(NSString*)newText
{
	text = [newText copy];
	[self setNeedsDisplay];
}

@end
