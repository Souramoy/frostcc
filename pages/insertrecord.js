// <?php
// //if set page
// extract($_POST);

// if(isset($_POST['submit']))
// {
// 	$res = array("res" => "yesIsset");
// }
// else
// {
// 	$res = array("res" => "noIsset", "msg" => $exam_id);
// }


// echo json_encode($res);

// //select data 
// $exmneId = $_SESSION['examineeSession']['exmne_id'];

// // Select Data in the login examinee
// $selExmneeData = $conn->query("SELECT * FROM examinee_tbl WHERE exmne_id='$exmneId' ")->fetch(PDO::FETCH_ASSOC);
// $exmneCourse =  $selExmneeData['exmne_course'];


        
// // Select and start the exam depending on the course you login
// $selExam = $conn->query("SELECT * FROM exam_tbl WHERE cou_id='$exmneCourse' ORDER BY ex_id DESC ");

// //select exam attempt 
 
// include("../conn.php");
// $exmneId = $_SESSION['examineeSession']['exmne_id'];
 

// // extract($_POST);

//  $selExamAttmpt = $conn->query("SELECT * FROM exam_attempt WHERE exmne_id='$exmneId' AND exam_id='$thisId' ");

//  if($selExamAttmpt->rowCount() > 0)
//  {
//  	$res = array("res" => "alreadyExam", "msg" => $thisId);
//  }
//  else
//  {
//  	$res = array("res" => "takeNow");
//  }


//  echo json_encode($res);

// // submit answer 
// // session_start(); 
// //  include("../conn.php");
// //  extract($_POST);

//  $exmne_id = $_SESSION['examineeSession']['exmne_id'];



// $selExAttempt = $conn->query("SELECT * FROM exam_attempt WHERE exmne_id='$exmne_id' AND exam_id='$exam_id'  ");

// $selAns = $conn->query("SELECT * FROM exam_answers WHERE axmne_id='$exmne_id' AND exam_id='$exam_id' ");
 
// if($selExAttempt->rowCount() > 0)
// {
// 	$res = array("res" => "alreadyTaken");
// }
// else if($selAns->rowCount() > 0)
// {
// 	$updLastAns = $conn->query("UPDATE exam_answers SET exans_status='old' WHERE axmne_id='$exmne_id' AND exam_id='$exam_id'  ");
// 	if($updLastAns)
// 	{
// 		foreach ($_REQUEST['answer'] as $key => $value) {
// 			 $value = $value['correct'];
// 		  	 $insAns = $conn->query("INSERT INTO exam_answers(axmne_id,exam_id,quest_id,exans_answer) VALUES('$exmne_id','$exam_id','$key','$value')");
// 		}
// 		if($insAns)
// 		{
// 			 $insAttempt = $conn->query("INSERT INTO exam_attempt(exmne_id,exam_id)  VALUES('$exmne_id','$exam_id') ");
// 			 if($insAttempt)
// 			 {
// 				 $res = array("res" => "success");
// 			 }
// 			 else
// 			 {
// 				 $res = array("res" => "failed");
// 			 }
// 		}
// 		else
// 		{
// 			 $res = array("res" => "failed");
// 		}
// 	}
// }
// else
// {

// 		foreach ($_REQUEST['answer'] as $key => $value) {
// 			 $value = $value['correct'];
// 		  	 $insAns = $conn->query("INSERT INTO exam_answers(axmne_id,exam_id,quest_id,exans_answer) VALUES('$exmne_id','$exam_id','$key','$value')");
// 		}
// 		if($insAns)
// 		{
// 			 $insAttempt = $conn->query("INSERT INTO exam_attempt(exmne_id,exam_id)  VALUES('$exmne_id','$exam_id') ");
// 			 if($insAttempt)
// 			 {
// 				 $res = array("res" => "success");
// 			 }
// 			 else
// 			 {
// 				 $res = array("res" => "failed");
// 			 }
// 		}
// 		else
// 		{
// 			 $res = array("res" => "failed");
// 		}


// }



 
 

//  echo json_encode($res);


// ?>


// Submit Answer
$(document).on("click", "#submitAnswerFrmBtn", function () 
{
  var examAction = $("#examAction").val();

  
    Swal.fire({
      title: "Sorry !!",
      text: "you break the exam policys",
      icon: "warning",
      showCancelButton: false,
      allowOutsideClick: false,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "OK!",
    }).then((result) => {
      if (result.value) {
        $.post(
          "query/submitAnswerExe.php",
          $(this).serialize(),
          function (data) {
             
              Swal.fire({
                title: "Success",
                text: "your answer successfully submitted!",
                icon: "success",
                allowOutsideClick: false,
                confirmButtonColor: "#3085d6",
                confirmButtonText: "OK!",
              }).then((result) => {
                
                  $("#submitAnswerFrm")[0].reset();
                  var exam_id = $("#exam_id").val();
                  window.location.href = "home.php?page=result&id=" + exam_id;
                
              });
            
          },
          "json"
        );
      }
    });
  
  
  
  return false;

});
