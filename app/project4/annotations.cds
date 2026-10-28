using CatalogService from '../../srv/cat-services';

annotate CatalogService.EquipmentSrv with @(
    Capabilities.DeleteRestrictions : {
        Deletable : false
    }
);
annotate CatalogService.EquipmentSrv with @(
    Capabilities.DeleteRestrictions : {
        Insertable : true
    }
);
annotate CatalogService.EquipmentSrv with @(
    Capabilities.UpdateRestrictions : {
        Updatable : true
    }
);
annotate CatalogService.EquipmentSrv with @(


    UI.HeaderInfo : {

        TypeName : 'Equipment',
        TypeNamePlural : 'Equipment',

        Title : {
            $Type : 'UI.DataField',
            Value : equipmentName
        },

        Description : {
            $Type : 'UI.DataField',
            Value : equipmentType
        },

        ImageUrl :
          'https://cdn-icons-png.flaticon.com/512/2920/2920349.png'
    },

    UI.SelectionFields : [
        equipmentName,
        equipmentType,
        manufacturer,
        currentStatus
    ],

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Label : 'Equipment Name',
            Value : equipmentName
        },

        {
            $Type : 'UI.DataField',
            Label : 'Equipment Type',
            Value : equipmentType
        },

        {
            $Type : 'UI.DataField',
            Label : 'Manufacturer',
            Value : manufacturer
        },

        {
            $Type : 'UI.DataField',
            Label : 'Model',
            Value : model
        },

        {
            $Type : 'UI.DataField',
            Label : 'Serial Number',
            Value : serialNumber
        },

        {
            $Type : 'UI.DataField',
            Label : 'Purchase Date',
            Value : purchaseDate
        },

        {
            $Type : 'UI.DataField',
            Label : 'Rental Rate',
            Value : rentalRatePerDay
        },

        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : currentStatus
        },
        {
    $Type : 'UI.DataFieldForAction',
    Action : 'CatalogService.EquipmentSrv.CreateEquipment',
    Label : 'Create'
},
{
    $Type : 'UI.DataFieldForAction',
    Action : 'CatalogService.EquipmentSrv.UpdateEquipment',
    Label : 'Update'
},
{
    $Type : 'UI.DataFieldForAction',
    Action : 'CatalogService.EquipmentSrv.DeleteEquipment',
    Label : 'Delete'
}

    ],

    UI.FieldGroup #GeneralInfo : {

        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Equipment Name',
                Value : equipmentName
            },

            {
                $Type : 'UI.DataField',
                Label : 'Equipment Type',
                Value : equipmentType
            },

            {
                $Type : 'UI.DataField',
                Label : 'Manufacturer',
                Value : manufacturer
            },

            {
                $Type : 'UI.DataField',
                Label : 'Model',
                Value : model
            }

        ]
    },

    UI.FieldGroup #AssetDetails : {

        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Serial Number',
                Value : serialNumber
            },

            {
                $Type : 'UI.DataField',
                Label : 'Purchase Date',
                Value : purchaseDate
            },

            {
                $Type : 'UI.DataField',
                Label : 'Rental Rate Per Day',
                Value : rentalRatePerDay
            },

            {
                $Type : 'UI.DataField',
                Label : 'Current Status',
                Value : currentStatus
            }

        ]
    },

    UI.Facets : [

        {
            $Type : 'UI.CollectionFacet',
            Label : 'Equipment Overview',

            Facets : [

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'GeneralInfoFacet',
                    Label : 'General Information',
                    Target : '@UI.FieldGroup#GeneralInfo'
                },

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'AssetDetailsFacet',
                    Label : 'Asset Details',
                    Target : '@UI.FieldGroup#AssetDetails'
                }

            ]
        }

    ]

);