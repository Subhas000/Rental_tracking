using CatalogService from '../../srv/cat-services';
annotate CatalogService.MaintenanceRecordSrv with @(
    Capabilities.InsertRestrictions : {
        Insertable : true
    },
    Capabilities.UpdateRestrictions : {
        Updatable : true
    },
    Capabilities.DeleteRestrictions : {
        Deletable : false
    }
);

annotate CatalogService.MaintenanceRecordSrv with @(

    UI.HeaderInfo : {
        TypeName : 'Maintenance Record',
        TypeNamePlural : 'Maintenance Records',

        Title : {
            $Type : 'UI.DataField',
            Value : MaintenanceID
        },

        Description : {
            $Type : 'UI.DataField',
            Value : maintenanceType
        },

        ImageUrl :
        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'
    },

    UI.SelectionFields : [
        MaintenanceID,
        maintenanceType,
        maintenanceDate,
        status,
        serviceProvider
    ],

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Label : 'Maintenance ID',
            Value : MaintenanceID
        },

        {
            $Type : 'UI.DataField',
            Label : 'Maintenance Type',
            Value : maintenanceType
        },

        {
            $Type : 'UI.DataField',
            Label : 'Maintenance Date',
            Value : maintenanceDate
        },

        {
            $Type : 'UI.DataField',
            Label : 'Service Provider',
            Value : serviceProvider
        },

        {
            $Type : 'UI.DataField',
            Label : 'Cost',
            Value : cost
        },

        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status
        }

    ],

    UI.FieldGroup #MaintenanceInfo : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Maintenance ID',
                Value : MaintenanceID
            },

            {
                $Type : 'UI.DataField',
                Label : 'Maintenance Type',
                Value : maintenanceType
            },

            {
                $Type : 'UI.DataField',
                Label : 'Maintenance Date',
                Value : maintenanceDate
            },

            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status
            },
             {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.MaintenanceRecordSrv.CreateMaintenanceRecord',
            Label : 'Create'
        },

        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.MaintenanceRecordSrv.UpdateMaintenanceRecord',
            Label : 'Update'
        },

        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.MaintenanceRecordSrv.DeleteMaintenanceRecord',
            Label : 'Delete'
        }

        ]
    },

    UI.FieldGroup #ServiceInfo : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Service Provider',
                Value : serviceProvider
            },

            {
                $Type : 'UI.DataField',
                Label : 'Cost',
                Value : cost
            },

            {
                $Type : 'UI.DataField',
                Label : 'Next Maintenance Date',
                Value : nextMaintenanceDate
            }

        ]
    },

    UI.FieldGroup #DescriptionInfo : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : description
            },

            {
                $Type : 'UI.DataField',
                Label : 'Equipment',
                Value : equipment_EquipmentID
            }

        ]
    },

    UI.Facets : [

        {
            $Type : 'UI.CollectionFacet',
            Label : 'Maintenance Overview',

            Facets : [

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'MaintenanceInfoFacet',
                    Label : 'Maintenance Information',
                    Target : '@UI.FieldGroup#MaintenanceInfo'
                },

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'ServiceInfoFacet',
                    Label : 'Service Information',
                    Target : '@UI.FieldGroup#ServiceInfo'
                },

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'DescriptionInfoFacet',
                    Label : 'Description',
                    Target : '@UI.FieldGroup#DescriptionInfo'
                }

            ]
        }

    ]

);