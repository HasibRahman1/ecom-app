<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\Order;
use Illuminate\Http\Request;
use Session;
use function Symfony\Component\Translation\t;

class CustomerAuthController extends Controller
{
    private $customer, $orders;

    public function index()
    {
        return view('website.customer.login');
    }

    public function login(Request $request)
    {
        $this->customer = Customer::where('email', $request->user_name)->orWhere('mobile', $request->user_name)->first();
        if ($this->customer)
        {
            if (password_verify($request->password, $this->customer->password))
            {
                Session::put('customer_id', $this->customer->id);
                Session::put('customer_name', $this->customer->name);

                return redirect('/customer-dashboard');
            }
            else
            {
                return back()->with('message', 'Your password is invalid.');
            }
        }
        else
        {
            return back()->with('message', 'Sorry your email or mobile is invalid.');
        }
    }

    public function register()
    {
        return view('website.customer.register');
    }

    public function newCustomer(Request $request)
    {
        $this->customer = Customer::newCustomer($request);

        Session::put('customer_id', $this->customer->id);
        Session::put('customer_name', $this->customer->name);

        return redirect('/customer-dashboard');
    }

    public function dashboard()
    {
        $this->orders = Order::where('customer_id', Session::get('customer_id'))->orderBy('id', 'desc')->get();
        return view('website.customer.dashboard', ['orders' => $this->orders]);
    }


    public function changePassword()
    {
        return view('website.customer.change-password');
    }

    public function updatePassword(Request $request)
    {
        $this->customer = Customer::find(Session::get('customer_id'));
        if (password_verify($request->current_password , $this->customer->password))
        {

            if ($request->new_password == $request->confirm_password)
            {
                $this->customer->password = bcrypt($request->new_password);
                $this->customer->save();

                return redirect('/customer-dashboard')->with('message', 'Thank your .. password info update successfully.');
            }
            else
            {
                return back()->with('message', 'Sorry New Password & Confirm New Password not match.');
            }

        }
        else
        {
            return back()->with('message', 'Sorry your current password is invalid.');
        }
    }

    public function logout()
    {
        Session::forget('customer_id');
        Session::forget('customer_name');

        return redirect('/');
    }
}
