sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project7/test/integration/pages/MaintenanceRecordSrvList.gen",
	"project7/test/integration/pages/MaintenanceRecordSrvObjectPage.gen"
], function (JourneyRunner, MaintenanceRecordSrvListGenerated, MaintenanceRecordSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project7') + '/test/flp.html#app-preview',
        pages: {
			onTheMaintenanceRecordSrvListGenerated: MaintenanceRecordSrvListGenerated,
			onTheMaintenanceRecordSrvObjectPageGenerated: MaintenanceRecordSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

