sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project4/test/integration/pages/EquipmentSrvList.gen",
	"project4/test/integration/pages/EquipmentSrvObjectPage.gen"
], function (JourneyRunner, EquipmentSrvListGenerated, EquipmentSrvObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project4') + '/test/flp.html#app-preview',
        pages: {
			onTheEquipmentSrvListGenerated: EquipmentSrvListGenerated,
			onTheEquipmentSrvObjectPageGenerated: EquipmentSrvObjectPageGenerated
        },
        async: true
    });

    return runner;
});

