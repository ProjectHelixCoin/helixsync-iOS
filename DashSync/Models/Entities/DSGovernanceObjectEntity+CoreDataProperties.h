//
//  DSGovernanceObjectEntity+CoreDataProperties.h
//  DashSync
//
//  Created by Sam Westrich on 6/14/18.
//
//

#import "DSGovernanceObjectEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DSGovernanceObjectEntity (CoreDataProperties)

+ (NSFetchRequest<DSGovernanceObjectEntity *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSData *collateralHash;
@property (nullable, nonatomic, retain) NSData *parentHash;
@property (nullable, nonatomic, retain) NSString *paymentAddress;
@property (nonatomic, assign) uint32_t revision;
@property (nullable, nonatomic, retain) NSData *signature;
@property (nullable, nonatomic, retain) NSString * url;
@property (nonatomic, assign) uint64_t startEpoch;
@property (nonatomic, assign) uint64_t endEpoch;
@property (nonatomic, assign) uint64_t timestamp;
@property (nonatomic, assign) uint32_t type;
@property (nullable, nonatomic, retain) DSGovernanceObjectHashEntity *governanceObjectHash;
@property (nullable, nonatomic, retain) NSString * governanceMessage;
@property (nullable, nonatomic, retain) NSString * identifier;
@property (nonatomic, assign) uint64_t amount;

@end

NS_ASSUME_NONNULL_END