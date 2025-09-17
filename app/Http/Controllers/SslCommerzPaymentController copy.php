<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;
use App\Library\SslCommerz\SslCommerzNotification;

class SslCommerzPaymentController extends Controller
{

    public function exampleEasyCheckout()
    {
        return view('exampleEasycheckout');
    }

    public function exampleHostedCheckout()
    {
        return view('exampleHosted');
    }

    public function index(Request $request)
    {
        // Decode cart JSON if provided
        $cart = json_decode($request->input('cart_json', '{}'), true);

        // Prepare post_data
        $post_data = [];
        $post_data['total_amount'] = $cart['total_amount'] ?? $request->input('amount', 10);
        $post_data['currency'] = $cart['currency'] ?? $request->input('currency', 'BDT');
        $post_data['tran_id'] = uniqid(); // always unique

        // CUSTOMER INFORMATION
        $post_data['cus_name'] = $cart['cus_name'] ?? $request->input('cus_name', 'Customer Name');
        $post_data['cus_email'] = $cart['cus_email'] ?? $request->input('cus_email', 'customer@mail.com');
        $post_data['cus_add1'] = $cart['cus_addr1'] ?? $request->input('cus_add1', 'Customer Address');
        $post_data['cus_add2'] = $cart['cus_addr2'] ?? $request->input('cus_add2', '');
        $post_data['cus_city'] = $cart['cus_city'] ?? $request->input('cus_city', '');
        $post_data['cus_state'] = $cart['cus_state'] ?? $request->input('cus_state', '');
        $post_data['cus_postcode'] = $cart['cus_postcode'] ?? $request->input('cus_postcode', '');
        $post_data['cus_country'] = $cart['cus_country'] ?? $request->input('cus_country', 'Bangladesh');
        $post_data['cus_phone'] = $cart['cus_phone'] ?? $request->input('cus_phone', '8801XXXXXXXXX');
        $post_data['cus_fax'] = $cart['cus_fax'] ?? $request->input('cus_fax', '');

        // SHIPMENT INFORMATION
        $post_data['ship_name'] = $cart['ship_name'] ?? $request->input('ship_name', 'Store Test');
        $post_data['ship_add1'] = $cart['ship_add1'] ?? $request->input('ship_add1', 'Dhaka');
        $post_data['ship_add2'] = $cart['ship_add2'] ?? $request->input('ship_add2', 'Dhaka');
        $post_data['ship_city'] = $cart['ship_city'] ?? $request->input('ship_city', 'Dhaka');
        $post_data['ship_state'] = $cart['ship_state'] ?? $request->input('ship_state', 'Dhaka');
        $post_data['ship_postcode'] = $cart['ship_postcode'] ?? $request->input('ship_postcode', '1000');
        $post_data['ship_phone'] = $cart['ship_phone'] ?? $request->input('ship_phone', '');
        $post_data['ship_country'] = $cart['ship_country'] ?? $request->input('ship_country', 'Bangladesh');

        $post_data['shipping_method'] = $cart['shipping_method'] ?? $request->input('shipping_method', 'NO');
        $post_data['product_name'] = $cart['product_name'] ?? $request->input('product_name', 'Computer');
        $post_data['product_category'] = $cart['product_category'] ?? $request->input('product_category', 'Goods');
        $post_data['product_profile'] = $cart['product_profile'] ?? $request->input('product_profile', 'physical-goods');

        // OPTIONAL PARAMETERS
        $post_data['value_a'] = $cart['value_a'] ?? $request->input('value_a', 'ref001');
        $post_data['value_b'] = $cart['value_b'] ?? $request->input('value_b', 'ref002');
        $post_data['value_c'] = $cart['value_c'] ?? $request->input('value_c', 'ref003');
        $post_data['value_d'] = $cart['value_d'] ?? $request->input('value_d', 'ref004');

        $post_data['status'] = 'Pending';

        // Optional: save the full cart JSON
        $post_data['cart_json'] = $request->input('cart_json');

        // Insert or update order before initiating payment
        DB::table('orders')->updateOrInsert(
            ['tran_id' => $post_data['tran_id']], // unique condition
            $post_data
        );


        // Call SSLCOMMERZ
        $sslc = new SslCommerzNotification();
        $payment_options = $sslc->makePayment($post_data, 'hosted');

        if (!is_array($payment_options)) {
            print_r($payment_options);
        }
    }


