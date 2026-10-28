const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    const {
    CustomerSrv,
    LocationSrv,
    EquipmentSrv,
    RentalSrv,
    RentalItemSrv,
    ConditionLogSrv,
    DamageRecordSrv,
    DamagePhotoSrv,
    RepairBillSrv,
    MaintenanceRecordSrv
} = this.entities;
    // CREATE CUSTOMER
    this.on('CreateCustomer', async (req) => {

        const {
            companyName,
            contactPerson,
            email,
            phone,
            address
        } = req.data;

        await INSERT.into(CustomerSrv).entries({
            CustomerID: cds.utils.uuid(),
            companyName,
            contactPerson,
            email,
            phone,
            address
        });

        return 'Customer Created Successfully';
    });

    // UPDATE CUSTOMER
    this.on('UpdateCustomer', async (req) => {

        const {
            CustomerID,
            companyName,
            contactPerson,
            email,
            phone,
            address
        } = req.data;

        await UPDATE(CustomerSrv)
            .set({
                companyName,
                contactPerson,
                email,
                phone,
                address
            })
            .where({ CustomerID });

        return 'Customer Updated Successfully';
    });

    // DELETE CUSTOMER
    this.on('DeleteCustomer', async (req) => {

        const { CustomerID } = req.data;

        await DELETE.from(CustomerSrv)
            .where({ CustomerID });

        return 'Customer Deleted Successfully';
    });

    // CREATE LOCATION
    this.on('CreateLocation', async (req) => {

        const {
            locationName,
            locationType,
            address,
            city,
            latitude,
            longitude
        } = req.data;

        await INSERT.into(LocationSrv).entries({
            LocationID: cds.utils.uuid(),
            locationName,
            locationType,
            address,
            city,
            latitude,
            longitude
        });

        return 'Location Created Successfully';
    });

    // UPDATE LOCATION
    this.on('UpdateLocation', async (req) => {

        const {
            LocationID,
            locationName,
            locationType,
            address,
            city,
            latitude,
            longitude
        } = req.data;

        await UPDATE(LocationSrv)
            .set({
                locationName,
                locationType,
                address,
                city,
                latitude,
                longitude
            })
            .where({ LocationID });

        return 'Location Updated Successfully';
    });

    // DELETE LOCATION
    this.on('DeleteLocation', async (req) => {

        const { LocationID } = req.data;

        await DELETE.from(LocationSrv)
            .where({ LocationID });

        return 'Location Deleted Successfully';
    });
    // CREATE EQUIPMENT
this.on('CreateEquipment', async (req) => {

    const {
        LocationID,
        equipmentName,
        equipmentType,
        manufacturer,
        model,
        serialNumber,
        purchaseDate,
        rentalRatePerDay,
        currentStatus
    } = req.data;

    await INSERT.into(EquipmentSrv).entries({
        EquipmentID: cds.utils.uuid(),
        location_LocationID: LocationID,
        equipmentName,
        equipmentType,
        manufacturer,
        model,
        serialNumber,
        purchaseDate,
        rentalRatePerDay,
        currentStatus
    });

    return 'Equipment Created Successfully';
});

// UPDATE EQUIPMENT
this.on('UpdateEquipment', async (req) => {

    const {
        EquipmentID,
        LocationID,
        equipmentName,
        equipmentType,
        manufacturer,
        model,
        serialNumber,
        purchaseDate,
        rentalRatePerDay,
        currentStatus
    } = req.data;

    await UPDATE(EquipmentSrv)
        .set({
            location_LocationID: LocationID,
            equipmentName,
            equipmentType,
            manufacturer,
            model,
            serialNumber,
            purchaseDate,
            rentalRatePerDay,
            currentStatus
        })
        .where({ EquipmentID });

    return 'Equipment Updated Successfully';
});

// DELETE EQUIPMENT
this.on('DeleteEquipment', async (req) => {

    const { EquipmentID } = req.data;

    await DELETE.from(EquipmentSrv)
        .where({ EquipmentID });

    return 'Equipment Deleted Successfully';
});
// CREATE RENTAL
this.on('CreateRental', async (req) => {

    const {
        CustomerID,
        rentalDate,
        expectedReturnDate,
        actualReturnDate,
        rentalStatus,
        totalRentalAmount
    } = req.data;

    await INSERT.into(RentalSrv).entries({
        RentalID: cds.utils.uuid(),
        customer_CustomerID: CustomerID,
        rentalDate,
        expectedReturnDate,
        actualReturnDate,
        rentalStatus,
        totalRentalAmount
    });

    return 'Rental Created Successfully';
});

