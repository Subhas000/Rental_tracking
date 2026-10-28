using CatalogService from '../../srv/cat-services';

annotate CatalogService.RepairBillSrv with @(
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
annotate CatalogService.RepairBillSrv with @(

    UI.HeaderInfo : {
        TypeName : 'Billing Record',
        TypeNamePlural : 'Billing Records',

        Title : {
            $Type : 'UI.DataField',
            Value : RepairBillID
        },

        Description : {
            $Type : 'UI.DataField',
            Value : billingStatus
        },

        ImageUrl :
        'https://cdn-icons-png.flaticon.com/512/2830/2830284.png'
    },

    UI.SelectionFields : [
        RepairBillID,
        billingStatus,
        billDate,
        customer_CustomerID,
        rental_RentalID
    ],

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Label : 'Bill ID',
            Value : RepairBillID
        },

        {
            $Type : 'UI.DataField',
            Label : 'Bill Date',
            Value : billDate
        },

        {
            $Type : 'UI.DataField',
            Label : 'Repair Amount',
            Value : repairAmount
        },

        {
            $Type : 'UI.DataField',
            Label : 'Tax Amount',
            Value : taxAmount
        },

        {
            $Type : 'UI.DataField',
            Label : 'Total Amount',
            Value : totalAmount
        },

        {
            $Type : 'UI.DataField',
            Label : 'Billing Status',
            Value : billingStatus
        },
         {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.RepairBillSrv.CreateRepairBills',
            Label : 'Create'
        },

        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.RepairBillSrv.UpdateRepairBills',
            Label : 'Update'
        },

        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.RepairBillSrv.DeleteRepairBills',
            Label : 'Delete'
        }

    ],

    UI.FieldGroup #BillingInfo : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Bill ID',
                Value : RepairBillID
            },

            {
                $Type : 'UI.DataField',
                Label : 'Bill Date',
                Value : billDate
            },

            {
                $Type : 'UI.DataField',
                Label : 'Billing Status',
                Value : billingStatus
            },

            {
                $Type : 'UI.DataField',
                Label : 'S4 Billing Document ID',
                Value : s4BillingDocID
            }

        ]
    },

    UI.FieldGroup #AmountInfo : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Repair Amount',
                Value : repairAmount
            },

            {
                $Type : 'UI.DataField',
                Label : 'Tax Amount',
                Value : taxAmount
            },

            {
                $Type : 'UI.DataField',
                Label : 'Total Amount',
                Value : totalAmount
            }

        ]
    },

    UI.FieldGroup #ReferenceInfo : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Customer',
                Value : customer_CustomerID
            },

            {
                $Type : 'UI.DataField',
                Label : 'Rental',
                Value : rental_RentalID
            },

            {
                $Type : 'UI.DataField',
                Label : 'Damage Record',
                Value : damageRecord_DamageID
            }

        ]
    },

    UI.Facets : [

        {
            $Type : 'UI.CollectionFacet',
            Label : 'Billing Overview',

            Facets : [

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'BillingInfoFacet',
                    Label : 'Billing Information',
                    Target : '@UI.FieldGroup#BillingInfo'
                },

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'AmountInfoFacet',
                    Label : 'Amount Details',
                    Target : '@UI.FieldGroup#AmountInfo'
                },

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'ReferenceInfoFacet',
                    Label : 'Related Records',
                    Target : '@UI.FieldGroup#ReferenceInfo'
                }

            ]
        }

    ]

);