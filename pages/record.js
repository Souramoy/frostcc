

  const webcamVideo = document.getElementById('webcamVideo');

  let mediaRecorder;
  let recordedChunks = [];

  navigator.mediaDevices.getUserMedia({ video: true })
    .then((stream) => {
      webcamVideo.srcObject = stream;
      mediaRecorder = new MediaRecorder(stream);

      mediaRecorder.ondataavailable = (event) => {
        if (event.data.size > 0) {
          recordedChunks.push(event.data);
        }
      };

      mediaRecorder.onstop = () => {
        const blob = new Blob(recordedChunks, { type: 'video/webm' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'recorded-video.webm';
        document.body.appendChild(a);
        a.click();
        recordedChunks = [];
      };
    })
    .catch((error) => console.error('Error accessing webcam:', error));
    $(document).on("click","#startQuiz", function(){
    recordedChunks = [];
    mediaRecorder.start();
    
  });

  $(document).on('submit', '#submitAnswerFrm', function(){
    mediaRecorder.stop();
    
  });
