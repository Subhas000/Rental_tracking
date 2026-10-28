sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast",
    "sap/m/MessageBox"
], function (
    Controller,
    JSONModel,
    MessageToast,
    MessageBox
) {
    "use strict";

    return Controller.extend("project13.controller.View5", {

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
            MessageToast.show("Billing Dashboard");
        },

        onBilling: function () {
            MessageToast.show("Billing");
        },

        onRentals: function () {
            MessageToast.show("Rentals");
        },

        onCustomers: function () {
            MessageToast.show("Customers");
        },

        onPayments: function () {
            MessageToast.show("Payments");
        },

        onRevenue: function () {
            MessageToast.show("Revenue");
        },

        onInvoices: function () {
            MessageToast.show("Invoices");
        },

        onLogout: function () {

            MessageBox.confirm(
                "Are you sure you want to logout?",
                {
                    onClose: function (sAction) {

                        if (sAction === "OK") {

                            window.location.href =
                            "../index.html";

                        }

                    }
                }
            );
        }

    });

});