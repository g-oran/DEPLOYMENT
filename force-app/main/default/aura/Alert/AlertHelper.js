({
    openAlert: function(cmp, event) {
        this.LightningAlert.open({
            message: 'this is the alert message',
            theme: 'error',
            label: 'Important Error!',
        }).then(function() {
            console.log('alert is closed');
        });
    }
});