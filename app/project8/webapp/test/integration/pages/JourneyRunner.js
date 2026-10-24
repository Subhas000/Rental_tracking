sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project8/test/integration/pages/RepairBillSrvList.gen",
	"project8/test/integration/pages/RepairBillSrvObjectPage.gen"
], function (JourneyRunner, RepairBillSrvListGenerated, RepairBillSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project8') + '/test/flp.html#app-preview',
        pages: {
			onTheRepairBillSrvListGenerated: RepairBillSrvListGenerated,
			onTheRepairBillSrvObjectPageGenerated: RepairBillSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

