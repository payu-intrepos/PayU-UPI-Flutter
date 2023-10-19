// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:payu_upi_flutter/PayUUPIConstantKeys.dart';
import 'package:payu_upi_flutter/payu_upi_flutter.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> implements PayUUPIProtocol {
  late PayUUpiFlutter payUUpiFlutter;
  TextEditingController keyTextField = TextEditingController(text:"smsplus");
  TextEditingController saltTextField = TextEditingController(text:"1b1b0");
  TextEditingController vpaTextField = TextEditingController(text:"anything@payu");
  TextEditingController userCredentialTextField = TextEditingController(text:"umang:arya");
  TextEditingController accountNumberTextField = TextEditingController(text:"123456789012345");
  TextEditingController accountIFSCTextField = TextEditingController(text:"IFSC1234");


  @override
  void initState() {
    super.initState();
    payUUpiFlutter = PayUUpiFlutter(this);
    PayUTestCredentials.merchantKey = keyTextField.text;
    PayUTestCredentials.merchantSalt = saltTextField.text;
    PayUTestCredentials.vpa = vpaTextField.text;
    PayUTestCredentials.userCredential = userCredentialTextField.text;
    PayUTestCredentials.accountNumber = accountNumberTextField.text;
    PayUTestCredentials.accountIFSC = accountIFSCTextField.text;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('UPI Plugin example app'),
        ),
        body: Center(
            child: Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: ListView(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: accountNumberTextField,
                                decoration: const InputDecoration(
                                  labelText: 'account number ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.accountNumber =
                                      accountNumberTextField.text;
                                  print("PayU flutterhash " +
                                      PayUTestCredentials.merchantKey);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: accountIFSCTextField,
                                decoration: const InputDecoration(
                                  labelText: 'account IFSC ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.accountIFSC =
                                      accountIFSCTextField.text;
                                  print("PayU flutterhash " +
                                      PayUTestCredentials.merchantKey);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: userCredentialTextField,
                                decoration: const InputDecoration(
                                  labelText: 'User Credential ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.userCredential =
                                      userCredentialTextField.text;
                                  print("PayU flutterhash " +
                                      PayUTestCredentials.merchantKey);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: keyTextField,
                                decoration: const InputDecoration(
                                  labelText: 'Key ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.merchantKey =
                                      keyTextField.text;
                                  print("PayU flutterhash " +
                                      PayUTestCredentials.merchantKey);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: saltTextField,
                                decoration: const InputDecoration(
                                  labelText: 'Salt ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.merchantSalt =
                                      saltTextField.text;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              height: 50,
                              child: TextField(
                                controller: vpaTextField,
                                decoration: const InputDecoration(
                                  labelText: 'VPA ',
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (content) {
                                  PayUTestCredentials.vpa = vpaTextField.text;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text("Validate VPA"),
                            onPressed: () {
                              validateVPA();
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text("PayU - UPI Intent"),
                            onPressed: () {
                              payViaUPIIntent();
                            },
                          ),
                        ],
                      ),
                      Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             ElevatedButton(
                               child: const Text("UPI Intent TPV(Specific App)"),
                               onPressed: () {
                                 payWithSpecificApp();
                               },
                             ),
                           ],
                         ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text("PayU - UPI Intent TPV"),
                            onPressed: () {
                              payIntentTPV();
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text("Pay - Collect"),
                            onPressed: () {
                              payViaUPICollect();
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text("Smart Intent Apps"),
                            onPressed: () {
                              intentApps();
                            },
                          ),
                        ],
                      ),
                    ]))),
      ),
    );
  }


  showAlertDialog(BuildContext context, String title, String content) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: new Text(content),
            ),
            actions: [okButton],
          );
        });
  }

  validateVPA() async {
    // ignore: prefer_interpolation_to_compose_strings
    var vpaHash = HashService.calculateHash(PayUTestCredentials.merchantKey +
        '|' +
        "validateVPA" +
        '|' +
        PayUTestCredentials.vpa +
        '|' +
        PayUTestCredentials.merchantSalt);
    var params = PayUParams.createPayUPaymentParams(PayUPaymentModeKeys.upi);
    params[PayUPaymentParamKey.vpa] = PayUTestCredentials.vpa;
    params[PayUPaymentParamKey.hashes] = {
      PayUPaymentParamKey.validate_vpa: vpaHash
    };
    var data = await payUUpiFlutter.validateVPA(params: params);
    showAlertDialog(context, "Validate VPA", "$data");
  }

  
  payIntentTPV() async {
    var params = PayUParams.createPayUPaymentParamsForTPV();
    params[PayUPaymentParamKey.intent_app] = PayUTestCredentials.paytmScheme;
    payUUpiFlutter.makeUPIPayment(params: params);
  }

  payViaUPIIntent() async {
    var params = PayUParams.createPayUPaymentParams(PayUPaymentModeKeys.INTENT);
    params[PayUPaymentParamKey.hashes] = HashService.paymentHash(params[PayUPaymentParamKey.transaction_id]);
    params[PayUPaymentParamKey.intent_app] = PayUTestCredentials.paytmScheme;
    payUUpiFlutter.makeUPIPayment(params: params);
  }

  payWithSpecificApp() async {
    var params = PayUParams.createPayUPaymentParamsForTPV();
    params[PayUPaymentParamKey.intent_app] = PayUTestCredentials.paytmScheme;
    params[PayUPaymentParamKey.package_name] =
        PayUTestCredentials.paytmPackageName;
    payUUpiFlutter.makeUPIPayment(params: params);
  }

  payViaUPICollect() async {
    var params = PayUParams.createPayUPaymentParams(PayUPaymentModeKeys.upi);
    params[PayUPaymentParamKey.vpa] = PayUTestCredentials.vpa;
    params[PayUPaymentParamKey.hashes] = HashService.paymentHash(params[PayUPaymentParamKey.transaction_id]);
    params[PayUPaymentParamKey.si_details] = PayUTestCredentials.si_details;

    payUUpiFlutter.makeUPIPayment(params: params);
  }

  intentApps() async {
    var data = await payUUpiFlutter.intentApps();
    showAlertDialog(context, "intentApps", "$data");
  }

  @override
  onPayUUPIMakePayment(Map response) {

    String eventType = response[PayUEventType.eventType];
    switch(eventType) { 
        case PayUEventType.onPaymentSuccess: { 
             String eventResponse = parsePayUResponse(response);
             showAlertDialog(context,PayUEventType.onPaymentSuccess,eventResponse);
        } 
        break; 
        case PayUEventType.onPaymentFailure: { 
             String eventResponse = parsePayUResponse(response);
             showAlertDialog(context,PayUEventType.onPaymentFailure,eventResponse);
        } 
        break; 

        case PayUEventType.onErrorReceived: { 
             String eventResponse = parsePayUResponse(response);
             showAlertDialog(context,PayUEventType.onPaymentSuccess,eventResponse);
        } 
        break; 
      
        case PayUEventType.onPaymentTerminate: 
        {  
             String eventResponse = parsePayUResponse(response);
             showAlertDialog(context,PayUEventType.onPaymentSuccess,eventResponse);
        } 
        break; 
      
        default: { 
             showAlertDialog(context,PayUEventType.invalidEvent,"");
         } 
        break; 
    } 
  }

  @override
  onPayUUPIValidateVPA(Map response) {
     String eventType = response[PayUEventType.eventType];
    switch(eventType) { 
        case PayUEventType.onValidateSuccess: { 
             String eventResponse = parsePayUResponse(response);
             showAlertDialog(context,PayUEventType.onValidateSuccess,eventResponse);
        } 
        break; 
      
        case PayUEventType.onErrorReceived: { 
             String eventResponse = parsePayUResponse(response);
             showAlertDialog(context,PayUEventType.onErrorReceived,eventResponse);
        } 
        break; 
      
        default: { 
             showAlertDialog(context,PayUEventType.invalidEvent,"");
         } 
        break; 
    } 
  }

  String parsePayUResponse(Map response){
    var eventResponse = response[PayUEventType.eventResponse];
    return eventResponse != null ? eventResponse.toString() : "";
  }

}

