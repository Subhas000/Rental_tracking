using CatalogService from '../../srv/cat-services';
annotate CatalogService.DamageRecordSrv with @(
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

annotate CatalogService.DamageRecordSrv with @(

    UI.HeaderInfo : {
        TypeName : 'Damage Record',
        TypeNamePlural : 'Damage Records',

        Title : {
            $Type : 'UI.DataField',
            Value : DamageID
        },

        Description : {
            $Type : 'UI.DataField',
            Value : damageType
        },

        ImageUrl :
        'https://cdn-icons-png.flaticon.com/512/565/565547.png'
    },

    UI.SelectionFields : [
        DamageID,
        damageType,
        severity,
        damageStatus,
        customerLiable
    ],

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Label : 'Damage ID',
            Value : DamageID
        },

        {
            $Type : 'UI.DataField',
            Label : 'Damage Type',
            Value : damageType
        },

        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : damageDescription
        },

        {
            $Type : 'UI.DataField',
            Label : 'Severity',
            Value : severity
        },

        {
            $Type : 'UI.DataField',
            Label : 'Repair Estimate',
            Value : repairEstimate
        },

        {
            $Type : 'UI.DataField',
            Label : 'Customer Liable',
            Value : customerLiable
        },

        {
            $Type : 'UI.DataField',
            Label : 'Damage Status',
            Value : damageStatus
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.DamageRecordSrv.CreateDamageRecord',
            Label : 'Create'
        },

        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.DamageRecordSrv.UpdateDamageRecord',
            Label : 'Update'
        },

        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.DamageRecordSrv.DeleteDamageRecord',
            Label : 'Delete'
        }

    ],

    UI.FieldGroup #DamageInfo : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Damage ID',
                Value : DamageID
            },

            {
                $Type : 'UI.DataField',
                Label : 'Damage Type',
                Value : damageType
            },

            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : damageDescription
            },

            {
                $Type : 'UI.DataField',
                Label : 'Severity',
                Value : severity
            }

        ]
    },

    UI.FieldGroup #RepairInfo : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Repair Estimate',
                Value : repairEstimate
            },

            {
                $Type : 'UI.DataField',
                Label : 'Customer Liable',
                Value : customerLiable
            },

            {
                $Type : 'UI.DataField',
                Label : 'Damage Status',
                Value : damageStatus
            }

        ]
    },

    UI.Facets : [

        {
            $Type : 'UI.CollectionFacet',
            Label : 'Damage Overview',

            Facets : [

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'DamageInfoFacet',
                    Label : 'Damage Information',
                    Target : '@UI.FieldGroup#DamageInfo'
                },

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'RepairInfoFacet',
                    Label : 'Repair Information',
                    Target : '@UI.FieldGroup#RepairInfo'
                }

            ]
        },

        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PhotosFacet',
            Label : 'Damage Photos',
            Target : 'photos/@UI.LineItem'
        }

    ]

);

annotate CatalogService.DamagePhotoSrv with @(

    UI.HeaderInfo : {
        TypeName : 'Damage Photo',
        TypeNamePlural : 'Damage Photos'
    },

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Label : 'Photo filename',
            Value : fileName

        },

        {
            $Type : 'UI.DataField',
            Label : 'Uploaded By',
            Value : uploadedBy
        },

        {
            $Type : 'UI.DataField',
            Label : 'Uploaded At',
            Value : uploadedAt
        }

    ]

);

