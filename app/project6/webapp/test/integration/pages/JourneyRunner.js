sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project6/test/integration/pages/ConditionLogSrvList.gen",
	"project6/test/integration/pages/ConditionLogSrvObjectPage.gen"
], function (JourneyRunner, ConditionLogSrvListGenerated, ConditionLogSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project6') + '/test/flp.html#app-preview',
        pages: {
			onTheConditionLogSrvListGenerated: ConditionLogSrvListGenerated,
			onTheConditionLogSrvObjectPageGenerated: ConditionLogSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

