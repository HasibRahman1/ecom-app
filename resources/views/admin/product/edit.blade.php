@extends('admin.master')

@section('body')
    <!-- PAGE-HEADER -->
    <div class="page-header">
        <div>
            <h1 class="page-title">Product Module</h1>
        </div>
        <div class="ms-auto pageheader-btn">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0);">Product</a></li>
                <li class="breadcrumb-item active" aria-current="page">Edit Product</li>
            </ol>
        </div>
    </div>
    <!-- PAGE-HEADER END -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header border-bottom">
                    <h3 class="card-title">Edit Product Form</h3>
                </div>
                <div class="card-body">
                    <p class="text-muted">{{session('message')}}</p>
                    <form class="form-horizontal" action="{{route('product.update', ['id' => $product->id])}}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row mb-4">
                            <label for="firstName" class="col-md-3 form-label">Category Name</label>
                            <div class="col-md-9">
                                <select class="form-control" name="category_id" onchange="getSubCategoryByCategory(this.value)">
                                    <option value="">--Select Category--</option>
                                    @foreach($categories as $category)
                                        <option value="{{$category->id}}" {{$category->id == $product->category_id ? 'selected' : ''}}> {{$category->name}} </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="firstName" class="col-md-3 form-label">Sub Category Name</label>
                            <div class="col-md-9">
                                <select class="form-control" name="sub_category_id" id="subCategoryId">
                                    <option value="">--Select Sub Category--</option>
                                    @foreach($sub_categories as $sub_category)
                                        <option value="{{$sub_category->id}}" @selected($sub_category->id == $product->sub_category_id)> {{$sub_category->name}} </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="firstName" class="col-md-3 form-label">Brand Name</label>
                            <div class="col-md-9">
                                <select class="form-control" name="brand_id">
                                    <option value="">--Select Brand--</option>
                                    @foreach($brands as $brand)
                                        <option value="{{$brand->id}}" @selected($brand->id == $product->brand_id)> {{$brand->name}} </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="firstName" class="col-md-3 form-label">Unit Name</label>
                            <div class="col-md-9">
                                <select class="form-control" name="unit_id">
                                    <option value="">--Select Unit--</option>
                                    @foreach($units as $unit)
                                        <option value="{{$unit->id}}" @selected($unit->id == $product->unit_id)> {{$unit->name}} </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="firstName1" class="col-md-3 form-label">Product Name</label>
                            <div class="col-md-9">
                                <input class="form-control" id="firstName1" value="{{$product->name}}" placeholder="Product Name" type="text" name="name"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="firstName2" class="col-md-3 form-label">Product Code</label>
                            <div class="col-md-9">
                                <input class="form-control" id="firstName2" value="{{$product->code}}" placeholder="Product Code" type="text" name="code"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="firstName3" class="col-md-3 form-label">Short Description</label>
                            <div class="col-md-9">
                                <textarea class="form-control" id="firstName3" placeholder="Product Description" name="short_description">{{$product->short_description}}</textarea>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="summernote" class="col-md-3 form-label">Long Description</label>
                            <div class="col-md-9">
                                <textarea class="form-control" id="summernote" name="long_description" placeholder="Product Long Description">{{$product->long_description}}</textarea>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label class="col-md-3 form-label">Product Price</label>
                            <div class="col-md-9">
                                <div class="input-group">
                                    <input class="form-control"  placeholder="Regular Price" value="{{$product->regular_price}}" type="number" name="regular_price"/>
                                    <input class="form-control"  placeholder="Selling Price" value="{{$product->selling_price}}" type="number" name="selling_price"/>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="firstName21" class="col-md-3 form-label">Stock Amount</label>
                            <div class="col-md-9">
                                <input class="form-control" id="firstName21" value="{{$product->stock_amount}}" placeholder="Product Stock Amount" type="number" name="stock_amount"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="image" class="col-md-3 form-label">Product Image</label>
                            <div class="col-md-9">
                                <input class="form-control" id="image" type="file" name="image"/>
                                <img src="{{asset($product->image)}}" alt="" height="70" width="90"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="otherImage" class="col-md-3 form-label">Product Other Image</label>
                            <div class="col-md-9">
                                <input class="form-control" id="otherImage" type="file" name="other_image[]" multiple/>
                                @foreach($product->otherImages as $otherImage)
                                    <img src="{{asset($otherImage->image)}}" alt="" height="70" width="90"/>
                                @endforeach
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label class="col-md-3">Publication Status</label>
                            <div class="col-md-9">
                                <label><input type="radio" name="status" {{$product->status == 1 ? 'checked' : ''}} value="1" checked> Published</label>
                                <label><input type="radio" name="status" {{$product->status == 0 ? 'checked' : ''}} value="0"> Unpublished</label>
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit">Update Product Info</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
