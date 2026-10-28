const cds = require('@sap/cds');

cds.on('bootstrap', app => {

    app.get('/', (req, res) => {
       res.redirect('/index.html');
    });

});

module.exports = cds.server;