// UPDATE RENTAL
this.on('UpdateRental', async (req) => {

    const {
        RentalID,
        CustomerID,
        rentalDate,
        expectedReturnDate,
        actualReturnDate,
        rentalStatus,
        totalRentalAmount
    } = req.data;

    await UPDATE(RentalSrv)
        .set({
            customer_CustomerID: CustomerID,
            rentalDate,
            expectedReturnDate,
            actualReturnDate,
            rentalStatus,
            totalRentalAmount
        })
        .where({ RentalID });

    return 'Rental Updated Successfully';
});

// DELETE RENTAL
this.on('DeleteRental', async (req) => {

    const { RentalID } = req.data;

    await DELETE.from(RentalSrv)
        .where({ RentalID });

    return 'Rental Deleted Successfully';
});
// CREATE RENTAL ITEM
this.on('CreateRentalItem', async (req) => {

    const {
        RentalID,
        EquipmentID,
        dailyRentalRate,
        startDate,
        endDate,
        itemStatus
    } = req.data;

    await INSERT.into(RentalItemSrv).entries({
        RentalItemID: cds.utils.uuid(),
        rental_RentalID: RentalID,
        equipment_EquipmentID: EquipmentID,
        dailyRentalRate,
        startDate,
        endDate,
        itemStatus
    });

    return 'Rental Item Created Successfully';
});

// UPDATE RENTAL ITEM
this.on('UpdateRentalItem', async (req) => {

    const {
        RentalItemID,
        RentalID,
        EquipmentID,
        dailyRentalRate,
        startDate,
        endDate,
        itemStatus
    } = req.data;

    await UPDATE(RentalItemSrv)
        .set({
            rental_RentalID: RentalID,
            equipment_EquipmentID: EquipmentID,
            dailyRentalRate,
            startDate,
            endDate,
            itemStatus
        })
        .where({ RentalItemID });

    return 'Rental Item Updated Successfully';
});

// DELETE RENTAL ITEM
this.on('DeleteRentalItem', async (req) => {

    const { RentalItemID } = req.data;

    await DELETE.from(RentalItemSrv)
        .where({ RentalItemID });

    return 'Rental Item Deleted Successfully';
});
// CREATE CONDITION LOG
this.on('CreateConditionLog', async (req) => {

    const {
        EquipmentID,
        RentalID,
        inspectionDate,
        inspectionType,
        conditionGrade,
        inspectorName,
        meterReading,
        notes
    } = req.data;

    await INSERT.into(ConditionLogSrv).entries({
        ConditionLogID: cds.utils.uuid(),
        equipment_EquipmentID: EquipmentID,
        rental_RentalID: RentalID,
        inspectionDate,
        inspectionType,
        conditionGrade,
        inspectorName,
        meterReading,
        notes
    });

    return 'Condition Log Created Successfully';
});

// UPDATE CONDITION LOG
this.on('UpdateConditionLog', async (req) => {

    const {
        ConditionLogID,
        EquipmentID,
        RentalID,
        inspectionDate,
        inspectionType,
        conditionGrade,
        inspectorName,
        meterReading,
        notes
    } = req.data;

    await UPDATE(ConditionLogSrv)
        .set({
            equipment_EquipmentID: EquipmentID,
            rental_RentalID: RentalID,
            inspectionDate,
            inspectionType,
            conditionGrade,
            inspectorName,
            meterReading,
            notes
        })
        .where({ ConditionLogID });

    return 'Condition Log Updated Successfully';
});

// DELETE CONDITION LOG
this.on('DeleteConditionLog', async (req) => {

    const { ConditionLogID } = req.data;

    await DELETE.from(ConditionLogSrv)
        .where({ ConditionLogID });

    return 'Condition Log Deleted Successfully';
});

// CREATE DAMAGE RECORD
this.on('CreateDamageRecord', async (req) => {

    const {
        ConditionLogID,
        damageType,
        damageDescription,
        severity,
        repairEstimate,
        customerLiable,
        damageStatus
    } = req.data;

    await INSERT.into(DamageRecordSrv).entries({
        DamageID: cds.utils.uuid(),
        conditionLog_ConditionLogID: ConditionLogID,
        damageType,
        damageDescription,
        severity,
        repairEstimate,
        customerLiable,
        damageStatus
    });

    return 'Damage Record Created Successfully';
});

// UPDATE DAMAGE RECORD
this.on('UpdateDamageRecord', async (req) => {

    const {
        DamageID,
        ConditionLogID,
        damageType,
        damageDescription,
        severity,
        repairEstimate,
        customerLiable,
        damageStatus
    } = req.data;

    await UPDATE(DamageRecordSrv)
        .set({
            conditionLog_ConditionLogID: ConditionLogID,
            damageType,
            damageDescription,
            severity,
            repairEstimate,
            customerLiable,
            damageStatus
        })
        .where({ DamageID });

    return 'Damage Record Updated Successfully';
});

// DELETE DAMAGE RECORD
this.on('DeleteDamageRecord', async (req) => {

    const { DamageID } = req.data;

    await DELETE.from(DamageRecordSrv)
        .where({ DamageID });

    return 'Damage Record Deleted Successfully';
});

