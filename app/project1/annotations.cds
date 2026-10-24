using CatalogService from '../../srv/cat-services';

annotate CatalogService.RentalSrv with @(
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

annotate CatalogService.RentalSrv with @(

    UI.SelectionFields : [
        customer_CustomerID,
        rentalStatus,
        rentalDate,
        expectedReturnDate,
        actualReturnDate
    ],

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Rental ID',
            Value : RentalID
        },
        {
            $Type : 'UI.DataField',
            Label : 'Customer',
            Value : customer_CustomerID
        },
        {
            $Type : 'UI.DataField',
            Label : 'Rental Date',
            Value : rentalDate
        },
        {
            $Type : 'UI.DataField',
            Label : 'Expected Return Date',
            Value : expectedReturnDate
        },
        {
            $Type : 'UI.DataField',
            Label : 'Actual Return Date',
            Value : actualReturnDate
        },
        {
            $Type : 'UI.DataField',
            Label : 'Rental Status',
            Value : rentalStatus
        },
        {
            $Type : 'UI.DataField',
            Label : 'Total Rental Amount',
            Value : totalRentalAmount
        },
        {
    $Type : 'UI.DataFieldForAction',
    Action : 'CatalogService.RentalSrv.CreateRental',
    Label : 'Create'
},
{
    $Type : 'UI.DataFieldForAction',
    Action : 'CatalogService.RentalSrv.UpdateRental',
    Label : 'Update'
},
{
    $Type : 'UI.DataFieldForAction',
    Action : 'CatalogService.RentalSrv.DeleteRental',
    Label : 'Delete'
}
    ],

    UI.HeaderInfo : {

        TypeName : 'Rental',
        TypeNamePlural : 'Rentals',

        Title : {
            $Type : 'UI.DataField',
            Value : customer_CustomerID
        },

        Description : {
            $Type : 'UI.DataField',
            Value : rentalStatus
        },

        ImageUrl :
            'https://cdn-icons-png.flaticon.com/512/3208/3208707.png'
    },

    UI.Facets : [

        {
            $Type : 'UI.CollectionFacet',
            Label : 'Overview',

            Facets : [

                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Rental Information',
                    Target : '@UI.FieldGroup#RentalInfo'
                },

                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Financial Information',
                    Target : '@UI.FieldGroup#FinancialInfo'
                },
                
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Rental Items',
                    Target : 'rentalItems/@UI.LineItem'
                }
                

            ]
        }

    ],

    UI.FieldGroup #RentalInfo : {

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Rental ID',
                Value : RentalID
            },

            {
                $Type : 'UI.DataField',
                Label : 'Customer',
                Value : customer_CustomerID
            },

            {
                $Type : 'UI.DataField',
                Label : 'Rental Status',
                Value : rentalStatus
            },

            {
                $Type : 'UI.DataField',
                Label : 'Rental Date',
                Value : rentalDate
            },

            {
                $Type : 'UI.DataField',
                Label : 'Expected Return Date',
                Value : expectedReturnDate
            },

            {
                $Type : 'UI.DataField',
                Label : 'Actual Return Date',
                Value : actualReturnDate
            }

        ]
    },

    UI.FieldGroup #FinancialInfo : {

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Total Rental Amount',
                Value : totalRentalAmount
            }

        ]
    }

);


annotate CatalogService.RentalItemSrv with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : RentalItemID,
            Label : 'Rental Item ID'
        },
        {
            $Type : 'UI.DataField',
            Value : EquipmentID,
            Label : 'Equipment'
        },
        {
            $Type : 'UI.DataField',
            Value : dailyRentalRate,
            Label : 'Daily Rental Rate'
        },
        {
            $Type : 'UI.DataField',
            Value : startDate,
            Label : 'Start Date'
        },
        {
            $Type : 'UI.DataField',
            Value : endDate,
            Label : 'End Date'
        },
        {
            $Type : 'UI.DataField',
            Value : itemStatus,
            Label : 'Status'
        }
    ]
);