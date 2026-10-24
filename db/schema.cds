namespace rental;

using { managed } from '@sap/cds/common';

context Master {

    entity Customers {
        key CustomerID      : UUID;

        companyName         : String(100);
        contactPerson       : String(100);
        email               : String(100);
        phone               : String(20);
        address             : String(255);
        s4CustomerID        : String(50);

        rentals             : Association to many Transactional.Rentals
                                on rentals.customer = $self;

        repairBills         : Association to many Transactional.RepairBills
                                on repairBills.customer = $self;
    }

    entity Locations  {
        key LocationID      : UUID;

        locationName        : String(100);
        locationType        : String(50);
        address             : String(255);
        city                : String(100);
        latitude            : Decimal(9,6);
        longitude           : Decimal(9,6);

        equipments          : Association to many Equipment
                                on equipments.location = $self;
    }

    entity Equipment  {
        key EquipmentID     : UUID;

        location            : Association to Locations;

        equipmentName       : String(100);
        equipmentType       : String(50);
        manufacturer        : String(100);
        model               : String(100);
        serialNumber        : String(100);
        purchaseDate        : Date;
        rentalRatePerDay    : Decimal(10,2);
        currentStatus       : String(30);

        conditionLogs       : Association to many Transactional.ConditionLogs
                                on conditionLogs.equipment = $self;

        maintenanceRecords  : Association to many Transactional.MaintenanceRecords
                                on maintenanceRecords.equipment = $self;
    }
}

context Transactional {
entity Rentals {

    key RentalID : UUID @title : '{i18n>RENTAL_ID}';

    customer : Association to Master.Customers
        @title : '{i18n>CUSTOMER}';

    rentalDate : Date
        @title : '{i18n>RENTAL_DATE}';

    expectedReturnDate : Date
        @title : '{i18n>EXPECTED_RETURN_DATE}';

    actualReturnDate : Date
        @title : '{i18n>ACTUAL_RETURN_DATE}';

    rentalStatus : String(30)
        @title : '{i18n>RENTAL_STATUS}';

    totalRentalAmount : Decimal(12,2)
        @title : '{i18n>TOTAL_RENTAL_AMOUNT}';
    rentalItems : Association to many RentalItems
                    on rentalItems.rental = $self;

 

}

    entity RentalItems  {
        key RentalItemID        : UUID;

        rental                  : Association to Rentals;
        equipment               : Association to Master.Equipment;

        dailyRentalRate         : Decimal(10,2);
        startDate               : Date;
        endDate                 : Date;
        itemStatus              : String(30);
        
        
    }

    entity ConditionLogs  {
        key ConditionLogID      : UUID;

        equipment               : Association to Master.Equipment;
        rental                  : Association to Rentals;

        inspectionDate          : DateTime;
        inspectionType          : String(30);
        conditionGrade          : String(20);
        inspectorName           : String(100);
        meterReading            : Decimal(10,2);
        notes                   : String(500);

        damageRecords           : Association to many DamageRecords
                                    on damageRecords.conditionLog = $self;
    }

    entity DamageRecords  {
        key DamageID            : UUID;

        conditionLog            : Association to ConditionLogs;

        damageType              : String(50);
        damageDescription       : String(500);
        severity                : String(20);
        repairEstimate          : Decimal(12,2);
        customerLiable          : Boolean;
        damageStatus            : String(30);

        photos                  : Association to many DamagePhotos
                                    on photos.damageRecord = $self;

        repairBill              : Association to one RepairBills;
    }

    entity DamagePhotos {
        key PhotoID             : UUID;

        damageRecord            : Association to DamageRecords;

        fileName                : String(1000);
        mediaType               : String(100);
        uploadedAt              : DateTime;
        uploadedBy              : String(100);
    }

    entity RepairBills  {
        key RepairBillID        : UUID;

        rental                  : Association to Rentals;
        customer                : Association to Master.Customers;
        damageRecord            : Association to DamageRecords;

        billDate                : Date;
        repairAmount            : Decimal(12,2);
        taxAmount               : Decimal(12,2);
        totalAmount             : Decimal(12,2);
        billingStatus           : String(30);
        s4BillingDocID          : String(50);
    }

    entity MaintenanceRecords  {
        key MaintenanceID       : UUID;

        equipment               : Association to Master.Equipment;

        maintenanceType         : String(50);
        maintenanceDate         : Date;
        description             : String(500);
        serviceProvider         : String(150);
        cost                    : Decimal(12,2);
        nextMaintenanceDate     : Date;
        status                  : String(30);
    }
}