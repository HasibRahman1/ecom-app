<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\SubCategory;
use Illuminate\Http\Request;

class APIController extends Controller
{
    private $categories, $product, $products, $productImages;

    public function getAllCategory()
    {
        $this->categories = Category::all();
        foreach ($this->categories as $category)
        {
            $category->sub_category = SubCategory::where('category_id', $category->id)->get();
        }
        return response()->json($this->categories);
    }

    public function getAllTrendingProduct()
    {
        $this->products = Product::orderBy('id', 'desc')->take(8)->get(['id', 'name', 'selling_price', 'image']);
        foreach ($this->products as $product)
        {
            $product->image = asset($product->image);
        }
        return response()->json($this->products);
    }

    public function getProductByCategory($id)
    {
        $this->products = Product::where('category_id', $id)->orderBy('id', 'desc')->get(['id', 'name', 'selling_price', 'image']);
        foreach ($this->products as $product)
        {
            $product->image = asset($product->image);
        }
        return response()->json($this->products);
    }

    public function getProductImages($id)
    {
        $this->productImages = ProductImage::where('product_id', $id)->get();
        foreach ($this->productImages as $product)
        {
            $product->image = asset($product->image);
        }
        return response()->json($this->productImages);
    }

    public function getProductInfo($id)
    {
        $this->product = Product::find($id);
        return response()->json($this->product);
    }
}
