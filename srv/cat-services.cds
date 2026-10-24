using { rental as db } from '../db/schema';
  


service CatalogService @(requires: 'authenticated-user') {

//CRUD FOR CUSTOMER

    entity CustomerSrv as projection on db.Master.Customers actions {
         
        action CreateCustomer(
            companyName   : String,
            contactPerson : String,
            email         : String,
            phone         : String,
            address       : String
        ) returns String;

        action UpdateCustomer(
            CustomerID    : UUID,
            companyName   : String,
            contactPerson : String,
            email         : String,
            phone         : String,
            address       : String
        ) returns String;

        action DeleteCustomer(
            CustomerID : UUID
        ) returns String;

    };

////CRUD FOR LOCATION
    entity LocationSrv as projection on db.Master.Locations actions {

    action CreateLocation(
        locationName : String(100),
        locationType : String(50),
        address      : String(255),
        city         : String(100),
        latitude     : Decimal(9,6),
        longitude    : Decimal(9,6)
    ) returns String;

    action UpdateLocation(
        LocationID   : UUID,
        locationName : String(100),
        locationType : String(50),
        address      : String(255),
        city         : String(100),
        latitude     : Decimal(9,6),
        longitude    : Decimal(9,6)
    ) returns String;

    action DeleteLocation(
        LocationID : UUID
    ) returns String;

};

//CRUD FOR EQUIPMENT

entity EquipmentSrv as projection on db.Master.Equipment actions {
    

    action CreateEquipment(
        LocationID       : UUID,
        equipmentName    : String(100),
        equipmentType    : String(50),
        manufacturer     : String(100),
        model            : String(100),
        serialNumber     : String(100),
        purchaseDate     : Date,
        rentalRatePerDay : Decimal(10,2),
        currentStatus    : String(30)
    ) returns String;

    action UpdateEquipment(
        EquipmentID      : UUID,
        LocationID       : UUID,
        equipmentName    : String(100),
        equipmentType    : String(50),
        manufacturer     : String(100),
        model            : String(100),
        serialNumber     : String(100),
        purchaseDate     : Date,
        rentalRatePerDay : Decimal(10,2),
        currentStatus    : String(30)
    ) returns String;

    action DeleteEquipment(
        EquipmentID : UUID
    ) returns String;

};


//CRUD FOR RENTAL

entity RentalSrv as projection on db.Transactional.Rentals actions {

    action CreateRental(
        CustomerID         : UUID,
        rentalDate         : Date,
        expectedReturnDate : Date,
        actualReturnDate   : Date,
        rentalStatus       : String(30),
        totalRentalAmount  : Decimal(12,2)
    ) returns String;

    action UpdateRental(
        RentalID           : UUID,
        CustomerID         : UUID,
        rentalDate         : Date,
        expectedReturnDate : Date,
        actualReturnDate   : Date,
        rentalStatus       : String(30),
        totalRentalAmount  : Decimal(12,2)
    ) returns String;

    action DeleteRental(
        RentalID : UUID
    ) returns String;

};


//CRUD FOR RENTAL ITEMS

entity RentalItemSrv as projection on db.Transactional.RentalItems actions {

    action CreateRentalItem(
        RentalID       : UUID,
        EquipmentID    : UUID,
        dailyRentalRate: Decimal(10,2),
        startDate      : Date,
        endDate        : Date,
        itemStatus     : String(30)
    ) returns String;

    action UpdateRentalItem(
        RentalItemID   : UUID,
        RentalID       : UUID,
        EquipmentID    : UUID,
        dailyRentalRate: Decimal(10,2),
        startDate      : Date,
        endDate        : Date,
        itemStatus     : String(30)
    ) returns String;

    action DeleteRentalItem(
        RentalItemID : UUID
    ) returns String;

};

//CRUD FOR CONDITIONAL LOGS

entity ConditionLogSrv as projection on db.Transactional.ConditionLogs actions {

    action CreateConditionLog(
        EquipmentID    : UUID,
        RentalID       : UUID,
        inspectionDate : DateTime,
        inspectionType : String(30),
        conditionGrade : String(20),
        inspectorName  : String(100),
        meterReading   : Decimal(10,2),
        notes          : String(500)
    ) returns String;

    action UpdateConditionLog(
        ConditionLogID : UUID,
        EquipmentID    : UUID,
        RentalID       : UUID,
        inspectionDate : DateTime,
        inspectionType : String(30),
        conditionGrade : String(20),
        inspectorName  : String(100),
        meterReading   : Decimal(10,2),
        notes          : String(500)
    ) returns String;

    action DeleteConditionLog(
        ConditionLogID : UUID
    ) returns String;

};

//CRUD FOR DAMAGERECORDS

entity DamageRecordSrv as projection on db.Transactional.DamageRecords actions {

    action CreateDamageRecord(
        ConditionLogID    : UUID,
        damageType        : String(50),
        damageDescription : String(500),
        severity          : String(20),
        repairEstimate    : Decimal(12,2),
        customerLiable    : Boolean,
        damageStatus      : String(30)
    ) returns String;

    action UpdateDamageRecord(
        DamageID          : UUID,
        ConditionLogID    : UUID,
        damageType        : String(50),
        damageDescription : String(500),
        severity          : String(20),
        repairEstimate    : Decimal(12,2),
        customerLiable    : Boolean,
        damageStatus      : String(30)
    ) returns String;

    action DeleteDamageRecord(
        DamageID : UUID
    ) returns String;

};

////CRUD FOR DAMAGEPHOTOES

entity DamagePhotoSrv as projection on db.Transactional.DamagePhotos actions {

    action CreateDamagePhoto(
        DamageID    : UUID,
        fileName    : String(255),
        mediaType   : String(100),
        photoContent: LargeBinary,
        uploadedAt  : DateTime,
        uploadedBy  : String(100)
    ) returns String;

    action UpdateDamagePhoto(
        PhotoID      : UUID,
        DamageID     : UUID,
        fileName     : String(255),
        mediaType    : String(100),
        photoContent : LargeBinary,
        uploadedAt   : DateTime,
        uploadedBy   : String(100)
    ) returns String;

    action DeleteDamagePhoto(
        PhotoID : UUID
    ) returns String;

};

//CRUD FOR REPAIRBILLS

entity RepairBillSrv as projection on db.Transactional.RepairBills actions {

    action CreateRepairBill(
        RentalID       : UUID,
        CustomerID     : UUID,
        DamageID       : UUID,
        billDate       : Date,
        repairAmount   : Decimal(12,2),
        taxAmount      : Decimal(12,2),
        totalAmount    : Decimal(12,2),
        billingStatus  : String(30),
        s4BillingDocID : String(50)
    ) returns String;

    action UpdateRepairBill(
        RepairBillID   : UUID,
        RentalID       : UUID,
        CustomerID     : UUID,
        DamageID       : UUID,
        billDate       : Date,
        repairAmount   : Decimal(12,2),
        taxAmount      : Decimal(12,2),
        totalAmount    : Decimal(12,2),
        billingStatus  : String(30),
        s4BillingDocID : String(50)
    ) returns String;

    action DeleteRepairBill(
        RepairBillID : UUID
    ) returns String;

};

//CRUD FOR MAINTANCERECORDS

entity MaintenanceRecordSrv as projection on db.Transactional.MaintenanceRecords actions {

    action CreateMaintenanceRecord(
        EquipmentID         : UUID,
        maintenanceType     : String(50),
        maintenanceDate     : Date,
        description         : String(500),
        serviceProvider     : String(150),
        cost                : Decimal(12,2),
        nextMaintenanceDate : Date,
        status              : String(30)
    ) returns String;

    action UpdateMaintenanceRecord(
        MaintenanceID       : UUID,
        EquipmentID         : UUID,
        maintenanceType     : String(50),
        maintenanceDate     : Date,
        description         : String(500),
        serviceProvider     : String(150),
        cost                : Decimal(12,2),
        nextMaintenanceDate : Date,
        status              : String(30)
    ) returns String;

    action DeleteMaintenanceRecord(
        MaintenanceID : UUID
    ) returns String;

};
}