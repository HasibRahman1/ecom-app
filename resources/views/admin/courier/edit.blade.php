@extends('admin.master')

@section('body')
    <!-- PAGE-HEADER -->
    <div class="page-header">
        <div>
            <h1 class="page-title">Courier Module</h1>
        </div>
        <div class="ms-auto pageheader-btn">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0);">Courier</a></li>
                <li class="breadcrumb-item active" aria-current="page">Add Courier</li>
            </ol>
        </div>
    </div>
    <!-- PAGE-HEADER END -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header border-bottom">
                    <h3 class="card-title">Add Courier Form</h3>
                </div>
                <div class="card-body">
                    <p class="text-muted">{{session('message')}}</p>
                    <form class="form-horizontal" action="{{route('courier.update', $courier->id)}}" method="POST">
                        @method('PUT')
                        @csrf
                        <div class="row mb-4">
                            <label for="firstName" class="col-md-3 form-label">Courier Name</label>
                            <div class="col-md-9">
                                <input class="form-control" id="firstName" value="{{$courier->name}}" placeholder="Courier Name" type="text" name="name"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="" class="col-md-3 form-label">Courier Email</label>
                            <div class="col-md-9">
                                <input class="form-control" id="" value="{{$courier->email}}" placeholder="Courier Email" type="email" name="email"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="" class="col-md-3 form-label">Courier Mobile</label>
                            <div class="col-md-9">
                                <input class="form-control" id=""  value="{{$courier->mobile}}" placeholder="Courier Email" type="number" name="mobile"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="" class="col-md-3 form-label">Courier Cost</label>
                            <div class="col-md-9">
                                <input class="form-control" value="{{$courier->cost}}" id="" placeholder="Courier Cost" type="number" name="cost"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="lastName" class="col-md-3 form-label">Courier Address</label>
                            <div class="col-md-9">
                                <textarea class="form-control" id="lastName" name="address" placeholder="Courier Address">{{$courier->address}}</textarea>
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit">Update Courier Info</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
