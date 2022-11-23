<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Hotels;
use App\Models\Orders;
use App\Models\HotelsUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ordersController extends Controller
{
    public function showAllOrders()
    {
        // if ($request->embed === 'hotels'){
        //     return Countries::with('hotels')->get();}

        // return Hotels::with('user')->get();
        // return Hotels::find(2)->user()->first()->pivot;
        // $orders = DB::table('hotels_user')->get();
        // return $orders;

        return HotelsUser::with('user', 'hotels')->get();
    }

    public function addReservation(Request $request)
    {
        $request->validate([
            "hotels_id"=>"required",
            "user_id"=>"required",
        ]);

        $newReservation = HotelsUser::firstOrCreate(
            ['hotels_id' => $request->hotels_id],
            ['user_id' => $request->user_id]
        );
    }

    public function confirmReservation($id)
    {
        $order = HotelsUser::find($id);
        $order->confirmed = true;
        $order->save();
    }

    public function getReservations(Request $request, $userid)
    {
        $queryresults = DB::table('hotels_user')->where('user_id', '=', $userid)->get();
        return $queryresults;
    }

}
