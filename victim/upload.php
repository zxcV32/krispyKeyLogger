<?php
$uploadOk = 1;  #variable to check whether to allow uploaded file
if($_FILES){ # if a file is sent using POST method
$target_file=key($_FILES);
$fileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
    if (filesize($target_file) >= $_FILES[key($_FILES)]["tmp_name"] || filesize($_FILES[key($_FILES)]["tmp_name"]) < 1 || filesize($_FILES[key($_FILES)]["tmp_name"]) > 5242880) {
      $uploadOk = 0;
    }
    if($uploadOk==1) #moving file in temp folder to specified folder.
      $result = move_uploaded_file($_FILES[key($_FILES)]["tmp_name"], "/home/user/Krispy_logs/".$_FILES[key($_FILES)]['name'].".deactivate");
  }
?>
