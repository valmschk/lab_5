#import "ArrayProcessor.h"

@interface ArrayProcessor ()
- (void)printArray:(NSArray *)array withTitle:(NSString *)title;
@end

@implementation ArrayProcessor

- (void)printArray:(NSArray *)array withTitle:(NSString *)title {
    NSLog(@"--- %@ (ЭЛЕМЕНТОВ: %lu) ---", title, (unsigned long)[array count]);
    NSLog(@"%@", array);
}

- (void)executeArrayOperations {
    NSArray *immutableNumbers = @[@11, @13, @15, @17, @19, @21, @23, @25, @27, @29, @31, @33, @35, @37, @39];
    [self printArray:immutableNumbers withTitle:@"НЕИЗМЕНЯЕМЫЙ МАССИВ (ВАРИАНТ 33)"];

    NSMutableArray *mutableArray = [NSMutableArray array];
    
    [mutableArray addObject:@"ЯБЛОКО"];
    [mutableArray addObject:@"БАНАН"];
    [mutableArray addObject:@"ГРУША"];
    [self printArray:mutableArray withTitle:@"МАССИВ ПОСЛЕ ДОБАВЛЕНИЯ"];

    [mutableArray insertObject:@"АПЕЛЬСИН" atIndex:0];
    [self printArray:mutableArray withTitle:@"ПОСЛЕ ВСТАВКИ ПО ИНДЕКСУ 0"];

    [mutableArray removeLastObject];
    [self printArray:mutableArray withTitle:@"ПОСЛЕ УДАЛЕНИЯ ПОСЛЕДНЕГО"];

    if ([mutableArray count] > 1) {
        [mutableArray removeObjectAtIndex:1];
    }
    [self printArray:mutableArray withTitle:@"ПОСЛЕ УДАЛЕНИЯ ПО ИНДЕКСУ 1"];

    [mutableArray removeAllObjects];
    [self printArray:mutableArray withTitle:@"ПОСЛЕ УДАЛЕНИЯ ВСЕХ ЭЛЕМЕНТОВ"];
}

@end