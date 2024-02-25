<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\APIController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/get-all-category', [APIController::class, 'getAllCategory'])->name('get-all-category');
Route::get('/get-all-trending-product', [APIController::class, 'getAllTrendingProduct'])->name('get-all-trending-product');
Route::get('/get-all-category-product/{id}', [APIController::class, 'getProductByCategory'])->name('get-all-category-product');
Route::get('/get-product-images/{id}', [APIController::class, 'getProductImages'])->name('get-product-images');
Route::get('/get-product-info/{id}', [APIController::class, 'getProductInfo'])->name('get-product-info');
