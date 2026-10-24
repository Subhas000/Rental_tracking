using rental from '../db/schema';

service AnalyticsService {

    @readonly
    entity FleetOverview as
        select from rental.Master.Equipment {
            key currentStatus,
            count(*) as EquipmentCount : Integer
        }
        group by currentStatus;

    @readonly
    entity EquipmentTypeOverview as
        select from rental.Master.Equipment {
            key equipmentType,
            count(*) as EquipmentCount : Integer
        }
        group by equipmentType;

    @readonly
    entity EquipmentLocationOverview as
        select from rental.Master.Equipment {
            key location.locationName as LocationName,
            count(*) as EquipmentCount : Integer
        }
        group by location.locationName;

    @readonly
    entity MaintenanceOverview as
        select from rental.Transactional.MaintenanceRecords {
            key status,
            count(*) as MaintenanceCount : Integer
        }
        group by status;

}