//Pass these values from your app to SDK, this data is only for test purpose
class PayUParams {

    static Map createPayUPaymentParamsForTPV() {
      var params = PayUParams.createPayUPaymentParams(PayUPaymentModeKeys.INTENT);
      params[PayUPaymentParamKey.beneficiary_account_number] = PayUTestCredentials.accountNumber;
      params[PayUPaymentParamKey.beneficiary_ifsc] = PayUTestCredentials.accountIFSC;
      params[PayUPaymentParamKey.hashes] = HashService.paymentTPVHash(params[PayUPaymentParamKey.transaction_id]);
      return params;
    }

    static Map createPayUPaymentParams(String paymentMode) {
        var additionalParam = {
          PayUAdditionalParamKeys.udf1: PayUTestCredentials.udf1,
          PayUAdditionalParamKeys.udf2: PayUTestCredentials.udf2,
          PayUAdditionalParamKeys.udf3: PayUTestCredentials.udf3,
          PayUAdditionalParamKeys.udf4: PayUTestCredentials.udf4,
          PayUAdditionalParamKeys.udf5: PayUTestCredentials.udf5
        };
        var payUPaymentParams = {
          PayUPaymentParamKey.key: PayUTestCredentials.merchantKey,
          PayUPaymentParamKey.amount: PayUTestCredentials.amount,
          PayUPaymentParamKey.product_info: PayUTestCredentials.productInfo,
          PayUPaymentParamKey.first_name: PayUTestCredentials.firstName,
          PayUPaymentParamKey.email: PayUTestCredentials.email,
          PayUPaymentParamKey.phone: PayUTestCredentials.phone,
          PayUPaymentParamKey.ios_surl: PayUTestCredentials.sUrl,
          PayUPaymentParamKey.ios_furl: PayUTestCredentials.fUrl,
          PayUPaymentParamKey.android_surl: PayUTestCredentials.sUrl,
          PayUPaymentParamKey.android_furl: PayUTestCredentials.fUrl,
          PayUPaymentParamKey.environment: "0", //0 => Production 1 => Test
          PayUPaymentParamKey.user_credentials: PayUTestCredentials.userCredential, //TODO: Pass user credential to fetch saved cards => A:B - Optional
          PayUPaymentParamKey.transaction_id:"PayU_" + DateTime.now().millisecondsSinceEpoch.toString(),
          PayUPaymentParamKey.additional_param: additionalParam,
          PayUPaymentParamKey.payment_mode: paymentMode,
          PayUPaymentParamKey.disable_intent_seamless_failure: "-1",
        };
    return payUPaymentParams;
  }
}


