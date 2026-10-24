sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project3/test/integration/pages/CustomerSrvList.gen",
	"project3/test/integration/pages/CustomerSrvObjectPage.gen"
], function (JourneyRunner, CustomerSrvListGenerated, CustomerSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project3') + '/test/flp.html#app-preview',
        pages: {
			onTheCustomerSrvListGenerated: CustomerSrvListGenerated,
			onTheCustomerSrvObjectPageGenerated: CustomerSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

