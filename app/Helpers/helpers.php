<?php

function imageUpload($image, $directory)
{
    $extension    = $image->getClientOriginalExtension();
    $imageName    = time().'.'.$extension; // 13256432.jpg
    $image->move($directory, $imageName);
    return $directory.$imageName;
}
