sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageBox",
    "sap/m/MessageToast"
], function (
    Controller,
    JSONModel,
    MessageBox,
    MessageToast
) {
    "use strict";

    return Controller.extend("project12.controller.View4", {

        onInit: function () {

            var oModel = new JSONModel({
                dateTime: ""
            });

            this.getView().setModel(
                oModel,
                "dashboard"
            );

            this._startClock();
        },

        _startClock: function () {

            var oModel =
                this.getView().getModel("dashboard");

            oModel.setProperty(
                "/dateTime",
                new Date().toLocaleString("en-IN")
            );

            setInterval(function () {

                oModel.setProperty(
                    "/dateTime",
                    new Date().toLocaleString("en-IN")
                );

            }, 1000);
        },

        onDashboard: function () {
            MessageToast.show("Technician Dashboard");
        },

        onEquipment: function () {
            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project4/index.html",
                "_blank"
            );
        },

        onMaintenance: function () {
            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project7/index.html",
                "_blank"
            );
        },

        onDamageRecords: function () {
            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project5/index.html",
                "_blank"
            );
        },

        onConditionLogs: function () {
            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project6/index.html",
                "_blank"
            );
        },

        onDamagePhotos: function () {
            MessageToast.show("Damage Photos");
        },

        onRepairTasks: function () {
            MessageToast.show("Repair Tasks");
        },

        onLogout: function () {

            MessageBox.confirm(
                "Are you sure you want to logout?",
                {
                    onClose: function (sAction) {

                        if (sAction === "OK") {

                            window.location.href =
                            "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/index.html";

                        }

                    }
                }
            );
        }

    });

});