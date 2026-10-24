sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project1/test/integration/pages/RentalSrvList.gen",
	"project1/test/integration/pages/RentalSrvObjectPage.gen"
], function (JourneyRunner, RentalSrvListGenerated, RentalSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project1') + '/test/flp.html#app-preview',
        pages: {
			onTheRentalSrvListGenerated: RentalSrvListGenerated,
			onTheRentalSrvObjectPageGenerated: RentalSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

