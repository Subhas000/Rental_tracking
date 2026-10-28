namespace rental;

using { managed } from '@sap/cds/common';

//MASTER DATA
context Master {

    entity Customers {

        key CustomerID      : UUID @title : '{i18n>CUSTOMER_ID}';

        companyName         : String(100) @title : '{i18n>COMPANY_NAME}';
        contactPerson       : String(100) @title : '{i18n>CONTACT_PERSON}';
        email               : String(100) @title : '{i18n>EMAIL}';
        phone               : String(20)  @title : '{i18n>PHONE}';
        address             : String(255) @title : '{i18n>ADDRESS}';
        s4CustomerID        : String(50)  @title : '{i18n>S4_CUSTOMER_ID}';

        rentals             : Association to many Transactional.Rentals on rentals.customer = $self;

        repairBills         : Association to many Transactional.RepairBills on repairBills.customer = $self;
    }

    entity Locations {

        key LocationID      : UUID @title : '{i18n>LOCATION_ID}';

        locationName        : String(100) @title : '{i18n>LOCATION_NAME}';
        locationType        : String(50)  @title : '{i18n>LOCATION_TYPE}';
        address             : String(255) @title : '{i18n>ADDRESS}';
        city                : String(100) @title : '{i18n>CITY}';
        latitude            : Decimal(9,6) @title : '{i18n>LATITUDE}';
        longitude           : Decimal(9,6) @title : '{i18n>LONGITUDE}';

        equipments          : Association to many Equipment on equipments.location = $self;
    }

    entity Equipment {

        key EquipmentID     : UUID @title : '{i18n>EQUIPMENT_ID}';

        location            : Association to Locations;

        equipmentName       : String(100) @title : '{i18n>EQUIPMENT_NAME}';
        equipmentType       : String(50)  @title : '{i18n>EQUIPMENT_TYPE}';
        manufacturer        : String(100) @title : '{i18n>MANUFACTURER}';
        model               : String(100) @title : '{i18n>MODEL}';
        serialNumber        : String(100) @title : '{i18n>SERIAL_NUMBER}';
        purchaseDate        : Date @title : '{i18n>PURCHASE_DATE}';
        rentalRatePerDay    : Decimal(10,2) @title : '{i18n>RENTAL_RATE_PER_DAY}';
        currentStatus       : String(30) @title : '{i18n>CURRENT_STATUS}';

        conditionLogs       : Association to many Transactional.ConditionLogs on conditionLogs.equipment = $self;

        maintenanceRecords  : Association to many Transactional.MaintenanceRecords on maintenanceRecords.equipment = $self;
    }
}
//TRANSACTIONAL DATA
context Transactional {

    entity Rentals {

        key RentalID            : UUID @title : '{i18n>RENTAL_ID}';

        customer                : Association to Master.Customers
                                    @title : '{i18n>CUSTOMER}';

        rentalDate              : Date @title : '{i18n>RENTAL_DATE}';
        expectedReturnDate      : Date @title : '{i18n>EXPECTED_RETURN_DATE}';
        actualReturnDate        : Date @title : '{i18n>ACTUAL_RETURN_DATE}';
        rentalStatus            : String(30) @title : '{i18n>RENTAL_STATUS}';
        totalRentalAmount       : Decimal(12,2) @title : '{i18n>TOTAL_RENTAL_AMOUNT}';

        rentalItems             : Association to many RentalItems on rentalItems.rental = $self;
    }

    entity RentalItems {

        key RentalItemID        : UUID @title : '{i18n>RENTAL_ITEM_ID}';

        rental                  : Association to Rentals;
        equipment               : Association to Master.Equipment;

        dailyRentalRate         : Decimal(10,2) @title : '{i18n>DAILY_RENTAL_RATE}';
        startDate               : Date @title : '{i18n>START_DATE}';
        endDate                 : Date @title : '{i18n>END_DATE}';
        itemStatus              : String(30) @title : '{i18n>ITEM_STATUS}';
    }

    entity ConditionLogs {

        key ConditionLogID      : UUID @title : '{i18n>CONDITION_LOG_ID}';

        equipment               : Association to Master.Equipment;
        rental                  : Association to Rentals;

        inspectionDate          : DateTime @title : '{i18n>INSPECTION_DATE}';
        inspectionType          : String(30) @title : '{i18n>INSPECTION_TYPE}';
        conditionGrade          : String(20) @title : '{i18n>CONDITION_GRADE}';
        inspectorName           : String(100) @title : '{i18n>INSPECTOR_NAME}';
        meterReading            : Decimal(10,2) @title : '{i18n>METER_READING}';
        notes                   : String(500) @title : '{i18n>NOTES}';

        damageRecords           : Association to many DamageRecords on damageRecords.conditionLog = $self;
    }

    entity DamageRecords {

        key DamageID            : UUID @title : '{i18n>DAMAGE_ID}';

        conditionLog            : Association to ConditionLogs;

        damageType              : String(50) @title : '{i18n>DAMAGE_TYPE}';
        damageDescription       : String(500) @title : '{i18n>DAMAGE_DESCRIPTION}';
        severity                : String(20) @title : '{i18n>SEVERITY}';
        repairEstimate          : Decimal(12,2) @title : '{i18n>REPAIR_ESTIMATE}';
        customerLiable          : Boolean @title : '{i18n>CUSTOMER_LIABLE}';
        damageStatus            : String(30) @title : '{i18n>DAMAGE_STATUS}';

        photos                  : Association to many DamagePhotos on photos.damageRecord = $self;

        repairBill              : Association to one RepairBills;
    }

    entity DamagePhotos {

        key PhotoID             : UUID @title : '{i18n>PHOTO_ID}';

        damageRecord            : Association to DamageRecords;

        fileName                : String(1000) @title : '{i18n>FILE_NAME}';
        mediaType               : String(100) @title : '{i18n>MEDIA_TYPE}';
        uploadedAt              : DateTime @title : '{i18n>UPLOADED_AT}';
        uploadedBy              : String(100) @title : '{i18n>UPLOADED_BY}';
    }

    entity RepairBills {

        key RepairBillID        : UUID @title : '{i18n>REPAIR_BILL_ID}';

        rental                  : Association to Rentals;
        customer                : Association to Master.Customers;
        damageRecord            : Association to DamageRecords;

        billDate                : Date @title : '{i18n>BILL_DATE}';
        repairAmount            : Decimal(12,2) @title : '{i18n>REPAIR_AMOUNT}';
        taxAmount               : Decimal(12,2) @title : '{i18n>TAX_AMOUNT}';
        totalAmount             : Decimal(12,2) @title : '{i18n>TOTAL_AMOUNT}';
        billingStatus           : String(30) @title : '{i18n>BILLING_STATUS}';
        s4BillingDocID          : String(50) @title : '{i18n>S4_BILLING_DOC_ID}';
    }

    entity MaintenanceRecords {

        key MaintenanceID       : UUID @title : '{i18n>MAINTENANCE_ID}';

        equipment               : Association to Master.Equipment;

        maintenanceType         : String(50) @title : '{i18n>MAINTENANCE_TYPE}';
        maintenanceDate         : Date @title : '{i18n>MAINTENANCE_DATE}';
        description             : String(500) @title : '{i18n>DESCRIPTION}';
        serviceProvider         : String(150) @title : '{i18n>SERVICE_PROVIDER}';
        cost                    : Decimal(12,2) @title : '{i18n>COST}';
        nextMaintenanceDate     : Date @title : '{i18n>NEXT_MAINTENANCE_DATE}';
        status                  : String(30) @title : '{i18n>STATUS}';
    }
}