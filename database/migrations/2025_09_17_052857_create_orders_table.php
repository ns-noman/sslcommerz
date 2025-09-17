<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();

            $table->string('tran_id')->unique();

            # Payment info
            $table->decimal('total_amount', 10, 2);
            $table->string('currency', 10);
            $table->string('status')->default('Pending');

            # Customer info
            $table->string('cus_name')->nullable();
            $table->string('cus_email')->nullable();
            $table->string('cus_add1')->nullable();
            $table->string('cus_add2')->nullable();
            $table->string('cus_city')->nullable();
            $table->string('cus_state')->nullable();
            $table->string('cus_postcode')->nullable();
            $table->string('cus_country')->nullable();
            $table->string('cus_phone')->nullable();
            $table->string('cus_fax')->nullable();

            # Shipping info
            $table->string('ship_name')->nullable();
            $table->string('ship_add1')->nullable();
            $table->string('ship_add2')->nullable();
            $table->string('ship_city')->nullable();
            $table->string('ship_state')->nullable();
            $table->string('ship_postcode')->nullable();
            $table->string('ship_phone')->nullable();
            $table->string('ship_country')->nullable();

            # Product info
            $table->string('shipping_method')->nullable();
            $table->string('product_name')->nullable();
            $table->string('product_category')->nullable();
            $table->string('product_profile')->nullable();

            # Optional params
            $table->string('value_a')->nullable();
            $table->string('value_b')->nullable();
            $table->string('value_c')->nullable();
            $table->string('value_d')->nullable();

            $table->timestamps();

        });
    }
    public function down()
    {
        Schema::dropIfExists('orders');
    }
};
