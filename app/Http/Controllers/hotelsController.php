<?php

namespace App\Http\Controllers;

use App\Models\Hotels;
use App\Models\Orders;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class hotelsController extends Controller
{

    public function showAllHotels(Request $request)
    {
        // if ($request->embed === 'hotels'){
        //     return Countries::with('hotels')->get();}
        return Hotels::with('user')->get();
    }

    public function showSingleHotel($hotelid)
    {

        $singlePost = Hotels::find($hotelid);
        return $singlePost;
    }

    public function showHotelsInCountry($countryid)
    {

        $hotels = DB::table('hotels')->where('countries_id', '=', $countryid)->get();
        return $hotels;
    }

    public function addHotel (Request $request)
    {
        $request->validate([
            "title"=>"required",
            "price"=>"required",
            "picture"=>"image|mimes:jpeg,png,jpg,gif,svg",
            "durationofjourny"=>"required",
            "countries_id"=>"required"
        ]);

        if ($request->hasFile('picture')) {
            $path = $request->picture->storeAs('images', $request->picture->getClientOriginalName());
        }
        else $path = 'aaa';

        $newHotel = new Hotels();
        $newHotel->title = $request->title;
        $newHotel->price = $request->price;
        $newHotel->picture = $path;
        $newHotel->durationofjourny = $request->durationofjourny;
        $newHotel->countries_id = $request->countries_id;
        $newHotel->save();
    }

    public function updateHotel(Request $request, $id)
    {
        $request->validate([
            "title"=>"required",
            "price"=>"required",
            "picture"=>"image|mimes:jpeg,png,jpg,gif,svg",
            "durationofjourny"=>"required",
            "countries_id"=>"required",
        ]);
        $hotel = Hotels::find($id);
        $hotel->update($request->all());
    }

    public function deleteHotel($id) {
        Hotels::destroy($id);
    }

    public function addOrder(Request $request)
    {
        $request->validate([
            "ivertinimai"=>"required",
            "meals_id"=>"required",
        ]);

        $newOrder = new Orders();
        $newOrder->hotels_id = $request->hotels_id;
        $newOrder->user_id = $request->user_id;
        $newOrder->save();
    }

    // public function showMeal($id) {
    //     return Meals::find($id);
    // }

    public function showAllOrders()
    {
        return Orders::with(['Hotels', 'User'])->get();
    }

    public function searchHotels(Request $request)
    {

        $query = $request->input('query');

            $queryresults = DB::table('hotels')->where('title', 'like', '%' . $query . '%')->get();
                // ->orWhere('email', 'like', '%' . request('search') . '%')
                // ->orWhere('id', 'like', '%' . request('search') . '%');

        return $queryresults;
    }

}
