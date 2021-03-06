//
//  DSTransactionEntity+CoreDataProperties.h
//  
//
//  Created by Sam Westrich on 5/20/18.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "DSTransactionEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DSTransactionEntity (CoreDataProperties)

+ (NSFetchRequest<DSTransactionEntity *> *)fetchRequest;

@property (nonatomic, retain) NSOrderedSet<DSTxInputEntity *> *inputs;
@property (nonatomic, retain) NSOrderedSet<DSTxOutputEntity *> *outputs;
@property (nonatomic) int32_t lockTime;
@property (nonatomic, retain) DSShapeshiftEntity *associatedShapeshift;
@property (nonatomic, retain) DSChainEntity *chain;
@property (nonatomic, retain) DSTransactionHashEntity * transactionHash;
@property (nonatomic, retain) DSInstantSendLockEntity * instantSendLock;

@end

@interface DSTransactionEntity (CoreDataGeneratedAccessors)

- (void)insertObject:(DSTxInputEntity *)value inInputsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromInputsAtIndex:(NSUInteger)idx;
- (void)insertInputs:(NSArray<DSTxInputEntity *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeInputsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInInputsAtIndex:(NSUInteger)idx withObject:(DSTxInputEntity *)value;
- (void)replaceInputsAtIndexes:(NSIndexSet *)indexes withInputs:(NSArray<DSTxInputEntity *> *)values;
- (void)addInputsObject:(DSTxInputEntity *)value;
- (void)removeInputsObject:(DSTxInputEntity *)value;
- (void)addInputs:(NSOrderedSet<DSTxInputEntity *> *)values;
- (void)removeInputs:(NSOrderedSet<DSTxInputEntity *> *)values;

- (void)insertObject:(DSTxOutputEntity *)value inOutputsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromOutputsAtIndex:(NSUInteger)idx;
- (void)insertOutputs:(NSArray<DSTxOutputEntity *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeOutputsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInOutputsAtIndex:(NSUInteger)idx withObject:(DSTxOutputEntity *)value;
- (void)replaceOutputsAtIndexes:(NSIndexSet *)indexes withOutputs:(NSArray<DSTxOutputEntity *> *)values;
- (void)addOutputsObject:(DSTxOutputEntity *)value;
- (void)removeOutputsObject:(DSTxOutputEntity *)value;
- (void)addOutputs:(NSOrderedSet<DSTxOutputEntity *> *)values;
- (void)removeOutputs:(NSOrderedSet<DSTxOutputEntity *> *)values;

@end

NS_ASSUME_NONNULL_END
