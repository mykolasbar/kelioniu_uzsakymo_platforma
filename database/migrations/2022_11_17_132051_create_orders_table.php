<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hotels_user', function (Blueprint $table) {
            $table->id();
            // $table->unsignedBigInteger('hotels_id')->nullable;
            // $table->unsignedBigInteger('user_id')->nullable;
            $table->timestamps();
            // $table->foreign('hotels_id')->references('id')->on('Hotels')->onDelete('cascade')->onUpdate('restrict');
            // $table->foreign('user_id')->references('id')->on('User')->onDelete('cascade')->onUpdate('restrict');
            $table->foreignId('hotels_id')->constrained('hotels')->onDelete('cascade')->onUpdate('restrict')->nullable;
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade')->onUpdate('restrict')->nullable;
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
};
