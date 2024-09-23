# Example code for FB15241823

An editable TextKit 2 backed UITextView is unusable for large documents because selection/caret positioning behaviour is incorrect. The user will tap a word to begin editing, but the caret will be shown in an undefined location, often dozens of paragraphs below the selected content. 

To reproduce:
1. Create a UITextView backed by a standard TextKit 2 stack and a large amount of text (50,000+ words)
2. Scroll quickly through the text view (at least 20% of the way down)
3. Tap once to select a position in the document.

Expected:
The caret appears at the location the user tapped, and UITextView.selectedRange is the range of the text at the location of the tap. This is the behaviour of TextKit 1 based UITextViews.

Actual:
The caret is positioned in an undefined location, and the selectedRange is different to the range at the location of the tap, often completely off-screen and with selectedRange.location off by several thousand. There is no pattern to this magnitude of the discrepancy. 

This incorrect behaviour occurs consistently in the sample project on the simulator, but you may need to hide the keyboard by pulling down, then repeat steps 2-3 a few times. This happens on iPhone and iPad, and on iOS 17, 18, and 18.1. 

Why this is important:
With the upcoming launch of Apple Intelligence and Writing Tools, developers creating text editing apps have been forced to migrate to TextKit 2. We migrated our app to TextKit 2 and immediately received numerous complaints about this incorrect selection behaviour and were forced to revert to TextKit 1. This means we can't provide Writing Tools support to our users.
