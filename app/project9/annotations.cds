using CatalogService from '../../srv/cat-services';

annotate CatalogService.LocationSrv with @(
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
annotate CatalogService.LocationSrv with @(

    UI.HeaderInfo : {
        TypeName : 'Location',
        TypeNamePlural : 'Locations',

        Title : {
            $Type : 'UI.DataField',
            Value : locationName
        },

        Description : {
            $Type : 'UI.DataField',
            Value : locationType
        },

        ImageUrl :
        'https://cdn-icons-png.flaticon.com/512/684/684908.png'
    },

    UI.SelectionFields : [
        LocationID,
        locationName,
        locationType,
        city
    ],

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Label : 'Location ID',
            Value : LocationID
        },

        {
            $Type : 'UI.DataField',
            Label : 'Location Name',
            Value : locationName
        },

        {
            $Type : 'UI.DataField',
            Label : 'Location Type',
            Value : locationType
        },

        {
            $Type : 'UI.DataField',
            Label : 'City',
            Value : city
        },

        {
            $Type : 'UI.DataField',
            Label : 'Latitude',
            Value : latitude
        },

        {
            $Type : 'UI.DataField',
            Label : 'Longitude',
            Value : longitude
        },
         {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.LocationSrv.CreateLocation',
            Label : 'Create'
        },

        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.LocationSrv.UpdateLocation',
            Label : 'Update'
        },

        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.LocationSrv.DeleteLocation',
            Label : 'Delete'
        }

    ],

    UI.FieldGroup #LocationInfo : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Location ID',
                Value : LocationID
            },

            {
                $Type : 'UI.DataField',
                Label : 'Location Name',
                Value : locationName
            },

            {
                $Type : 'UI.DataField',
                Label : 'Location Type',
                Value : locationType
            }

        ]
    },

    UI.FieldGroup #AddressInfo : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Address',
                Value : address
            },

            {
                $Type : 'UI.DataField',
                Label : 'City',
                Value : city
            }

        ]
    },

    UI.FieldGroup #GeoLocationInfo : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Label : 'Latitude',
                Value : latitude
            },

            {
                $Type : 'UI.DataField',
                Label : 'Longitude',
                Value : longitude
            }

        ]
    },

    UI.Facets : [

        {
            $Type : 'UI.CollectionFacet',
            Label : 'Location Overview',

            Facets : [

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'LocationInfoFacet',
                    Label : 'Location Information',
                    Target : '@UI.FieldGroup#LocationInfo'
                },

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'AddressInfoFacet',
                    Label : 'Address Information',
                    Target : '@UI.FieldGroup#AddressInfo'
                },

                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'GeoLocationFacet',
                    Label : 'Geo Coordinates',
                    Target : '@UI.FieldGroup#GeoLocationInfo'
                }

            ]
        }

    ]

);