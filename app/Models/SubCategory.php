<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;
    private static $subCategory, $image, $imageName, $extension, $directory, $imageUrl;

    public static function newSubCategory($request)
    {
        self::$image        = $request->file('image');
        self::$extension    = self::$image->getClientOriginalExtension();
        self::$imageName    = time().'.'.self::$extension;
        self::$directory    = 'uploads/sub-category-images/';
        self::$image->move(self::$directory, self::$imageName);
        self::$imageUrl     = self::$directory.self::$imageName;

        self::$subCategory = new SubCategory();
        self::$subCategory->category_id = $request->category_id;
        self::$subCategory->name        = $request->name;
        self::$subCategory->description = $request->description;
        self::$subCategory->image       = self::$imageUrl;
        self::$subCategory->status      = $request->status;
        self::$subCategory->save();
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public static function updateSubCategory($request, $id)
    {
        self::$subCategory = SubCategory::find($id);
        if($request->file('image'))
        {
            if (file_exists(self::$subCategory->image)) // check image exist or not in folder
            {
                unlink(self::$subCategory->image); // remove image from folder
            }

            self::$image        = $request->file('image');
            self::$extension    = self::$image->getClientOriginalExtension();
            self::$imageName    = time().'.'.self::$extension;
            self::$directory    = 'uploads/sub-category-images/';
            self::$image->move(self::$directory, self::$imageName);
            self::$imageUrl     = self::$directory.self::$imageName;
        }
        else
        {
            self::$imageUrl = self::$subCategory->image;
        }

        self::$subCategory->category_id = $request->category_id;
        self::$subCategory->name        = $request->name;
        self::$subCategory->description = $request->description;
        self::$subCategory->image       = self::$imageUrl;
        self::$subCategory->status      = $request->status;
        self::$subCategory->save();
    }
}
