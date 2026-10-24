sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project5/test/integration/pages/DamageRecordSrvList.gen",
	"project5/test/integration/pages/DamageRecordSrvObjectPage.gen"
], function (JourneyRunner, DamageRecordSrvListGenerated, DamageRecordSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project5') + '/test/flp.html#app-preview',
        pages: {
			onTheDamageRecordSrvListGenerated: DamageRecordSrvListGenerated,
			onTheDamageRecordSrvObjectPageGenerated: DamageRecordSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

