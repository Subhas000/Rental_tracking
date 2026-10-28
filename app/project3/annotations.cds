using CatalogService from '../../srv/cat-services';

annotate CatalogService.CustomerSrv with @(
    Capabilities.DeleteRestrictions : {
        Deletable : true
    }
);
annotate CatalogService.CustomerSrv with @(
    Capabilities.UpdateRestrictions : {
        Updatable : true
    }
);

annotate CatalogService.CustomerSrv with @(
  
    UI.HeaderInfo : {

        TypeName : 'Customer',
        TypeNamePlural : 'Customers',

        Title : {
            $Type : 'UI.DataField',
            Value : companyName
        },

        Description : {
            $Type : 'UI.DataField',
            Value : contactPerson
        },

        ImageUrl :
          'https://tse1.mm.bing.net/th/id/OIP.ZFJ8PFRZ7o1cGIlLZS0mqAHaHa?w=202&h=202&c=7&r=0&o=7&dpr=1.5&pid=1.7&rm=3'
    },

    UI.SelectionFields : [
        companyName,
        contactPerson,
        email,
        phone
    ],

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Label : 'Company Name',
            Value : companyName
        },

        {
            $Type : 'UI.DataField',
            Label : 'Contact Person',
            Value : contactPerson
        },

        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : email
        },

        {
            $Type : 'UI.DataField',
            Label : 'Phone',
            Value : phone
        },

        {
            $Type : 'UI.DataField',
            Label : 'Address',
            Value : address
        }

    ],

    UI.FieldGroup #GeneralInfo : {

        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Customer ID',
                Value : CustomerID
            },

            {
                $Type : 'UI.DataField',
                Label : 'Company Name',
                Value : companyName
            },

            {
                $Type : 'UI.DataField',
                Label : 'Contact Person',
                Value : contactPerson
            }

        ]
    },

    UI.FieldGroup #ContactInfo : {

        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Email Address',
                Value : email
            },

            {
                $Type : 'UI.DataField',
                Label : 'Phone Number',
                Value : phone
            },

            {
                $Type : 'UI.DataField',
                Label : 'Address',
                Value : address
            }

        ]
    },

    UI.FieldGroup #CustomerStats : {

        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Customer Category',
                Value : companyName
            },

            {
                $Type : 'UI.DataField',
                Label : 'Primary Contact',
                Value : contactPerson
            }

        ]
    },

    UI.Facets : [

        {
            $Type : 'UI.CollectionFacet',
            Label : 'Customer Overview',

            Facets : [

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'GeneralInfoFacet',
                    Label : 'General Information',
                    Target : '@UI.FieldGroup#GeneralInfo'
                },

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'ContactInfoFacet',
                    Label : 'Contact Information',
                    Target : '@UI.FieldGroup#ContactInfo'
                }
            ]
        }

    ]

);
