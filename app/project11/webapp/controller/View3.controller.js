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

    return Controller.extend("project11.controller.View3", {

        onInit: function () {

            var oDashboardModel = new JSONModel({
                dateTime: ""
            });

            this.getView().setModel(
                oDashboardModel,
                "dashboard"
            );

            this._startClock();
        },

        _startClock: function () {

            var oModel = this.getView().getModel("dashboard");

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

        /* ==========================
           Navigation Events
        ========================== */

        onDashboard: function () {

            MessageToast.show(
                "Dispatcher Dashboard"
            );

        },

        onRentals: function () {

            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project1/index.html",
                "_blank"
            );

        },

        onEquipment: function () {

            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project4/index.html",
                "_blank"
            );

        },

        onLocations: function () {

            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project9/index.html",
                "_blank"
            );

        },

        onDeliverySchedule: function () {

            MessageToast.show(
                "Today's Deliveries"
            );

        },

        onDispatchQueue: function () {

            MessageToast.show(
                "Dispatch Queue"
            );

        },

        /* ==========================
           Logout
        ========================== */

        onLogout: function () {

            MessageBox.confirm(
                "Are you sure you want to logout?",
                {
                    onClose: function (sAction) {

                        if (sAction === "OK") {

                            window.location.href =
                                "/index.html";

                        }

                    }
                }
            );

        }

    });

});