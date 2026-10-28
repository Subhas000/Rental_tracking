sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageBox",
    "sap/m/MessageToast"
], function (Controller, JSONModel, MessageBox, MessageToast) {
    "use strict";

    return Controller.extend("project2.controller.View1", {

        onInit: function () {

            var oDashboardModel = new JSONModel({
                totalEquipment: 0,
                totalRevenue: 0,
                pendingRentals: 0,
                totalCustomers: 0,
                dateTime: ""
            });

            var oCustomerModel = new JSONModel({
                customers: []
            });

            var oChartModel = new JSONModel({
                rentals: []
            });

            this.getView().setModel(oDashboardModel, "dashboard");
            this.getView().setModel(oCustomerModel, "customer");
            this.getView().setModel(oChartModel, "chart");

            this._startClock();

            this.loadEquipment();
            this.loadCustomersKPI();
            this.loadPendingRentals();
            this.loadRevenue();
            this.loadRecentCustomers();
            this.loadMonthlyRentals();
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

        loadEquipment: async function () {

            try {

                const response =
                    await fetch("/odata/v4/catalog/EquipmentSrv");

                const data =
                    await response.json();

                this.getView()
                    .getModel("dashboard")
                    .setProperty(
                        "/totalEquipment",
                        data.value.length
                    );

            } catch (error) {

                console.error("Equipment Error:", error);

            }
        },

        loadCustomersKPI: async function () {

            try {

                const response =
                    await fetch("/odata/v4/catalog/CustomerSrv");

                const data =
                    await response.json();

                this.getView()
                    .getModel("dashboard")
                    .setProperty(
                        "/totalCustomers",
                        data.value.length
                    );

            } catch (error) {

                console.error("Customer KPI Error:", error);

            }
        },

        loadPendingRentals: async function () {

            try {

                const response =
                    await fetch("/odata/v4/catalog/RentalSrv");

                const data =
                    await response.json();

                const pending = data.value.filter(function (item) {
                    return item.rentalStatus === "Pending";
                });

                this.getView()
                    .getModel("dashboard")
                    .setProperty(
                        "/pendingRentals",
                        pending.length
                    );

            } catch (error) {

                console.error("Pending Rentals Error:", error);

            }
        },

        loadRevenue: async function () {

            try {

                const response =
                    await fetch("/odata/v4/catalog/RentalSrv");

                const data =
                    await response.json();

                let revenue = 0;

                data.value.forEach(function (item) {

                    revenue += Number(
                        item.totalRentalAmount || 0
                    );

                });

                this.getView()
                    .getModel("dashboard")
                    .setProperty(
                        "/totalRevenue",
                        revenue
                    );

            } catch (error) {

                console.error("Revenue Error:", error);

            }
        },

        loadRecentCustomers: async function () {

            try {

                const response =
                    await fetch("/odata/v4/catalog/CustomerSrv");

                const data =
                    await response.json();

                this.getView()
                    .getModel("customer")
                    .setProperty(
                        "/customers",
                        data.value
                    );

            } catch (error) {

                console.error("Customer Load Error:", error);

            }
        },

        loadMonthlyRentals: async function () {

            try {

                const response =
                    await fetch("/odata/v4/catalog/RentalSrv");

                const data =
                    await response.json();

                const monthMap = {};

                data.value.forEach(function (item) {

                    if (item.rentalDate) {

                        const month =
                            new Date(item.rentalDate)
                                .toLocaleString(
                                    "en-US",
                                    {
                                        month: "short"
                                    }
                                );

                        monthMap[month] =
                            (monthMap[month] || 0) + 1;
                    }

                });

                const chartData = [];

                Object.keys(monthMap).forEach(function (month) {

                    chartData.push({
                        Month: month,
                        Rentals: monthMap[month]
                    });

                });

                this.getView()
                    .getModel("chart")
                    .setProperty(
                        "/rentals",
                        chartData
                    );

            } catch (error) {

                console.error("Chart Error:", error);

            }
        },

        onRentalOverview: function () {

            MessageToast.show(
                "Rental Overview"
            );

        },

        onCustomers: function () {

            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project3/index.html",
                "_self"
            );

        },

        onEquipment: function () {

            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project4/index.html",
                "_self"
            );

        },

        onRentals: function () {

            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project1/index.html",
                "_self"
            );

        },

        onConditionLogs: function () {

            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project6/index.html",
                "_self"
            );

        },

        onDamageRecords: function () {

            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project5/index.html",
                "_self"
            );

        },

        onMaintenance: function () {

            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project7/index.html",
                "_self"
            );

        },

        onRepairBilling: function () {

            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project8/index.html",
                "_self"
            );

        },

        onLocations: function () {

            window.open(
                "https://port4004-workspaces-ws-hg171.us10.trial.applicationstudio.cloud.sap/project9/index.html",
                "_self"
            );

        },

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