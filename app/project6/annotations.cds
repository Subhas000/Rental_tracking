using CatalogService from '../../srv/cat-services';

annotate CatalogService.ConditionLogSrv with @(

    UI.HeaderInfo : {
        TypeName : 'Condition Log',
        TypeNamePlural : 'Condition Logs',

        Title : {
            $Type : 'UI.DataField',
            Value : ConditionLogID
        },

        Description : {
            $Type : 'UI.DataField',
            Value : inspectionType
        },

        ImageUrl :
        'https://cdn-icons-png.flaticon.com/512/2910/2910791.png'
    },

    UI.SelectionFields : [
        ConditionLogID,
        inspectionType,
        conditionGrade,
        inspectorName,
        inspectionDate
    ],

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Label : 'Log ID',
            Value : ConditionLogID
        },

        {
            $Type : 'UI.DataField',
            Label : 'Inspection Date',
            Value : inspectionDate
        },

        {
            $Type : 'UI.DataField',
            Label : 'Inspection Type',
            Value : inspectionType
        },

        {
            $Type : 'UI.DataField',
            Label : 'Condition Grade',
            Value : conditionGrade
        },

        {
            $Type : 'UI.DataField',
            Label : 'Inspector',
            Value : inspectorName
        },

        {
            $Type : 'UI.DataField',
            Label : 'Meter Reading',
            Value : meterReading
        }

    ],

    UI.FieldGroup #InspectionInfo : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Inspection Date',
                Value : inspectionDate
            },

            {
                $Type : 'UI.DataField',
                Label : 'Inspection Type',
                Value : inspectionType
            },

            {
                $Type : 'UI.DataField',
                Label : 'Condition Grade',
                Value : conditionGrade
            },

            {
                $Type : 'UI.DataField',
                Label : 'Inspector Name',
                Value : inspectorName
            }

        ]
    },

    UI.FieldGroup #EquipmentInfo : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Equipment',
                Value : equipment_EquipmentID
            },

            {
                $Type : 'UI.DataField',
                Label : 'Rental',
                Value : rental_RentalID
            },

            {
                $Type : 'UI.DataField',
                Label : 'Meter Reading',
                Value : meterReading
            },

            {
                $Type : 'UI.DataField',
                Label : 'Notes',
                Value : notes
            }

        ]
    },

    UI.Facets : [

        {
            $Type : 'UI.CollectionFacet',
            Label : 'Condition Log Details',

            Facets : [

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'InspectionInfoFacet',
                    Label : 'Inspection Information',
                    Target : '@UI.FieldGroup#InspectionInfo'
                },

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'EquipmentInfoFacet',
                    Label : 'Equipment Information',
                    Target : '@UI.FieldGroup#EquipmentInfo'
                }

            ]
        }

    ]
);