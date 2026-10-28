const cds = require('@sap/cds');

cds.on('bootstrap', app => {

    app.get('/', (req, res) => {
        res.redirect('/project14/index.html');
    });

});

module.exports = cds.server;