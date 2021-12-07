<?php

namespace App\Http\Controllers;

use Config;

use Illuminate\Http\Request;

use App\Ministry;
use App\Type;
use App\User;

class ContribController extends Controller
{

    public function __construct()
    {
        // Security
        // $this->middleware('accounts');
    }

    /**
     * Display a dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function dashboard()
    {
        // Set security controller
        // $security = new SecurityController();
        // return view('dashboard', compact('security'));
        
        return view('dashboard');

    }

}
