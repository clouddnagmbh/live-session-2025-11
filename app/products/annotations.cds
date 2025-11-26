using ProductCatalog as service from '../../srv/service';

annotate service.Products with @(
    UI.LineItem                            : [
        {
            $Type: 'UI.DataField',
            Value: name,
            Label: 'Name',
        },
        {
            $Type: 'UI.DataField',
            Value: description,
            Label: 'Description',
        },
        {
            $Type: 'UI.DataField',
            Value: price,
            Label: 'Price',
        },
    ],

    UI.HeaderFacets                        : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#HeaderGeneralInformation'
    }],

    UI.FieldGroup #HeaderGeneralInformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                Value: name,
                Label: 'Name'
            },
            {
                Value: description,
                Label: 'Description'
            },
            {
                Value: price,
                Label: 'Price'
            }
        ]
    },

    UI.Facets                              : [{
        $Type : 'UI.ReferenceFacet',
        Target: 'reviews/@UI.LineItem',
        Label : 'Reviews'
    }],
);

annotate service.Reviews with @(
    UI.DataPoint #Rating             : {
        Value        : rating,
        TargetValue  : 5,
        Visualization: #Rating
    },

    UI.LineItem                      : [
        {
            $Type                : 'UI.DataFieldForAnnotation',
            Target               : '@UI.DataPoint#Rating',
            Label                : 'Rating',
            ![@HTML5.CssDefaults]: {width: '10rem'}
        },
        {
            $Type: 'UI.DataField',
            Value: title,
            Label: 'Title',
        },
        {
            $Type: 'UI.DataField',
            Value: comment,
            Label: 'Comment',
        }
    ],

    UI.HeaderInfo                    : {
        TypeName      : 'Review',
        TypeNamePlural: 'Reviews',
        Title         : {Value: title},
        Description   : {Value: comment}
    },

    UI.Facets                        : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#GeneralInformation',
        Label : 'Details'
    }],

    UI.FieldGroup #GeneralInformation: {Data: [
        {Value: title},
        {Value: comment},
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target: '@UI.DataPoint#Rating',
            Label : 'Rating'
        }
    ]}
);
