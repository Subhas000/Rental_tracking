sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project9/test/integration/pages/LocationSrvList.gen",
	"project9/test/integration/pages/LocationSrvObjectPage.gen"
], function (JourneyRunner, LocationSrvListGenerated, LocationSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project9') + '/test/flp.html#app-preview',
        pages: {
			onTheLocationSrvListGenerated: LocationSrvListGenerated,
			onTheLocationSrvObjectPageGenerated: LocationSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