class PayUTestCredentials {
  static String merchantKey =""; //TODO: Add Merchant Key
  static String merchantSalt = "";
  static const sUrl = "https://cbjs.payu.in/sdk/success"; //TODO: Add Success URL.
  static const fUrl = "https://cbjs.payu.in/sdk/failure"; //TODO Add Fail URL.
  
  static String userCredential = ''; //TODO: Remove it

  static String accountNumber = ''; //TODO: Remove it

  static String accountIFSC = ''; //TODO: Remove it

  static String vpa = ''; //TODO: Remove it

  static const udf1 = "udf1";
  static const udf2 = "udf2";
  static const udf3 = "udf3";
  static const udf4 = "udf4";
  static const udf5 = "udf5";

  static const amount = "1";
  static const productInfo = "Info";
  static const firstName = "Abc";
  static const email = "test@gmail.com";
  static const phone = "9999999999";

  static const gPayScheme = "gpay";
  static const paytmScheme = "paytm";
  static const paytmPackageName = "net.one97.paytm";

  static var si_details = {
    PayUSIParamsKeys.is_free_trial: "0",
    PayUSIParamsKeys.si: '1',
    PayUSIParamsKeys.si_params: {
      PayUSIParamsKeys.is_free_trial: "0",
      PayUSIParamsKeys.billing_amount: '1', //Required
      PayUSIParamsKeys.billing_interval: 1, //Required
      PayUSIParamsKeys.payment_start_date: '2022-12-24', //Required
      PayUSIParamsKeys.payment_end_date: '2023-12-24', //Required
      PayUSIParamsKeys.billing_cycle: //Required
      'ONCE', // YEARLY | MONTHLY | WEEKLY | DAILY | ONCE | ADHOC
      PayUSIParamsKeys.billing_currency: 'INR',
      PayUSIParamsKeys.billing_limit: 'ON', //ON, BEFORE, AFTER
      PayUSIParamsKeys.billing_rule: 'MAX', //MAX, EXACT
      PayUSIParamsKeys.si: '1', //MAX, EXACT
    }
  };
}


class HashService {

  static Map paymentHash(String txnId) {
    var finalHashString = paymentHashString(txnId) + '|' + PayUTestCredentials.merchantSalt;
    var paymentHash = HashService.calculateHash(finalHashString);
    var hash = {PayUPaymentParamKey.payment: paymentHash};
    return hash;
  }

  static Map paymentTPVHash(String txnId) {

    var beneficiaryDetail =
        "{\"beneficiaryAccountNumber\":\"" +
            PayUTestCredentials.accountNumber +
            "\"" +
            ",\"ifscCode\":\"" +
            PayUTestCredentials.accountIFSC +
            "\"" +
            "}";

    var finalHashStirng = paymentHashString(txnId) + '|' + beneficiaryDetail + '|' + PayUTestCredentials.merchantSalt;

    var paymentHash = HashService.calculateHash(finalHashStirng);
    var hash = {PayUPaymentParamKey.payment: paymentHash};
    return hash;
  }

  static Map validateVPAHash(String vpa) {
    var vpaHash = HashService.calculateHash(PayUTestCredentials.merchantKey +
        '|' +
        "validateVPA" +
        '|' +
        vpa +
        '|' +
        PayUTestCredentials.merchantSalt);
    var hash = {PayUPaymentParamKey.validate_vpa: vpaHash};
    return hash;
  }

  static String paymentHashString(String txnId) {

    var hashString =
        '${PayUTestCredentials.merchantKey}|$txnId|${PayUTestCredentials.amount}|${PayUTestCredentials.productInfo}|${PayUTestCredentials.firstName}|${PayUTestCredentials.email}|${PayUTestCredentials.udf1}|${PayUTestCredentials.udf2}|${PayUTestCredentials.udf3}|${PayUTestCredentials.udf4}|${PayUTestCredentials.udf5}|||||';
    return hashString;
  }

  static String getSHA512Hash(String hashData) {
    var bytes = utf8.encode(hashData); // data being hashed
    var hash = sha512.convert(bytes);
    return hash.toString();
  }

  static String calculateHash(String data) {
    print("PayU flutter hash Stirng $data");
    var hash = getSHA512Hash(data);
    print("PayU flutter hashData $hash");
    //Don't use this method, get the hash from your backend.
    return hash;
  }
}
