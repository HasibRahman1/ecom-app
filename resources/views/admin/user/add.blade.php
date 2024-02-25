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
                <li class="breadcrumb-item active" aria-current="page">Add User</li>
            </ol>
        </div>
    </div>
    <!-- PAGE-HEADER END -->
    <!-- Row -->
    <div class="row row-sm">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header border-bottom">
                    <h3 class="card-title">Add User Form</h3>
                </div>
                <div class="card-body">
                    <p class="text-muted">{{session('message')}}</p>
                    <form class="form-horizontal" action="{{route('user.store')}}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row mb-4">
                            <label for="firstName" class="col-md-3 form-label">User Name</label>
                            <div class="col-md-9">
                                <input class="form-control" id="firstName" placeholder="User Name" type="text" name="name"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="" class="col-md-3 form-label">User Email</label>
                            <div class="col-md-9">
                                <input class="form-control" id="" placeholder="User Email" type="email" name="email"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="" class="col-md-3 form-label">User Password</label>
                            <div class="col-md-9">
                                <input class="form-control" id="" placeholder="User Password" type="password" name="password"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="" class="col-md-3 form-label">User Mobile</label>
                            <div class="col-md-9">
                                <input class="form-control" id="" placeholder="User Mobile" type="number" name="mobile"/>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <label for="image" class="col-md-3 form-label">User Image</label>
                            <div class="col-md-9">
                                <input class="form-control" id="image" type="file" name="profile_photo_path"/>
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit">Create New User</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Row -->
@endsection
