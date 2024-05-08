const paymentStart = () => {
    console.log("payment started..");
    var amount = $("#payment_ field").val();
    console.log(amount);
    if (amount === "" || amount === null) {
       alert("amount is required");
       return;
}
}