<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\hotelsController;
use App\Http\Controllers\ordersController;
use App\Http\Controllers\countriesController;
use App\Http\Controllers\authorizationController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/countries', [countriesController::class, 'showAllCountries']);

Route::get('/countries/{id}', [countriesController::class, 'showSingleCountry']);

Route::post('/newcountry', [countriesController::class, 'addCountry']);

Route::delete('/deletecountry/{id}', [countriesController::class, 'deleteCountry']);

Route::put('/updatecountry/{id}', [countriesController::class, 'updateCountry']);

Route::get('/hotels', [hotelsController::class, 'showAllHotels']);

Route::get('/hotels/{countryid}', [hotelsController::class, 'showHotelsInCountry']);

Route::get('/hotel/{hotelid}', [hotelsController::class, 'showSingleHotel']);

Route::post('/newhotel', [hotelsController::class, 'addHotel']);

Route::put('/updatehotel', [hotelsController::class, 'updateHotel']);

Route::get('/orders', [ordersController::class, 'showAllOrders']);

Route::post('/addreservation', [ordersController::class, 'addReservation'])->middleware('auth:sanctum', 'abilities:user-abilities');

Route::put('/confirmreservation/{id}', [ordersController::class, 'confirmReservation']);

Route::get('/getreservations/{userid}', [ordersController::class, 'getReservations']);

Route::get('/search', [hotelsController::class, 'searchHotels']);

Route::post('/register', [authorizationController::class, 'register']);

Route::post('/login', [authorizationController::class, 'login']);

Route::post('/logout', [authorizationController::class, 'logout'])->middleware('auth:sanctum', 'abilities:user-abilities');


// Route::post('/addevaluation', [mealsController::class, 'addEvaluation', 'abilities:user-abilities']);


// ->middleware('auth:sanctum', 'abilities:admin-abilities');

