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

    return Controller.extend("project10.controller.View2", {

        onInit: function () {

            var oModel = new JSONModel({
                dateTime: ""
            });

            this.getView().setModel(oModel, "dashboard");

            this._updateClock();
        },

        _updateClock: function () {

            var oModel =
                this.getView().getModel("dashboard");

            setInterval(function () {

                oModel.setProperty(
                    "/dateTime",
                    new Date().toLocaleString("en-IN")
                );

            }, 1000);
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
        },

        onStartCamera: async function () {

            try {

                const stream =
                    await navigator.mediaDevices.getUserMedia({
                        video: true,
                        audio: false
                    });

                const container =
                    document.getElementById(
                        "cameraContainer"
                    );

                if (!container) {

                    MessageToast.show(
                        "Camera container not found"
                    );

                    return;
                }

                container.innerHTML = `
                    <video
                        id="cameraPreview"
                        autoplay
                        playsinline
                        muted
                        style="
                            width:100%;
                            height:450px;
                            background:black;
                            object-fit:cover;
                            border-radius:8px;">
                    </video>

                    <canvas
                        id="captureCanvas"
                        style="display:none;">
                    </canvas>
                `;

                const video =
                    document.getElementById(
                        "cameraPreview"
                    );

                if (video) {

                    video.srcObject = stream;

                    video.onloadedmetadata =
                        function () {
                            video.play();
                        };
                }

                this._cameraStream = stream;

                MessageToast.show(
                    "Camera Started Successfully"
                );

            } catch (error) {

                MessageBox.error(
                    "Unable to access camera: " +
                    error.message
                );
            }
        },

        onCapturePhoto: function () {

    const video =
        document.getElementById(
            "cameraPreview"
        );

    if (!video) {

        MessageToast.show(
            "Start Camera First"
        );

        return;
    }

    const canvas =
        document.createElement("canvas");

    canvas.width =
        video.videoWidth;

    canvas.height =
        video.videoHeight;

    const ctx =
        canvas.getContext("2d");

    ctx.drawImage(
        video,
        0,
        0,
        canvas.width,
        canvas.height
    );

    this._capturedImage =
        canvas.toDataURL("image/png");

    this.byId("capturedImage")
        .setSrc(this._capturedImage);

    this.byId("capturedImage")
        .setVisible(true);

    MessageToast.show(
        "Photo Captured Successfully"
    );
},
onUploadCapturedPhoto: function () {

    if (!this._capturedImage) {

        MessageToast.show(
            "Capture photo first"
        );

        return;
    }

    const oContainer =
        this.byId(
            "damagePhotosContainer"
        );

    const oImage =
        new sap.m.Image({

            src:
                this._capturedImage,

            width: "250px",

            densityAware: false

        });

    oContainer.addItem(oImage);

    MessageToast.show(
        "Photo Uploaded To Damage Photos"
    );

    this.byId("capturedImage")
        .setVisible(false);

    this._capturedImage = null;
},

    });
});