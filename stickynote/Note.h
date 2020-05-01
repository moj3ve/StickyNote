@interface Note : UIView {
    UIButton *clearButton;
    UITextView *textView;
    NSMutableDictionary *defaults;
}

- (id)initWithFrame:(CGRect)frame defaults:(NSMutableDictionary *)defaultsDict;

@end