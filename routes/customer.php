<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CustomerAuthController;


Route::middleware(['customer'])->group(function () {

    Route::get('/customer-dashboard', [CustomerAuthController::class, 'dashboard'])->name('customer.dashboard');
    Route::get('/customer/change-password', [CustomerAuthController::class, 'changePassword'])->name('customer.change-password');
    Route::post('/customer/update-password', [CustomerAuthController::class, 'updatePassword'])->name('customer.update-password');
    Route::get('/customer-logout', [CustomerAuthController::class, 'logout'])->name('customer-logout');
});

