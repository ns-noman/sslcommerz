<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SslCommerzPaymentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    // return view('welcome');
    return redirect()->route('sslcommerz.checkout.easy');
});

// SSLCOMMERZ Start
Route::get('/checkout-easy', [SslCommerzPaymentController::class, 'exampleEasyCheckout'])->name('sslcommerz.checkout.easy');
Route::get('/checkout-hosted', [SslCommerzPaymentController::class, 'exampleHostedCheckout'])->name('sslcommerz.checkout.hosted');

Route::post('/pay', [SslCommerzPaymentController::class, 'index'])->name('sslcommerz.pay');
Route::post('/pay-via-ajax', [SslCommerzPaymentController::class, 'payViaAjax'])->name('sslcommerz.pay.via.ajax');
Route::post('/success', [SslCommerzPaymentController::class, 'success'])->name('sslcommerz.success');
Route::post('/fail', [SslCommerzPaymentController::class, 'fail'])->name('sslcommerz.fail');
Route::post('/cancel', [SslCommerzPaymentController::class, 'cancel'])->name('sslcommerz.cancel');
Route::post('/ipn', [SslCommerzPaymentController::class, 'ipn'])->name('sslcommerz.ipn');
//SSLCOMMERZ END
