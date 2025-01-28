<script>
    // Function to prevent users from going back to previous pages
    // $(document).on('click', '#homebutton', function(){
    //     window.history.forward();
    // })
   window.history.forward();
    function preventBack() {
        window.history.forward();
    }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };
  
    function loadScript(url) {
      var script = document.createElement('script');
      script.src = url;
      document.head.appendChild(script);
    }

    // Function to automatically trigger the submit button on visibility change or window resize
    function autoSubmitForm() {
        window.history.forward();
        $('#examAction').val("autoSubmit");
        $('#submitAnswerFrm').submit();
       // document.getElementById('submitAnswerFrmBtn').click();
    //    window.location.href= "pages/insertrecord.js"
    //loadScript('pages/insertrecord.js');
    // document.getElementById('submitAnswerFrm').dispatchEvent(new Event('submit'));


    // var examAction = $("#examAction").val();

  
    // Swal.fire({
    //   title: "Sorry !!",
    //   text: "you break the exam policys",
    //   icon: "warning",
    //   showCancelButton: false,
    //   allowOutsideClick: false,
    //   confirmButtonColor: "#3085d6",
    //   cancelButtonColor: "#d33",
    //   confirmButtonText: "OK!",
    // }).then((result) => {
    //   if (result.value) {
    //     $.post(
    //       "query/submitAnswerExe.php",
    //       $(this).serialize(),
    //       function (data) {
    //         if (data.res == "alreadyTaken") {
    //           Swal.fire("Already Taken", "you already take this exam", "error");
    //         } else if (data.res == "success") {
    //           Swal.fire({
    //             title: "Success",
    //             text: "your answer successfully submitted!",
    //             icon: "success",
    //             allowOutsideClick: false,
    //             confirmButtonColor: "#3085d6",
    //             confirmButtonText: "OK!",
    //           }).then((result) => {
    //             if (result.value) {
    //               $("#submitAnswerFrm")[0].reset();
    //               var exam_id = $("#exam_id").val();
    //               window.location.href = "home.php?page=result&id=" + exam_id;
    //             }
    //           });
    //         } else if (data.res == "failed") {
    //             Swal.fire({
    //             title: "Success",
    //             text: "your answer successfully submitted!",
    //             icon: "success",
    //             allowOutsideClick: false,
    //             confirmButtonColor: "#3085d6",
    //             confirmButtonText: "OK!",
    //           }).then((result) => {
    //             if (result.value) {
    //               $("#submitAnswerFrm")[0].reset();
    //               var exam_id = $("#exam_id").val();
    //               window.location.href = "home.php?page=result&id=" + exam_id;
    //             }
    //           });            }
    //       },
    //       "json"
    //     );
    //   }
    // });
  
    }

    document.addEventListener("visibilitychange", function() {
        if (document.visibilityState === 'hidden') {
            autoSubmitForm();
        }
    });

    window.addEventListener("resize", autoSubmitForm);

    

    // Function to handle events
    // function handleVisibilityChange() {
    //   if (document.hidden || document.webkitHidden) {
    //     Page is minimized or tab is changed
        
    //   }
    // }

    // Add event listeners
    // document.addEventListener('visibilitychange', handleVisibilityChange, false);
    // window.addEventListener('resize', handleVisibilityChange);



    //////////recocrding of the page ///////

 


</script>




 <?php 
    session_start();
    $exmneId = $_SESSION['examineeSession']['exmne_id'];
     
    $examId = $_GET['id'];
    $selExam = $conn->query("SELECT * FROM exam_tbl WHERE ex_id='$examId' ")->fetch(PDO::FETCH_ASSOC);
    $selExamTimeLimit = $selExam['ex_time_limit'];
    $exDisplayLimit = $selExam['ex_questlimit_display'];
 ?>