    public function payViaAjax(Request $request)
    {
        // Decode cart JSON
        $cart = json_decode($request->input('cart_json', '{}'), true);

        // Prepare post_data
        $post_data = [];
        $post_data['total_amount'] = $cart['total_amount'] ?? 10.00;
        $post_data['currency'] = $cart['currency'] ?? 'BDT';
        $post_data['tran_id'] = uniqid();

        // Customer info from cart
        $post_data['cus_name'] = $cart['cus_name'] ?? 'Customer Name';
        $post_data['cus_email'] = $cart['cus_email'] ?? 'customer@mail.com';
        $post_data['cus_add1'] = $cart['cus_addr1'] ?? 'Customer Address';
        $post_data['cus_add2'] = $cart['cus_addr2'] ?? '';
        $post_data['cus_city'] = $cart['cus_city'] ?? '';
        $post_data['cus_state'] = $cart['cus_state'] ?? '';
        $post_data['cus_postcode'] = $cart['cus_postcode'] ?? '';
        $post_data['cus_country'] = $cart['cus_country'] ?? 'Bangladesh';
        $post_data['cus_phone'] = $cart['cus_phone'] ?? '8801XXXXXXXXX';
        $post_data['cus_fax'] = $cart['cus_fax'] ?? '';

        // Default shipping info (can be updated from request if needed)
        $post_data['ship_name'] = 'Store Test';
        $post_data['ship_add1'] = 'Dhaka';
        $post_data['ship_add2'] = 'Dhaka';
        $post_data['ship_city'] = 'Dhaka';
        $post_data['ship_state'] = 'Dhaka';
        $post_data['ship_postcode'] = '1000';
        $post_data['ship_phone'] = '';
        $post_data['ship_country'] = 'Bangladesh';

        $post_data['shipping_method'] = 'NO';
        $post_data['product_name'] = 'Computer';
        $post_data['product_category'] = 'Goods';
        $post_data['product_profile'] = 'physical-goods';

        // Optional parameters
        $post_data['value_a'] = 'ref001';
        $post_data['value_b'] = 'ref002';
        $post_data['value_c'] = 'ref003';
        $post_data['value_d'] = 'ref004';

        $post_data['status'] = 'Pending';

        // Insert or update order
        DB::table('orders')->updateOrInsert(
            ['tran_id' => $post_data['tran_id']],
            $post_data
        );

        // Initiate SSLCOMMERZ payment

        \Log::info('SSL Post Data:', context: $post_data);

        $sslc = new SslCommerzNotification();
        $payment_options = $sslc->makePayment($post_data, 'checkout', 'json');

        if (!is_array($payment_options)) {
            print_r(value: $payment_options);
            $payment_options = [];
        }
        return response()->json($payment_options);
    }



    public function success(Request $request)
    {
        echo "Transaction is Successful";

        $tran_id = $request->input('tran_id');
        $amount = $request->input('amount');
        $currency = $request->input('currency');

        $sslc = new SslCommerzNotification();

        #Check order status in order tabel against the transaction id or order id.
        $order_details = DB::table('orders')
            ->where('tran_id', $tran_id)
            ->select('tran_id', 'status', 'currency', 'amount')->first();

        if ($order_details->status == 'Pending') {
            $validation = $sslc->orderValidate($request->all(), $tran_id, $amount, $currency);

            if ($validation) {
                /*
                That means IPN did not work or IPN URL was not set in your merchant panel. Here you need to update order status
                in order table as Processing or Complete.
                Here you can also sent sms or email for successfull transaction to customer
                */
                $update_product = DB::table('orders')
                    ->where('tran_id', $tran_id)
                    ->update(['status' => 'Processing']);

                echo "<br >Transaction is successfully Completed";
            }
        } else if ($order_details->status == 'Processing' || $order_details->status == 'Complete') {
            /*
             That means through IPN Order status already updated. Now you can just show the customer that transaction is completed. No need to udate database.
             */
            echo "Transaction is successfully Completed";
        } else {
            #That means something wrong happened. You can redirect customer to your product page.
            echo "Invalid Transaction";
        }


    }

    public function fail(Request $request)
    {
        $tran_id = $request->input('tran_id');

        $order_details = DB::table('orders')
            ->where('tran_id', $tran_id)
            ->select('tran_id', 'status', 'currency', 'amount')->first();

        if ($order_details->status == 'Pending') {
            $update_product = DB::table('orders')
                ->where('tran_id', $tran_id)
                ->update(['status' => 'Failed']);
            echo "Transaction is Falied";
        } else if ($order_details->status == 'Processing' || $order_details->status == 'Complete') {
            echo "Transaction is already Successful";
        } else {
            echo "Transaction is Invalid";
        }

    }

    public function cancel(Request $request)
    {
        $tran_id = $request->input('tran_id');

        $order_details = DB::table('orders')
            ->where('tran_id', $tran_id)
            ->select('tran_id', 'status', 'currency', 'amount')->first();

        if ($order_details->status == 'Pending') {
            $update_product = DB::table('orders')
                ->where('tran_id', $tran_id)
                ->update(['status' => 'Canceled']);
            echo "Transaction is Cancel";
        } else if ($order_details->status == 'Processing' || $order_details->status == 'Complete') {
            echo "Transaction is already Successful";
        } else {
            echo "Transaction is Invalid";
        }


    }

    public function ipn(Request $request)
    {
        #Received all the payement information from the gateway
        if ($request->input('tran_id')) #Check transation id is posted or not.
        {

            $tran_id = $request->input('tran_id');

            #Check order status in order tabel against the transaction id or order id.
            $order_details = DB::table('orders')
                ->where('tran_id', $tran_id)
                ->select('tran_id', 'status', 'currency', 'amount')->first();

            if ($order_details->status == 'Pending') {
                $sslc = new SslCommerzNotification();
                $validation = $sslc->orderValidate($request->all(), $tran_id, $order_details->amount, $order_details->currency);
                if ($validation == TRUE) {
                    /*
                    That means IPN worked. Here you need to update order status
                    in order table as Processing or Complete.
                    Here you can also sent sms or email for successful transaction to customer
                    */
                    $update_product = DB::table('orders')
                        ->where('tran_id', $tran_id)
                        ->update(['status' => 'Processing']);

                    echo "Transaction is successfully Completed";
                }
            } else if ($order_details->status == 'Processing' || $order_details->status == 'Complete') {

                #That means Order status already updated. No need to udate database.

                echo "Transaction is already successfully Completed";
            } else {
                #That means something wrong happened. You can redirect customer to your product page.

                echo "Invalid Transaction";
            }
        } else {
            echo "Invalid Data";
        }
    }

}