// CREATE DAMAGE PHOTO
this.on('CreateDamagePhoto', async (req) => {

    const {
        DamageID,
        fileName,
        mediaType,
        photoContent,
        uploadedAt,
        uploadedBy
    } = req.data;

    await INSERT.into(DamagePhotoSrv).entries({
        PhotoID: cds.utils.uuid(),
        damageRecord_DamageID: DamageID,
        fileName,
        mediaType,
        photoContent,
        uploadedAt,
        uploadedBy
    });

    return 'Damage Photo Created Successfully';
});


// UPDATE DAMAGE PHOTO
this.on('UpdateDamagePhoto', async (req) => {

    const {
        PhotoID,
        DamageID,
        fileName,
        mediaType,
        photoContent,
        uploadedAt,
        uploadedBy
    } = req.data;

    await UPDATE(DamagePhotoSrv)
        .set({
            damageRecord_DamageID: DamageID,
            fileName,
            mediaType,
            photoContent,
            uploadedAt,
            uploadedBy
        })
        .where({ PhotoID });

    return 'Damage Photo Updated Successfully';
});


// DELETE DAMAGE PHOTO
this.on('DeleteDamagePhoto', async (req) => {

    const { PhotoID } = req.data;

    await DELETE.from(DamagePhotoSrv)
        .where({ PhotoID });

    return 'Damage Photo Deleted Successfully';
});

// CREATE REPAIR BILL
this.on('CreateRepairBill', async (req) => {

    const {
        RentalID,
        CustomerID,
        DamageID,
        billDate,
        repairAmount,
        taxAmount,
        totalAmount,
        billingStatus,
        s4BillingDocID
    } = req.data;

    await INSERT.into(RepairBillSrv).entries({
        RepairBillID: cds.utils.uuid(),
        rental_RentalID: RentalID,
        customer_CustomerID: CustomerID,
        damageRecord_DamageID: DamageID,
        billDate,
        repairAmount,
        taxAmount,
        totalAmount,
        billingStatus,
        s4BillingDocID
    });

    return 'Repair Bill Created Successfully';
});


// UPDATE REPAIR BILL
this.on('UpdateRepairBill', async (req) => {

    const {
        RepairBillID,
        RentalID,
        CustomerID,
        DamageID,
        billDate,
        repairAmount,
        taxAmount,
        totalAmount,
        billingStatus,
        s4BillingDocID
    } = req.data;

    await UPDATE(RepairBillSrv)
        .set({
            rental_RentalID: RentalID,
            customer_CustomerID: CustomerID,
            damageRecord_DamageID: DamageID,
            billDate,
            repairAmount,
            taxAmount,
            totalAmount,
            billingStatus,
            s4BillingDocID
        })
        .where({ RepairBillID });

    return 'Repair Bill Updated Successfully';
});


// DELETE REPAIR BILL
this.on('DeleteRepairBill', async (req) => {

    const { RepairBillID } = req.data;

    await DELETE.from(RepairBillSrv)
        .where({ RepairBillID });

    return 'Repair Bill Deleted Successfully';
});

// CREATE MAINTENANCE RECORD
this.on('CreateMaintenanceRecord', async (req) => {

    const {
        EquipmentID,
        maintenanceType,
        maintenanceDate,
        description,
        serviceProvider,
        cost,
        nextMaintenanceDate,
        status
    } = req.data;

    await INSERT.into(MaintenanceRecordSrv).entries({
        MaintenanceID: cds.utils.uuid(),
        equipment_EquipmentID: EquipmentID,
        maintenanceType,
        maintenanceDate,
        description,
        serviceProvider,
        cost,
        nextMaintenanceDate,
        status
    });

    return 'Maintenance Record Created Successfully';
});


// UPDATE MAINTENANCE RECORD
this.on('UpdateMaintenanceRecord', async (req) => {

    const {
        MaintenanceID,
        EquipmentID,
        maintenanceType,
        maintenanceDate,
        description,
        serviceProvider,
        cost,
        nextMaintenanceDate,
        status
    } = req.data;

    await UPDATE(MaintenanceRecordSrv)
        .set({
            equipment_EquipmentID: EquipmentID,
            maintenanceType,
            maintenanceDate,
            description,
            serviceProvider,
            cost,
            nextMaintenanceDate,
            status
        })
        .where({ MaintenanceID });

    return 'Maintenance Record Updated Successfully';
});


// DELETE MAINTENANCE RECORD
this.on('DeleteMaintenanceRecord', async (req) => {

    const { MaintenanceID } = req.data;

    await DELETE.from(MaintenanceRecordSrv)
        .where({ MaintenanceID });

    return 'Maintenance Record Deleted Successfully';

   
});


});