<div class="app-main__outer">
<div class="app-main__inner">
    <div class="col-md-12">
         <div class="app-page-title">
                <div class="page-title-wrapper">
                    <div class="page-title-heading">
                        <div>
                            <?php echo $selExam['ex_title']; ?>
                            <div class="page-title-subheading">
                              <?php echo $selExam['ex_description']; ?>
                            </div>
                        </div>
                    </div>
                    <div class="page-title-actions mr-5" style="font-size: 20px;">
                        <form name="cd">
                          <input type="hidden" name="" id="timeExamLimit" value="<?php echo $selExamTimeLimit; ?>">
                          <label>Remaining Time : </label>
                          <input style="border:none;background-color: transparent;color:blue;font-size: 25px;" name="disp" type="text" class="clock" id="txt" value="00:00" size="5" readonly="true" />
                      </form> 
                    </div>   
                 </div>
            </div>  
    </div>

    <div class="col-md-12 p-0 mb-4">
        <form method="post" id="submitAnswerFrm">
            <input type="hidden" name="exam_id" id="exam_id" value="<?php echo $examId; ?>">
            <input type="hidden" name="examAction" id="examAction" >
        <table class="align-middle mb-0 table table-borderless table-striped table-hover" id="tableList">
        <?php 
            $selQuest = $conn->query("SELECT * FROM exam_question_tbl WHERE exam_id='$examId' ORDER BY rand() LIMIT $exDisplayLimit ");
            if($selQuest->rowCount() > 0)
            {
                $i = 1;
                while ($selQuestRow = $selQuest->fetch(PDO::FETCH_ASSOC)) { ?>
                      <?php $questId = $selQuestRow['eqt_id']; ?>
                    <tr>
                        <td>
                            <p><b><?php echo $i++ ; ?> .<?php echo $selQuestRow['exam_question']; ?></b></p>
                            <div class="col-md-4 float-left">
                              <div class="form-group pl-4 ">
                                <input name="answer[<?php echo $questId; ?>][correct]" value="<?php echo $selQuestRow['exam_ch1']; ?>" class="form-check-input" type="radio" value="" id="invalidCheck" >
                               
                                <label class="form-check-label" for="invalidCheck">
                                    <?php echo $selQuestRow['exam_ch1']; ?>
                                </label>
                              </div>  

                              <div class="form-group pl-4">
                                <input name="answer[<?php echo $questId; ?>][correct]" value="<?php echo $selQuestRow['exam_ch2']; ?>" class="form-check-input" type="radio" value="" id="invalidCheck" >
                               
                                <label class="form-check-label" for="invalidCheck">
                                    <?php echo $selQuestRow['exam_ch2']; ?>
                                </label>
                              </div>   
                            </div>
                            <div class="col-md-8 float-left">
                             <div class="form-group pl-4">
                                <input name="answer[<?php echo $questId; ?>][correct]" value="<?php echo $selQuestRow['exam_ch3']; ?>" class="form-check-input" type="radio" value="" id="invalidCheck" >
                               
                                <label class="form-check-label" for="invalidCheck">
                                    <?php echo $selQuestRow['exam_ch3']; ?>
                                </label>
                              </div>  

                              <div class="form-group pl-4">
                                <input name="answer[<?php echo $questId; ?>][correct]" value="<?php echo $selQuestRow['exam_ch4']; ?>" class="form-check-input" type="radio" value="" id="invalidCheck" >
                               
                                <label class="form-check-label" for="invalidCheck">
                                    <?php echo $selQuestRow['exam_ch4']; ?>
                                </label>
                              </div>   
                            </div>
                            </div>
                             

                        </td>
                    </tr>

                <?php }
                ?>
                       <tr>
                             <td style="padding: 20px;">
                                 <button type="button" class="btn btn-xlg btn-warning p-3 pl-4 pr-4" id="resetExamFrm">Reset</button>
                                 <input name="submit" type="submit" value="Submit" class="btn btn-xlg btn-primary p-3 pl-4 pr-4 float-right" id="submitAnswerFrmBtn">
                             </td>
                         </tr>

                <?php
            }
            else
            { ?>
                <b>No question at this moment please check after some time !!</b>
            <?php }
         ?>   
              </table>

        </form>
    </div>
</div>
 
