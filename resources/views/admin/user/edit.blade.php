@extends('admin.master')

@section('body')
    <!-- PAGE-HEADER -->
    <div class="page-header">
        <div>
            <h1 class="page-title">User Module</h1>
        </div>
        <div class="ms-auto pageheader-btn">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0);">User</a></li>
                <li class="breadcrumb-item active" aria-current="page">Edit User</li>
            </ol>
        </div>
    </div>
    <!-- PAGE-HEADER END -->
    <!-- Row -->
    <div class="row row-sm">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header border-bottom">
                    <h3 class="card-title">Edit User Form</h3>
                </div>
                <div class="card-body">
                    <form class="form-horizontal" action="{{route('user.update', $user->id)}}" method="POST" enctype="multipart/form-data">
                        @method('PUT')
                        @csrf
                        <div class="row mb-4">
                            <label for="firstName" class="col-md-3 form-label">User Name</label>
                            <div class="col-md-9">
                                <input class="form-control" id="firstName" value="{{$user->name}}" placeholder="User Name" type="text" name="name"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="" class="col-md-3 form-label">User Email</label>
                            <div class="col-md-9">
                                <input class="form-control" id="" value="{{$user->email}}" placeholder="User Email" type="email" name="email"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="" class="col-md-3 form-label">User Password</label>
                            <div class="col-md-9">
                                <input class="form-control" id="" value="" placeholder="User Password" type="password" name="password"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="" class="col-md-3 form-label">User Mobile</label>
                            <div class="col-md-9">
                                <input class="form-control" id="" value="{{$user->mobile}}" placeholder="User Mobile" type="number" name="mobile"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="image" class="col-md-3 form-label">User Image</label>
                            <div class="col-md-9">
                                <input class="form-control" id="image" type="file" name="profile_photo_path"/>
                                <img src="{{asset($user->profile_photo_path)}}" alt="" height="100" width="100"/>
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit">Update User Info</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Row -->
@endsection

