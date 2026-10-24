namespace rental;
 
using { managed } from '@sap/cds/common';
 
/*
 * Common Status Types
 */
 
type RentalStatus : String enum {
    Overdue;
    Active;
    Returned;
    Cancelled;
}
 
type ItemStatus : String enum {
    Available;
    Rented;
    Returned;
    Damaged;
    UnderMaintenance;
}
 
type EquipmentStatus : String enum {
    Available;
    Rented;
    UnderMaintenance;
    Damaged;
    Retired;
}
 
type DamageStatus : String enum {
    Reported;
    UnderReview;
    Approved;
    Repaired;
    Closed;
}
 
type BillingStatus : String enum {
    Draft;
    Generated;
    Sent;
    Paid;
    Cancelled;
}
 
type MaintenanceStatus : String enum {
    Scheduled;
    InProgress;
    Completed;
    Cancelled;
}
 
type Severity : String enum {
    Low;
    Medium;
    High;
    Critical;
}
 
type InspectionType : String enum {
    PreRental;
    DuringRental;
    ReturnInspection;
}
 
type ConditionGrade : String enum {
    Excellent;
    Good;
    Fair;
    Poor;
}
 
/*
 * Reusable Address Aspect
 */
aspect AddressInfo {
    address : String(255);
    city    : String(100);
}
 
/*
 * Audit Aspect
 */
aspect AuditInfo : managed {
    createdByName : String(100);
}