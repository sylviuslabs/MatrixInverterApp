#import <Foundation/Foundation.h>
#import "MatrixElement.h"
#import "MatrixElementView.h"

@interface MatrixElementPresenter : NSObject <MatrixElementInputChangeObserver>

- (instancetype)initWithModel:(id <MatrixElement>)model view:(id <MatrixElementView>)view;

@end
