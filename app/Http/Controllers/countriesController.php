<?php

namespace App\Http\Controllers;

use App\Models\Countries;
use Illuminate\Http\Request;

class countriesController extends Controller
{
    public function showAllCountries(Request $request)
    {
        if ($request->embed === 'hotels'){
            return Countries::with('hotels')->get();}
        return Countries::all();
    }

    public function showSingleCountry($id)
    {
        $singlePost = Countries::find($id);
        return $singlePost;
    }

    public function addCountry(Request $request)
    {
        $request->validate([
            "name"=>"required",
            "season"=>"required",
        ]);

        $newPost = new Countries();
        $newPost->name = $request->name;
        $newPost->season = $request->season;
        $newPost->save();
    }

    public function updateCountry(Request $request, $id)
    {
        $request->validate([
            "name"=>"required",
            "season"=>"required",
        ]);
        $post = Countries::find($id);
        $post->update($request->all());
    }

    public function deleteCountry($id)
    {
        return Countries::destroy($id);
    }
}
